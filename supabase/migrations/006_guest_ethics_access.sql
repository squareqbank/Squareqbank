-- ============================================================
-- Square QBank — Guest (anonymous) access, limited to Medical Ethics
--
-- Guests use the public anon key and are never signed in, so the existing
-- "authenticated only" policies hide everything from them. These policies
-- grant the anon role SELECT access scoped to the Medical Ethics subject
-- only — its subject row, its lectures, and its active questions.
--
-- Authenticated users are unaffected (they keep full access via the
-- existing policies; these new policies target the `anon` role explicitly).
--
-- Run in the Supabase SQL Editor after 001_schema.sql.
-- ============================================================

drop policy if exists "subjects: guest ethics read"  on public.subjects;
drop policy if exists "lectures: guest ethics read"   on public.lectures;
drop policy if exists "questions: guest ethics read"  on public.questions;

create policy "subjects: guest ethics read"
  on public.subjects for select
  to anon
  using (id = 'ethics');

create policy "lectures: guest ethics read"
  on public.lectures for select
  to anon
  using (subject_id = 'ethics');

create policy "questions: guest ethics read"
  on public.questions for select
  to anon
  using (subject_id = 'ethics' and is_active = true);
