-- ============================================================
-- Square QBank — Fix admin_create_student function
-- Run this in Supabase SQL Editor AFTER 001_schema.sql
-- ============================================================

create or replace function public.admin_create_student(
  p_username  text,
  p_full_name text,
  p_password  text,
  p_stage     int default 5
) returns jsonb language plpgsql security definer as $$
declare
  v_user_id uuid;
  v_email   text := p_username || '@squareqbank.local';
begin
  if not public.is_admin() then
    raise exception 'Only admins can create students';
  end if;

  -- Check if user already exists
  select id into v_user_id from auth.users where email = v_email limit 1;

  if v_user_id is not null then
    -- Update existing profile
    update public.profiles
    set full_name = p_full_name, stage = p_stage, updated_at = now()
    where id = v_user_id;
    return jsonb_build_object('id', v_user_id, 'status', 'updated');
  end if;

  -- Create new auth user with all required fields
  v_user_id := gen_random_uuid();

  insert into auth.users (
    instance_id,
    id,
    aud,
    role,
    email,
    encrypted_password,
    email_confirmed_at,
    last_sign_in_at,
    raw_app_meta_data,
    raw_user_meta_data,
    is_super_admin,
    created_at,
    updated_at,
    confirmation_token,
    recovery_token,
    email_change_token_new,
    email_change
  ) values (
    '00000000-0000-0000-0000-000000000000',
    v_user_id,
    'authenticated',
    'authenticated',
    v_email,
    crypt(p_password, gen_salt('bf')),
    now(),                        -- email already confirmed
    now(),
    '{"provider":"email","providers":["email"]}'::jsonb,
    jsonb_build_object(
      'username',  p_username,
      'full_name', p_full_name,
      'role',      'student'
    ),
    false,
    now(),
    now(),
    '',
    '',
    '',
    ''
  );

  -- The trigger handle_new_user fires and creates the profile row.
  -- Update it immediately with extra fields.
  update public.profiles
  set full_name = p_full_name, stage = p_stage, updated_at = now()
  where id = v_user_id;

  return jsonb_build_object('id', v_user_id, 'status', 'created');
end;
$$;

-- ============================================================
-- Bulk create helper: pass an array of student records
-- Usage:
--   select admin_create_students('[
--     {"username":"ahmed.r","full_name":"Ahmed Al-Rashid","password":"pass123","stage":5},
--     {"username":"sara.k","full_name":"Sara Khalid","password":"pass456","stage":4}
--   ]'::jsonb);
-- ============================================================
create or replace function public.admin_create_students(p_students jsonb)
returns jsonb language plpgsql security definer as $$
declare
  v_student  jsonb;
  v_result   jsonb;
  v_results  jsonb := '[]'::jsonb;
begin
  if not public.is_admin() then
    raise exception 'Only admins can create students';
  end if;

  for v_student in select * from jsonb_array_elements(p_students)
  loop
    begin
      v_result := public.admin_create_student(
        v_student->>'username',
        v_student->>'full_name',
        v_student->>'password',
        coalesce((v_student->>'stage')::int, 5)
      );
      v_results := v_results || jsonb_build_array(
        v_result || jsonb_build_object('username', v_student->>'username', 'error', null)
      );
    exception when others then
      v_results := v_results || jsonb_build_array(
        jsonb_build_object('username', v_student->>'username', 'status', 'error', 'error', sqlerrm)
      );
    end;
  end loop;

  return v_results;
end;
$$;
