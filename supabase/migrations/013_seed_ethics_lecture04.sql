-- ============================================================
-- Square QBank - Seed: Medical Ethics, Lecture 4 (Interprofessional Relationships)
-- 5 True/False questions.
-- ============================================================

alter table public.questions add column if not exists image_url text;

delete from public.questions where lecture_id = 'et-04';

insert into public.questions
  (subject_id, lecture_id, tag, stem, option_a, option_b, option_c, option_d, option_e, answer, explanation, image_url)
values
  ('ethics', 'et-04', 'Interprofessional Relationships', 'The primary obligation in the relationships among doctors is patient safety.', 'True', 'False', '', '', '', 0, 'Patient safety is the primary obligation governing interprofessional relationships.', null),
  ('ethics', 'et-04', 'Interprofessional Relationships', 'Referring a patient only for financial gain violates beneficence.', 'True', 'False', '', '', '', 1, 'It violates professional ethics.', null),
  ('ethics', 'et-04', 'Interprofessional Relationships', 'Unjust criticism of a colleague in front of a patient violates confidentiality.', 'True', 'False', '', '', '', 1, 'It violates professional integrity.', null),
  ('ethics', 'et-04', 'Interprofessional Relationships', 'A junior doctor notices a senior colleague prescribing an unsafe dose; the first step is to escalate the situation.', 'True', 'False', '', '', '', 1, 'First discuss it privately and try to protect patient safety; escalate only if necessary.', null),
  ('ethics', 'et-04', 'Interprofessional Relationships', 'A nurse questions a physician''s medication order and is ignored. The main ethical principle violated is respect.', 'True', 'False', '', '', '', 0, 'Ignoring a valid, good-faith concern violates respect within the team and endangers patient safety.', null);
