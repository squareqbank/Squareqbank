-- ============================================================
-- Square QBank - Seed: Medical Ethics, Lecture 7 (Informed Consent)
-- 16 True/False questions.
-- ============================================================

alter table public.questions add column if not exists image_url text;

delete from public.questions where lecture_id = 'et-07';

insert into public.questions
  (subject_id, lecture_id, tag, stem, option_a, option_b, option_c, option_d, option_e, answer, explanation, image_url)
values
  ('ethics', 'et-07', 'Informed Consent', 'Capacity is decision-specific but not time-specific.', 'True', 'False', '', '', '', 1, 'Capacity is both decision-specific and time-specific.', null),
  ('ethics', 'et-07', 'Informed Consent', 'Decision-making capacity is temporary and reversible.', 'True', 'False', '', '', '', 0, 'Capacity can fluctuate over time, so it may be temporary and reversible.', null),
  ('ethics', 'et-07', 'Informed Consent', 'Lack of informed consent may be legally considered negligence.', 'True', 'False', '', '', '', 1, 'Performing a procedure without informed consent is legally considered assault, not negligence.', null),
  ('ethics', 'et-07', 'Informed Consent', 'Research is usually justified by the benefit it provides to the participants.', 'True', 'False', '', '', '', 1, 'Research may not directly benefit the participant; its justification is the value of the knowledge gained.', null),
  ('ethics', 'et-07', 'Informed Consent', 'Research is a doctor-patient relationship.', 'True', 'False', '', '', '', 1, 'It is a researcher-participant relationship, not a doctor-patient relationship.', null),
  ('ethics', 'et-07', 'Informed Consent', 'Minimal-risk studies do not need to be approved by an ethics committee.', 'True', 'False', '', '', '', 1, 'Minimal-risk studies may still require approval by an ethics committee.', null),
  ('ethics', 'et-07', 'Informed Consent', 'Research consent may be waived, but only under strict conditions such as emergency research.', 'True', 'False', '', '', '', 0, 'A waiver of consent is permitted only under strict conditions (e.g., emergency research).', null),
  ('ethics', 'et-07', 'Informed Consent', 'Therapeutic misconception is when participants mistakenly believe the research is designed for their own personal treatment.', 'True', 'False', '', '', '', 0, 'This is the correct definition of therapeutic misconception.', null),
  ('ethics', 'et-07', 'Informed Consent', 'Students and prisoners require proxy (guardian) consent.', 'True', 'False', '', '', '', 1, 'They consent for themselves; the key concern is voluntariness (freedom from coercion), which matters especially for prisoners, students, and economically disadvantaged patients.', null),
  ('ethics', 'et-07', 'Informed Consent', 'Proxy (guardian) consent is important for vulnerable populations such as children, mentally impaired individuals, and critically ill patients.', 'True', 'False', '', '', '', 0, 'Proxy consent is used for those who cannot consent for themselves.', null),
  ('ethics', 'et-07', 'Informed Consent', 'Every research study must be approved by an ethics committee.', 'True', 'False', '', '', '', 0, 'All research requires ethics committee approval.', null),
  ('ethics', 'et-07', 'Informed Consent', 'Informed consent is always required.', 'True', 'False', '', '', '', 1, 'Consent may not be required in an emergency life-saving situation, when the patient is unconscious with no surrogate, or when there is a public-health threat.', null),
  ('ethics', 'et-07', 'Informed Consent', 'Implied consent may be needed for a minor procedure.', 'True', 'False', '', '', '', 1, 'Implied consent applies to physical examination, not to minor procedures.', null),
  ('ethics', 'et-07', 'Informed Consent', 'Verbal consent may be required for a minor procedure.', 'True', 'False', '', '', '', 0, 'Verbal consent is appropriate for minor procedures.', null),
  ('ethics', 'et-07', 'Informed Consent', 'Anesthesia and surgery may need written consent.', 'True', 'False', '', '', '', 0, 'Major interventions such as anesthesia and surgery require written consent.', null),
  ('ethics', 'et-07', 'Informed Consent', 'Informed consent is a voluntary agreement by a competent patient after receiving adequate information about a medical procedure.', 'True', 'False', '', '', '', 0, 'This is the correct definition of informed consent.', null);
