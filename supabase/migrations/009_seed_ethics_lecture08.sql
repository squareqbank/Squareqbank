-- ============================================================
-- Square QBank - Seed: Medical Ethics, Lecture 8 (Confidentiality)
-- 9 True/False questions.
-- ============================================================

alter table public.questions add column if not exists image_url text;

delete from public.questions where lecture_id = 'et-08';

insert into public.questions
  (subject_id, lecture_id, tag, stem, option_a, option_b, option_c, option_d, option_e, answer, explanation, image_url)
values
  ('ethics', 'et-08', 'Confidentiality', 'Privacy is protection after disclosure.', 'True', 'False', '', '', '', 1, 'Privacy is the patient''s right to control access to their body and personal information (privacy = control).', null),
  ('ethics', 'et-08', 'Confidentiality', 'Confidentiality is control before disclosure.', 'True', 'False', '', '', '', 1, 'Confidentiality is protection of information after it has been shared within a relationship of trust.', null),
  ('ethics', 'et-08', 'Confidentiality', 'Privacy means the patient''s control over their personal information.', 'True', 'False', '', '', '', 0, 'Privacy is the right to control access to one''s own personal information.', null),
  ('ethics', 'et-08', 'Confidentiality', 'A researcher who shares participant data with a colleague not involved in the study is acting ethically.', 'True', 'False', '', '', '', 1, 'This is not ethical; it violates participant confidentiality and trust.', null),
  ('ethics', 'et-08', 'Confidentiality', 'A researcher who stores HIV patients'' names and results on a personal laptop without password protection has violated confidentiality only.', 'True', 'False', '', '', '', 1, 'It violates privacy, data security, and ethical research standards, not confidentiality alone.', null),
  ('ethics', 'et-08', 'Confidentiality', 'Confidentiality is absolute and can never be breached.', 'True', 'False', '', '', '', 1, 'Confidentiality may be breached under specific conditions: suicide risk, threat to others, court orders, or public-health reporting.', null),
  ('ethics', 'et-08', 'Confidentiality', 'HIV status is not considered sensitive information in research.', 'True', 'False', '', '', '', 1, 'HIV status is highly sensitive; like psychiatric illness it carries major social stigma and requires strict confidentiality.', null),
  ('ethics', 'et-08', 'Confidentiality', 'A 24-year-old woman tests positive for HIV and asks the doctor not to tell her husband; the doctor should first tell the husband and then try to obtain the patient''s consent for disclosure.', 'True', 'False', '', '', '', 1, 'Maintain confidentiality initially and seek the patient''s consent first; disclosure may be justified only when needed to prevent serious harm to an identifiable third party.', null),
  ('ethics', 'et-08', 'Confidentiality', 'Fidelity means building trust.', 'True', 'False', '', '', '', 1, 'Fidelity refers to trustworthiness - being faithful and keeping commitments and promises.', null);
