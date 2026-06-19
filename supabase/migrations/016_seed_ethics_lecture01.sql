-- ============================================================
-- Square QBank - Seed: Medical Ethics, Lecture 1 (Principles)
-- 17 True/False questions.
-- ============================================================

alter table public.questions add column if not exists image_url text;

delete from public.questions where lecture_id = 'et-01';

insert into public.questions
  (subject_id, lecture_id, tag, stem, option_a, option_b, option_c, option_d, option_e, answer, explanation, image_url)
values
  ('ethics', 'et-01', 'Principles', 'A competent adult refuses a life-saving blood transfusion due to religious belief. The doctor should not respect the patient''s decision, as it conflicts with beneficence.', 'True', 'False', '', '', '', 1, 'The doctor should respect autonomy, because the patient is a competent adult making an informed refusal.', null),
  ('ethics', 'et-01', 'Principles', 'No discrimination and equal treatment is an example of justice.', 'True', 'False', '', '', '', 0, 'Equal, non-discriminatory treatment reflects the principle of justice.', null),
  ('ethics', 'et-01', 'Principles', 'Non-maleficence is a positive duty that requires you to actively perform an action to help someone in need.', 'True', 'False', '', '', '', 1, 'Non-maleficence is a negative duty - it requires you to refrain from actions that may cause harm.', null),
  ('ethics', 'et-01', 'Principles', 'Beneficence is a positive duty that requires you to actively perform an action to help someone in need.', 'True', 'False', '', '', '', 0, 'Correct - beneficence is a positive duty.', null),
  ('ethics', 'et-01', 'Principles', 'Preventing harm is an example of beneficence.', 'True', 'False', '', '', '', 0, 'Acting to prevent harm is beneficence.', null),
  ('ethics', 'et-01', 'Principles', 'Risk-versus-benefit analysis is an example of beneficence.', 'True', 'False', '', '', '', 1, 'It is mainly a matter of non-maleficence.', null),
  ('ethics', 'et-01', 'Principles', 'Avoiding unnecessary harm is an example of beneficence.', 'True', 'False', '', '', '', 1, 'It is a matter of non-maleficence.', null),
  ('ethics', 'et-01', 'Principles', 'A physician who gives the wrong medication to a patient due to carelessness is an example of a breach of non-maleficence.', 'True', 'False', '', '', '', 0, 'Carelessly causing harm concerns non-maleficence - the duty to avoid harm.', null),
  ('ethics', 'et-01', 'Principles', 'The right of the patient to refuse treatment is an example of autonomy.', 'True', 'False', '', '', '', 0, 'Refusing treatment is an exercise of autonomy.', null),
  ('ethics', 'et-01', 'Principles', 'For years in the healthcare profession, the doctor-patient relationship was grounded in paternalism.', 'True', 'False', '', '', '', 0, 'Historically the relationship was grounded in paternalism.', null),
  ('ethics', 'et-01', 'Principles', 'Medical ethics is a system of legal rules enforceable by courts to regulate medical practice.', 'True', 'False', '', '', '', 1, 'Medical ethics is a system of moral principles that apply values and judgments to the practice of medicine.', null),
  ('ethics', 'et-01', 'Principles', 'Ethics and law are identical concepts with the same standards and enforcement mechanisms.', 'True', 'False', '', '', '', 1, 'Ethics are moral principles that may vary culturally; laws are legal rules fixed within a country and enforceable by courts.', null),
  ('ethics', 'et-01', 'Principles', 'Ethics describes what is permitted, while law evaluates what is right.', 'True', 'False', '', '', '', 1, 'Ethics evaluates what is right; law describes what is permitted.', null),
  ('ethics', 'et-01', 'Principles', 'Ethics represents a higher moral standard than law.', 'True', 'False', '', '', '', 0, 'Ethics is a higher moral standard; law is the minimum standard.', null),
  ('ethics', 'et-01', 'Principles', 'Law represents a higher moral standard than ethics.', 'True', 'False', '', '', '', 1, 'Ethics represents a higher moral standard; law is the minimum standard.', null),
  ('ethics', 'et-01', 'Principles', 'The four basic principles of medical ethics are autonomy, beneficence, non-maleficence, and justice.', 'True', 'False', '', '', '', 0, 'These are the four basic principles of medical ethics.', null),
  ('ethics', 'et-01', 'Principles', 'Autonomy means the doctor should make all decisions for the patient''s own good.', 'True', 'False', '', '', '', 1, 'Autonomy respects the patient''s right to self-determination; the paternalistic model has the doctor making decisions.', null);
