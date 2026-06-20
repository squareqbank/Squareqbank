-- ============================================================
-- Square QBank — Patch: Ethics question corrections
-- ------------------------------------------------------------
-- Unlike the 007/009 *seed* edits (which only run on a fresh DB),
-- this migration mutates existing rows / adds a row, so it can be
-- applied to the already-seeded production database. It is idempotent.
-- ============================================================

-- L08 Confidentiality: fix the "Fidelity" answer key (was False, should be True).
update public.questions
set answer = 0,
    explanation = 'Fidelity is about trustworthiness - being faithful, building trust, and keeping commitments and promises.'
where lecture_id = 'et-08'
  and stem = 'Fidelity means building trust.';

-- L10 End-of-Life Ethics: add the double-effect True/False question (only if absent).
insert into public.questions
  (subject_id, lecture_id, tag, stem, option_a, option_b, option_c, option_d, option_e, answer, explanation, image_url)
select
  'ethics', 'et-10', 'End-of-Life Ethics',
  'The principle of double effect is intended to relieve suffering and to intentionally shorten life.',
  'True', 'False', '', '', '', 1,
  'The intention is only to relieve suffering; the treatment may unintentionally (not intentionally) shorten life.',
  null
where not exists (
  select 1 from public.questions
  where lecture_id = 'et-10'
    and stem = 'The principle of double effect is intended to relieve suffering and to intentionally shorten life.'
);
