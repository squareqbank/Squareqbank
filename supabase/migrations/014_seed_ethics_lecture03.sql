-- ============================================================
-- Square QBank - Seed: Medical Ethics, Lecture 3 (Doctor-Patient Relationship)
-- 6 True/False questions.
-- ============================================================

alter table public.questions add column if not exists image_url text;

delete from public.questions where lecture_id = 'et-03';

insert into public.questions
  (subject_id, lecture_id, tag, stem, option_a, option_b, option_c, option_d, option_e, answer, explanation, image_url)
values
  ('ethics', 'et-03', 'Doctor-Patient Relationship', 'A patient with depression refuses medication but understands the consequences. The doctor should force medication.', 'True', 'False', '', '', '', 1, 'The doctor should respect the refusal, because the patient has decision-making capacity.', null),
  ('ethics', 'et-03', 'Doctor-Patient Relationship', 'A doctor fails to disclose a surgical complication to avoid legal issues. This primarily violates veracity.', 'True', 'False', '', '', '', 0, 'Failing to disclose violates veracity (the duty of truth-telling).', null),
  ('ethics', 'et-03', 'Doctor-Patient Relationship', 'A doctor who develops an emotional relationship with a vulnerable patient is not considered an ethical issue.', 'True', 'False', '', '', '', 1, 'It is a boundary violation; maintain professional limits and seek supervision.', null),
  ('ethics', 'et-03', 'Doctor-Patient Relationship', 'A patient refuses a life-saving treatment due to cultural belief; forced treatment would be ethical.', 'True', 'False', '', '', '', 1, 'Respect autonomy and cultural diversity, acknowledging the patient''s values and beliefs.', null),
  ('ethics', 'et-03', 'Doctor-Patient Relationship', 'Fidelity means fair treatment.', 'True', 'False', '', '', '', 1, 'Fidelity means being honest and keeping promises.', null),
  ('ethics', 'et-03', 'Doctor-Patient Relationship', 'Cultural sensitivity means agreeing with every belief of the patient.', 'True', 'False', '', '', '', 1, 'Cultural sensitivity means understanding and respecting differences without discrimination or judgment.', null);
