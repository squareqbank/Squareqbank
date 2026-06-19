-- ============================================================
-- Square QBank - Seed: Medical Ethics, Lecture 6 (Research Ethics)
-- 14 True/False questions.
-- ============================================================

alter table public.questions add column if not exists image_url text;

delete from public.questions where lecture_id = 'et-06';

insert into public.questions
  (subject_id, lecture_id, tag, stem, option_a, option_b, option_c, option_d, option_e, answer, explanation, image_url)
values
  ('ethics', 'et-06', 'Research Ethics', 'A researcher publishes data that was made up to make the results look more significant. This type of research misconduct is falsification.', 'True', 'False', '', '', '', 1, 'This is fabrication (making up data that never existed); falsification is altering or manipulating real data.', null),
  ('ethics', 'et-06', 'Research Ethics', 'A clinical trial is conducted only on a poor rural population because they are easily accessible. The ethical principle violated is justice.', 'True', 'False', '', '', '', 0, 'Justice requires fair selection of research participants and avoidance of exploiting vulnerable groups.', null),
  ('ethics', 'et-06', 'Research Ethics', 'A researcher plans to test a new drug on patients but does not tell them the treatment is experimental. The main ethical principle violated is justice.', 'True', 'False', '', '', '', 1, 'The main principle violated is informed consent; participants must understand the risks and benefits before agreeing.', null),
  ('ethics', 'et-06', 'Research Ethics', 'Using another researcher''s work without citation is called falsification.', 'True', 'False', '', '', '', 1, 'Using another''s work without citation is plagiarism.', null),
  ('ethics', 'et-06', 'Research Ethics', 'The document that introduced the principles of respect for persons, beneficence, and justice is the Nuremberg Code.', 'True', 'False', '', '', '', 1, 'These three principles come from the Belmont Report.', null),
  ('ethics', 'et-06', 'Research Ethics', 'A researcher testing a drug manufactured by a company they own shares in may not need to declare a conflict of interest.', 'True', 'False', '', '', '', 1, 'The researcher must declare the conflict of interest to ensure transparency.', null),
  ('ethics', 'et-06', 'Research Ethics', 'Fabrication is making up data that never existed.', 'True', 'False', '', '', '', 0, 'This is the correct definition of fabrication.', null),
  ('ethics', 'et-06', 'Research Ethics', 'Falsification is manipulating or altering research data.', 'True', 'False', '', '', '', 0, 'This is the correct definition of falsification.', null),
  ('ethics', 'et-06', 'Research Ethics', 'No research involving humans should begin without ethical approval.', 'True', 'False', '', '', '', 0, 'Ethical approval is required before any human research begins.', null),
  ('ethics', 'et-06', 'Research Ethics', 'Patient records used in research should not reveal identity.', 'True', 'False', '', '', '', 0, 'Patient identity must be protected through anonymization or de-identification.', null),
  ('ethics', 'et-06', 'Research Ethics', 'Poor communities should be used in research because they are easily accessible.', 'True', 'False', '', '', '', 1, 'This violates justice, which requires fair selection and treatment of research participants.', null),
  ('ethics', 'et-06', 'Research Ethics', 'Avoiding exposing participants to unnecessary risk is the core principle of non-maleficence.', 'True', 'False', '', '', '', 0, 'Researchers must avoid causing harm to participants (non-maleficence).', null),
  ('ethics', 'et-06', 'Research Ethics', 'Ensuring safety monitoring when testing a new drug is an example of non-maleficence.', 'True', 'False', '', '', '', 1, 'This is beneficence - the researcher is maximizing benefit and minimizing harm.', null),
  ('ethics', 'et-06', 'Research Ethics', 'Voluntary informed consent and the avoidance of unnecessary suffering are defined in the Belmont Report.', 'True', 'False', '', '', '', 1, 'These are defined in the Nuremberg Code (1947).', null);
