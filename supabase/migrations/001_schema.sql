-- ============================================================
-- Square QBank — Initial Schema
-- ============================================================

-- ── Extensions ───────────────────────────────────────────────
create extension if not exists "pgcrypto";

-- ── Profiles (extends auth.users) ────────────────────────────
create table public.profiles (
  id               uuid primary key references auth.users(id) on delete cascade,
  username         text unique not null,
  full_name        text not null default '',
  role             text not null default 'student'
                     check (role in ('student', 'admin')),
  stage            int  not null default 5,
  device_fp        text,           -- browser fingerprint
  device_locked_at timestamptz,
  is_active        boolean not null default true,
  created_at       timestamptz not null default now(),
  updated_at       timestamptz not null default now()
);

-- ── Subjects ─────────────────────────────────────────────────
create table public.subjects (
  id         text primary key,
  name       text not null,
  hue        int  not null default 255,
  sort_order int  not null default 0,
  is_active  boolean not null default true
);

-- ── Lectures ─────────────────────────────────────────────────
create table public.lectures (
  id         text primary key,
  subject_id text not null references public.subjects(id) on delete cascade,
  name       text not null,
  sort_order int  not null default 0,
  is_active  boolean not null default true
);

-- ── Questions ────────────────────────────────────────────────
create table public.questions (
  id          uuid primary key default gen_random_uuid(),
  subject_id  text not null references public.subjects(id),
  lecture_id  text not null references public.lectures(id),
  tag         text,
  stem        text not null,
  option_a    text not null,
  option_b    text not null,
  option_c    text not null,
  option_d    text not null,
  option_e    text not null,
  answer      int  not null check (answer between 0 and 4),  -- 0=A … 4=E
  explanation text,
  is_active   boolean not null default true,
  created_by  uuid references auth.users(id),
  created_at  timestamptz not null default now()
);

-- ── Sessions ─────────────────────────────────────────────────
create table public.sessions (
  id               uuid primary key default gen_random_uuid(),
  user_id          uuid not null references auth.users(id) on delete cascade,
  subject_id       text references public.subjects(id),
  lecture_id       text references public.lectures(id),
  mode             text not null check (mode in ('study', 'exam', 'review')),
  label            text,           -- e.g. "Random mixed exam"
  status           text not null default 'active'
                     check (status in ('active', 'completed', 'abandoned')),
  total_questions  int  not null default 0,
  answered         int  not null default 0,
  correct          int  not null default 0,
  started_at       timestamptz not null default now(),
  completed_at     timestamptz
);

-- ── Session answers ──────────────────────────────────────────
create table public.session_answers (
  id          uuid primary key default gen_random_uuid(),
  session_id  uuid not null references public.sessions(id) on delete cascade,
  question_id uuid not null references public.questions(id),
  selected    int  check (selected between 0 and 4),
  is_correct  boolean,
  answered_at timestamptz not null default now()
);

-- ── Question flags ───────────────────────────────────────────
create table public.question_flags (
  user_id     uuid not null references auth.users(id) on delete cascade,
  question_id uuid not null references public.questions(id) on delete cascade,
  flagged_at  timestamptz not null default now(),
  primary key (user_id, question_id)
);

-- ============================================================
-- Row Level Security
-- ============================================================

alter table public.profiles       enable row level security;
alter table public.subjects        enable row level security;
alter table public.lectures        enable row level security;
alter table public.questions       enable row level security;
alter table public.sessions        enable row level security;
alter table public.session_answers enable row level security;
alter table public.question_flags  enable row level security;

-- helper: is the current user an admin?
create or replace function public.is_admin()
returns boolean language sql security definer stable as $$
  select exists (
    select 1 from public.profiles
    where id = auth.uid() and role = 'admin'
  );
$$;

-- ── profiles ─────────────────────────────────────────────────
create policy "profiles: own read"
  on public.profiles for select
  using (auth.uid() = id);

create policy "profiles: admin read all"
  on public.profiles for select
  using (public.is_admin());

create policy "profiles: own update"
  on public.profiles for update
  using (auth.uid() = id)
  with check (
    auth.uid() = id
    -- students cannot promote themselves
    and (public.is_admin() or role = 'student')
  );

create policy "profiles: admin update all"
  on public.profiles for update
  using (public.is_admin());

create policy "profiles: admin insert"
  on public.profiles for insert
  with check (public.is_admin());

-- ── subjects ─────────────────────────────────────────────────
create policy "subjects: authenticated read"
  on public.subjects for select
  using (auth.role() = 'authenticated');

create policy "subjects: admin write"
  on public.subjects for all
  using (public.is_admin());

-- ── lectures ─────────────────────────────────────────────────
create policy "lectures: authenticated read"
  on public.lectures for select
  using (auth.role() = 'authenticated');

create policy "lectures: admin write"
  on public.lectures for all
  using (public.is_admin());

-- ── questions ────────────────────────────────────────────────
create policy "questions: authenticated read"
  on public.questions for select
  using (auth.role() = 'authenticated' and is_active = true);

create policy "questions: admin write"
  on public.questions for all
  using (public.is_admin());

-- ── sessions ─────────────────────────────────────────────────
create policy "sessions: own read/write"
  on public.sessions for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

create policy "sessions: admin read all"
  on public.sessions for select
  using (public.is_admin());

-- ── session_answers ──────────────────────────────────────────
create policy "session_answers: own read/write"
  on public.session_answers for all
  using (
    exists (
      select 1 from public.sessions
      where id = session_id and user_id = auth.uid()
    )
  );

create policy "session_answers: admin read all"
  on public.session_answers for select
  using (public.is_admin());

-- ── question_flags ───────────────────────────────────────────
create policy "flags: own read/write"
  on public.question_flags for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

create policy "flags: admin read all"
  on public.question_flags for select
  using (public.is_admin());

-- ============================================================
-- Functions
-- ============================================================

-- Auto-create profile on sign-up
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer as $$
begin
  insert into public.profiles (id, username, full_name, role)
  values (
    new.id,
    coalesce(new.raw_user_meta_data->>'username', split_part(new.email, '@', 1)),
    coalesce(new.raw_user_meta_data->>'full_name', ''),
    coalesce(new.raw_user_meta_data->>'role', 'student')
  );
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- updated_at trigger
create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin new.updated_at = now(); return new; end;
$$;

create trigger profiles_updated_at
  before update on public.profiles
  for each row execute procedure public.set_updated_at();

-- Admin: create a student account (called from admin panel)
create or replace function public.admin_create_student(
  p_username  text,
  p_full_name text,
  p_password  text,
  p_stage     int default 5
) returns uuid language plpgsql security definer as $$
declare
  v_user_id uuid;
begin
  if not public.is_admin() then
    raise exception 'Only admins can create students';
  end if;

  -- create auth user
  v_user_id := (
    select id from auth.users
    where email = p_username || '@squareqbank.local'
    limit 1
  );

  if v_user_id is null then
    insert into auth.users (
      instance_id, id, aud, role, email, encrypted_password,
      email_confirmed_at, raw_user_meta_data, created_at, updated_at
    ) values (
      '00000000-0000-0000-0000-000000000000',
      gen_random_uuid(),
      'authenticated',
      'authenticated',
      p_username || '@squareqbank.local',
      crypt(p_password, gen_salt('bf')),
      now(),
      jsonb_build_object('username', p_username, 'full_name', p_full_name, 'role', 'student'),
      now(),
      now()
    ) returning id into v_user_id;
  end if;

  -- update profile
  update public.profiles
  set full_name = p_full_name, stage = p_stage
  where id = v_user_id;

  return v_user_id;
end;
$$;

-- Admin: reset device lock
create or replace function public.admin_reset_device(p_user_id uuid)
returns void language plpgsql security definer as $$
begin
  if not public.is_admin() then
    raise exception 'Only admins can reset devices';
  end if;
  update public.profiles
  set device_fp = null, device_locked_at = null
  where id = p_user_id;
end;
$$;

-- Student: lock device on first login
create or replace function public.lock_device(p_fp text)
returns jsonb language plpgsql security definer as $$
declare
  v_profile public.profiles;
begin
  select * into v_profile from public.profiles where id = auth.uid();

  if v_profile.device_fp is null then
    -- first login — register device
    update public.profiles
    set device_fp = p_fp, device_locked_at = now()
    where id = auth.uid();
    return jsonb_build_object('status', 'registered');
  elsif v_profile.device_fp = p_fp then
    return jsonb_build_object('status', 'ok');
  else
    return jsonb_build_object('status', 'locked');
  end if;
end;
$$;

-- Analytics: per-user subject accuracy
create or replace function public.get_subject_accuracy(p_user_id uuid default null)
returns table (
  subject_id   text,
  subject_name text,
  total        bigint,
  correct      bigint,
  accuracy     numeric
) language sql security definer stable as $$
  select
    q.subject_id,
    s.name as subject_name,
    count(*) as total,
    sum(case when sa.is_correct then 1 else 0 end) as correct,
    round(
      100.0 * sum(case when sa.is_correct then 1 else 0 end) / nullif(count(*), 0), 1
    ) as accuracy
  from public.session_answers sa
  join public.sessions      se on se.id = sa.session_id
  join public.questions      q  on q.id  = sa.question_id
  join public.subjects       s  on s.id  = q.subject_id
  where se.user_id = coalesce(p_user_id, auth.uid())
  group by q.subject_id, s.name;
$$;

-- ============================================================
-- Seed Data
-- ============================================================

insert into public.subjects (id, name, hue, sort_order) values
  ('medicine',  'Medicine',       255, 1),
  ('surgery',   'Surgery',          8, 2),
  ('pediatric', 'Pediatric',       150, 3),
  ('gynae',     'Gynaecology',     330, 4),
  ('ortho',     'Orthopedic',       48, 5),
  ('ent',       'ENT',             200, 6),
  ('ophtha',    'Ophthalmology',   288, 7),
  ('psych',     'Psychiatry',      120, 8),
  ('derma',     'Dermatology',      25, 9),
  ('ethics',    'Medical Ethics',  235, 10)
on conflict do nothing;

insert into public.lectures (id, subject_id, name, sort_order) values
  ('cardio',   'medicine', 'Cardiology',          1),
  ('resp',     'medicine', 'Respiratory',          2),
  ('git',      'medicine', 'Gastroenterology',     3),
  ('endo',     'medicine', 'Endocrinology',        4),
  ('nephro',   'medicine', 'Nephrology',           5),
  ('rheum',    'medicine', 'Rheumatology',         6),
  ('heme',     'medicine', 'Haematology',          7),
  ('id',       'medicine', 'Infectious Diseases',  8),
  ('neuro',    'medicine', 'Neurology',            9)
on conflict do nothing;
