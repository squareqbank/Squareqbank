-- ============================================================
-- Square QBank — Seed Questions (Cardiology)
-- ============================================================

insert into public.questions
  (subject_id, lecture_id, tag, stem, option_a, option_b, option_c, option_d, option_e, answer, explanation)
values
(
  'medicine', 'cardio', 'Cardiology',
  'A 58-year-old man presents with crushing central chest pain radiating to the left arm for 2 hours. ECG shows ST-elevation in leads II, III and aVF. Which coronary artery is most likely occluded?',
  'Left anterior descending', 'Left circumflex', 'Right coronary artery', 'Left main stem', 'Diagonal branch',
  2,
  'ST-elevation in the inferior leads (II, III, aVF) indicates an inferior STEMI, most commonly caused by occlusion of the right coronary artery in a right-dominant circulation.'
),
(
  'medicine', 'cardio', 'Cardiology',
  'Which of the following is the single most appropriate immediate drug to give a patient with an acute ST-elevation myocardial infarction?',
  'Aspirin 300 mg', 'Warfarin', 'Furosemide', 'Digoxin', 'Amiodarone',
  0,
  'Immediate chewed aspirin 300 mg is given as soon as ACS is suspected; it reduces mortality through its antiplatelet effect and is the priority first drug.'
),
(
  'medicine', 'cardio', 'Cardiology',
  'A 72-year-old woman with atrial fibrillation has a CHA₂DS₂-VASc score of 3. What is the recommended long-term management to reduce stroke risk?',
  'No antithrombotic therapy', 'Aspirin alone', 'Oral anticoagulation', 'Clopidogrel alone', 'LMWH for one week only',
  2,
  'A CHA₂DS₂-VASc score of ≥2 warrants long-term oral anticoagulation (e.g. a DOAC or warfarin). Antiplatelet therapy is no longer recommended for stroke prevention in AF.'
),
(
  'medicine', 'cardio', 'Cardiology',
  'A pansystolic murmur best heard at the apex and radiating to the axilla is most characteristic of which valvular lesion?',
  'Aortic stenosis', 'Mitral regurgitation', 'Mitral stenosis', 'Aortic regurgitation', 'Pulmonary stenosis',
  1,
  'Mitral regurgitation produces a pansystolic murmur loudest at the apex that classically radiates to the axilla.'
),
(
  'medicine', 'cardio', 'Cardiology',
  'What is the most common cause of mitral stenosis worldwide?',
  'Congenital valve disease', 'Infective endocarditis', 'Rheumatic heart disease', 'Degenerative calcification', 'Carcinoid syndrome',
  2,
  'Rheumatic heart disease, a sequela of streptococcal rheumatic fever, remains by far the most common cause of mitral stenosis globally.'
),
(
  'medicine', 'cardio', 'Cardiology',
  'A 70-year-old man reports exertional syncope, angina and breathlessness. Examination reveals an ejection systolic murmur radiating to the carotids with a slow-rising pulse. The most likely diagnosis is:',
  'Mitral regurgitation', 'Aortic stenosis', 'Tricuspid regurgitation', 'Ventricular septal defect', 'Mitral valve prolapse',
  1,
  'The triad of syncope, angina and dyspnoea with an ejection systolic murmur radiating to the carotids and a slow-rising pulse is classic for severe aortic stenosis.'
),
(
  'medicine', 'cardio', 'Cardiology',
  'Which class of drug is first-line for symptom control in chronic stable angina?',
  'Beta-blocker', 'Warfarin', 'Digoxin', 'Furosemide', 'Spironolactone',
  0,
  'Beta-blockers (or rate-limiting calcium-channel blockers if beta-blockers are contraindicated) are first-line anti-anginal therapy for symptom control.'
),
(
  'medicine', 'cardio', 'Cardiology',
  'Which ECG finding is the earliest and most characteristic feature of hyperkalaemia?',
  'U waves', 'Tall, tented T waves', 'ST depression', 'Prolonged QT interval', 'Delta wave',
  1,
  'Tall, peaked (tented) T waves are the earliest characteristic ECG change of hyperkalaemia, later followed by widened QRS and loss of P waves.'
);
