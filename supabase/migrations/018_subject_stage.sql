-- ============================================================
-- Square QBank — Per-subject academic stage
--
-- Adds a `stage` column to subjects so the question bank can be split
-- between the 5th-stage and 6th-stage curricula. All existing subjects
-- default to stage 5 (the current 5th-stage content).
--
-- The client filters the student/guest-facing subject list by the
-- selected stage; the admin panel keeps full access to every stage.
--
-- Run in the Supabase SQL Editor after the earlier migrations.
-- ============================================================

alter table public.subjects
  add column if not exists stage int not null default 5
  check (stage between 4 and 6);

-- Existing rows already default to 5 via the column default; make it explicit.
update public.subjects set stage = 5 where stage is null;
