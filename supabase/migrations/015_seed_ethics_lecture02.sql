-- ============================================================
-- Square QBank - Seed: Medical Ethics, Lecture 2 (Social Responsibility of Physicians)
-- 20 True/False questions.
-- ============================================================

alter table public.questions add column if not exists image_url text;

delete from public.questions where lecture_id = 'et-02';

insert into public.questions
  (subject_id, lecture_id, tag, stem, option_a, option_b, option_c, option_d, option_e, answer, explanation, image_url)
values
  ('ethics', 'et-02', 'Social Responsibility of Physicians', 'Prescribing antibiotics for viral infections contributes to societal harm mainly by increasing healthcare costs only.', 'True', 'False', '', '', '', 1, 'It mainly causes harm by promoting antimicrobial resistance.', null),
  ('ethics', 'et-02', 'Social Responsibility of Physicians', 'Social responsibility is both a professional obligation and a professional choice.', 'True', 'False', '', '', '', 0, 'It is regarded as both an obligation and a professional choice.', null),
  ('ethics', 'et-02', 'Social Responsibility of Physicians', 'During epidemics, the physician should always prioritize the individual over society.', 'True', 'False', '', '', '', 1, 'Individual autonomy may be ethically overridden to prevent worse harm; the goal is protection of the public, not punishment of the person.', null),
  ('ethics', 'et-02', 'Social Responsibility of Physicians', 'Isolation and enforced treatment are never necessary.', 'True', 'False', '', '', '', 1, 'Legal isolation or enforced treatment may be necessary as a last resort.', null),
  ('ethics', 'et-02', 'Social Responsibility of Physicians', 'One should always encourage voluntary treatment and temporary isolation - persuasion over coercion.', 'True', 'False', '', '', '', 0, 'Persuasion is preferred over coercion.', null),
  ('ethics', 'et-02', 'Social Responsibility of Physicians', 'One should always explore a patient''s reasons for refusing treatment, such as fear, stigma, or financial concerns.', 'True', 'False', '', '', '', 0, 'Always explore the reasons behind refusal.', null),
  ('ethics', 'et-02', 'Social Responsibility of Physicians', 'TB is not a legally notifiable disease in most health systems.', 'True', 'False', '', '', '', 1, 'TB is a legally notifiable disease in most health systems.', null),
  ('ethics', 'et-02', 'Social Responsibility of Physicians', 'A patient with active TB refuses treatment and insists on returning to work. The doctor orders isolation. This is ethical.', 'True', 'False', '', '', '', 0, 'Isolation is ethical here to protect public health.', null),
  ('ethics', 'et-02', 'Social Responsibility of Physicians', 'A physician must always apply ethical reasoning and professional judgment.', 'True', 'False', '', '', '', 0, 'Ethical reasoning and professional judgment must always be applied.', null),
  ('ethics', 'et-02', 'Social Responsibility of Physicians', 'Ordering an expensive investigation with minimal clinical benefit is an example of an ethical dilemma.', 'True', 'False', '', '', '', 0, 'It represents an ethical dilemma.', null),
  ('ethics', 'et-02', 'Social Responsibility of Physicians', 'Ordering an expensive investigation with minimal clinical benefit violates justice.', 'True', 'False', '', '', '', 0, 'It violates justice (fair use of shared resources).', null),
  ('ethics', 'et-02', 'Social Responsibility of Physicians', 'Advising vaccination despite patient hesitancy is not the role of a doctor.', 'True', 'False', '', '', '', 1, 'Promoting public health is part of a doctor''s role.', null),
  ('ethics', 'et-02', 'Social Responsibility of Physicians', 'Distribution of health resources, equity in access to care, and addressing social determinants of health are all ethical foundations of justice.', 'True', 'False', '', '', '', 0, 'These are foundations of the principle of justice.', null),
  ('ethics', 'et-02', 'Social Responsibility of Physicians', 'Overuse of antibiotics is an example of a breach of the principle of non-maleficence.', 'True', 'False', '', '', '', 0, 'Overuse causes harm (e.g., antimicrobial resistance), which concerns non-maleficence - the duty to avoid harm.', null),
  ('ethics', 'et-02', 'Social Responsibility of Physicians', 'Engaging in disease prevention and health promotion is an example of beneficence.', 'True', 'False', '', '', '', 0, 'Promoting health is beneficence.', null),
  ('ethics', 'et-02', 'Social Responsibility of Physicians', 'Advocating for vulnerable populations is an example of beneficence.', 'True', 'False', '', '', '', 0, 'Advocacy for the vulnerable is beneficence.', null),
  ('ethics', 'et-02', 'Social Responsibility of Physicians', 'Social responsibility refers to a physician''s ethical obligation to act for the benefit of society, promote health, reduce health inequities, and use medical knowledge responsibly.', 'True', 'False', '', '', '', 0, 'This is the correct definition of social responsibility.', null),
  ('ethics', 'et-02', 'Social Responsibility of Physicians', 'Physicians are not encouraged to engage in public advocacy, even though it influences health policy and promotes systemic change.', 'True', 'False', '', '', '', 1, 'Physicians are encouraged to engage in public advocacy to influence health policy and promote systemic change.', null),
  ('ethics', 'et-02', 'Social Responsibility of Physicians', 'Physician social responsibility encompasses the ethical obligation to advocate for public health, address social determinants of health, and engage in activism to promote health equity and justice.', 'True', 'False', '', '', '', 0, 'This is correct.', null),
  ('ethics', 'et-02', 'Social Responsibility of Physicians', 'The role of a healthcare professional is only to provide medical care, not to advocate for the health or well-being of communities.', 'True', 'False', '', '', '', 1, 'The role also includes addressing broader social determinants of health, such as access to care, environmental factors, and social justice.', null);
