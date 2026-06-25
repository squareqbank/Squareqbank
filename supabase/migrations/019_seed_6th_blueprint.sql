-- ============================================================
-- Square QBank — 6th-stage blueprint quiz bank (subjects + lectures)
--
-- The 6th-stage view offers a Quiz mode beside the blueprint checklist.
-- Each blueprint *material* becomes a stage-6 subject and each *core topic*
-- becomes a lecture, so MCQs can be authored per topic through the existing
-- admin panel and served by the existing solver. IDs are deterministic
-- ('bp6_<material>' / 'bp6_<material>_<topicIndex>') and MUST match the ids
-- the client computes in bpSubjId()/bpLecId().
--
-- Generated from BLUEPRINT_6TH in index.html — do not hand-edit the rows.
-- Run in the Supabase SQL Editor after the earlier migrations.
-- ============================================================

insert into public.subjects (id, name, hue, sort_order, stage) values
  ('bp6_med', 'Medicine', 255, 61, 6),
  ('bp6_surgery', 'Surgery', 8, 62, 6),
  ('bp6_gynae', 'Gynaecology & Obstetrics', 330, 63, 6),
  ('bp6_peds', 'Pediatrics', 150, 64, 6)
on conflict (id) do update set name=excluded.name, hue=excluded.hue, sort_order=excluded.sort_order, stage=excluded.stage;

insert into public.lectures (id, subject_id, name, sort_order) values
  ('bp6_med_0', 'bp6_med', 'Cardiovascular (CVS)', 1),
  ('bp6_med_1', 'bp6_med', 'Respiratory', 2),
  ('bp6_med_2', 'bp6_med', 'GIT & Hepatology', 3),
  ('bp6_med_3', 'bp6_med', 'Haematology & Oncology', 4),
  ('bp6_med_4', 'bp6_med', 'Endocrinology & Diabetes', 5),
  ('bp6_med_5', 'bp6_med', 'Neurology', 6),
  ('bp6_med_6', 'bp6_med', 'Nephrology', 7),
  ('bp6_med_7', 'bp6_med', 'Infectious Diseases', 8),
  ('bp6_med_8', 'bp6_med', 'Rheumatology', 9),
  ('bp6_med_9', 'bp6_med', 'Dermatology', 10),
  ('bp6_med_10', 'bp6_med', 'Psychiatry', 11),
  ('bp6_surgery_0', 'bp6_surgery', 'Basic Surgical Principles', 1),
  ('bp6_surgery_1', 'bp6_surgery', 'Paediatric Surgery', 2),
  ('bp6_surgery_2', 'bp6_surgery', 'Peri-operative Care', 3),
  ('bp6_surgery_3', 'bp6_surgery', 'Abdominal Wall, Hernia & Umbilicus', 4),
  ('bp6_surgery_4', 'bp6_surgery', 'Diabetic Foot, Ulcer, Sinus, Fistula & Cyst', 5),
  ('bp6_surgery_5', 'bp6_surgery', 'GIT Surgery', 6),
  ('bp6_surgery_6', 'bp6_surgery', 'ATLS Principles', 7),
  ('bp6_surgery_7', 'bp6_surgery', 'Breast', 8),
  ('bp6_surgery_8', 'bp6_surgery', 'Thyroid & Endocrine Surgery', 9),
  ('bp6_surgery_9', 'bp6_surgery', 'Head & Neck', 10),
  ('bp6_surgery_10', 'bp6_surgery', 'Orthopedics', 11),
  ('bp6_surgery_11', 'bp6_surgery', 'Urology', 12),
  ('bp6_surgery_12', 'bp6_surgery', 'Cardiothoracic & Vascular Surgery', 13),
  ('bp6_surgery_13', 'bp6_surgery', 'Radiology', 14),
  ('bp6_surgery_14', 'bp6_surgery', 'Neurosurgery', 15),
  ('bp6_surgery_15', 'bp6_surgery', 'Anesthesia', 16),
  ('bp6_surgery_16', 'bp6_surgery', 'Plastic & Reconstructive Surgery', 17),
  ('bp6_surgery_17', 'bp6_surgery', 'ENT', 18),
  ('bp6_surgery_18', 'bp6_surgery', 'Ophthalmology', 19),
  ('bp6_gynae_0', 'bp6_gynae', 'Basic & Normal Pregnancy', 1),
  ('bp6_gynae_1', 'bp6_gynae', 'Maternal Medicine', 2),
  ('bp6_gynae_2', 'bp6_gynae', 'Foetal Medicine', 3),
  ('bp6_gynae_3', 'bp6_gynae', 'Birth & Labour', 4),
  ('bp6_gynae_4', 'bp6_gynae', 'Postnatal Care', 5),
  ('bp6_gynae_5', 'bp6_gynae', 'Gynae Basic Science', 6),
  ('bp6_gynae_6', 'bp6_gynae', 'Intersex & Primary Amenorrhea', 7),
  ('bp6_gynae_7', 'bp6_gynae', 'Early Pregnancy Problems', 8),
  ('bp6_gynae_8', 'bp6_gynae', 'Menstruation', 9),
  ('bp6_gynae_9', 'bp6_gynae', 'Urogynecology', 10),
  ('bp6_gynae_10', 'bp6_gynae', 'Benign Conditions of Genital Tract', 11),
  ('bp6_gynae_11', 'bp6_gynae', 'Malignant Conditions of Genital Tract', 12),
  ('bp6_gynae_12', 'bp6_gynae', 'Infertility', 13),
  ('bp6_peds_0', 'bp6_peds', 'Hematology', 1),
  ('bp6_peds_1', 'bp6_peds', 'Neonatology', 2),
  ('bp6_peds_2', 'bp6_peds', 'GIT', 3),
  ('bp6_peds_3', 'bp6_peds', 'CVS', 4),
  ('bp6_peds_4', 'bp6_peds', 'Respiratory System', 5),
  ('bp6_peds_5', 'bp6_peds', 'Infectious Disease', 6),
  ('bp6_peds_6', 'bp6_peds', 'Nephrology', 7),
  ('bp6_peds_7', 'bp6_peds', 'CNS', 8),
  ('bp6_peds_8', 'bp6_peds', 'Endocrine', 9),
  ('bp6_peds_9', 'bp6_peds', 'Genetics', 10),
  ('bp6_peds_10', 'bp6_peds', 'Rheumatology', 11),
  ('bp6_peds_11', 'bp6_peds', 'Immunization', 12),
  ('bp6_peds_12', 'bp6_peds', 'Growth & Development', 13),
  ('bp6_peds_13', 'bp6_peds', 'Others', 14)
on conflict (id) do update set name=excluded.name, sort_order=excluded.sort_order;

-- ── Guest (anon) read access to the 6th-stage blueprint bank ──
drop policy if exists "subjects: guest 6th read"  on public.subjects;
drop policy if exists "lectures: guest 6th read"   on public.lectures;
drop policy if exists "questions: guest 6th read"  on public.questions;

create policy "subjects: guest 6th read"
  on public.subjects for select
  to anon
  using (stage = 6);

create policy "lectures: guest 6th read"
  on public.lectures for select
  to anon
  using (subject_id like 'bp6_%');

create policy "questions: guest 6th read"
  on public.questions for select
  to anon
  using (subject_id like 'bp6_%' and is_active = true);
