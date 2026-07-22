## Context

`cv_app` is a small Flutter portfolio app (~3 lib files) that renders CV
content from a static `CvData` class into five tab screens. Content is
currently lorem-ipsum placeholder from scaffolding. The real CV source is a
PDF (`CV_2026_CarlosPV.pdf`) with free-form prose per job, not structured
data — it needs to be condensed and reshaped to fit the existing card/chip UI
without redesigning the screens.

## Goals / Non-Goals

**Goals:**
- Replace placeholder `CvData` values with real content, condensed to fit
  existing mobile UI (short highlight bullets, not full paragraphs).
- Keep the existing `Job`, `SkillGroup`, `Degree` data shapes; add one new
  `Language` class since language proficiency has no existing home.
- Keep tests passing without hardcoding brittle placeholder-text assertions.

**Non-Goals:**
- No new screens, no navigation changes, no new packages.
- No inclusion of the "Other work" (waiter, warehouse, etc.) or "Personal
  information" (age, driver's license) sections — irrelevant for a tech CV
  app aimed at hiring teams.
- No verbatim reproduction of full CV prose — every job/experience entry is
  condensed to 2-4 highlight bullets max, matching the existing card format.

## Decisions

- **Condense, don't transcribe.** Each `Job.highlights` list is capped at
  ~3-4 short bullets pulled from the PDF's bullet points and prose,
  rewritten for brevity — the existing `ExperienceScreen` renders each
  highlight as a full line, so long paragraphs would break the card layout.
- **Skills grouping.** Source CV lists tech per-job as free text (e.g.
  `<Java, Kotlin, Python, AOSP/Android Automotive, ...>`). These are merged,
  deduplicated, and bucketed into the existing three `SkillGroup` categories
  (Languages, Frameworks/Platforms, Tools) rather than introducing new
  categories, to keep the `SkillsScreen` layout unchanged.
- **New `Language` class + section.** Spoken languages (Swedish/English/
  Spanish/French) don't fit `Job`, `SkillGroup`, or `Degree`. Adding a
  minimal `Language { name, level }` class and rendering it as a short list
  at the bottom of `AboutScreen` — smallest change that surfaces this data
  without a new tab/screen.
- **Internships/summer jobs omitted from `experience`.** Only the three
  "Previous work experience" roles + current role are included; internships
  and summer jobs (2008-2013) are pre-professional and would dilute a
  10-line experience screen aimed at a Flutter/Dart hiring team.
- **Tests assert against `CvData` fields, not literal strings.** Existing
  tests (`screens_test.dart`, `main_test.dart`) already mostly loop over
  `CvData.experience`/`skills`/`education` and check `CvData.email` etc., so
  they need no changes for job-content edits — this decision confirms no
  test file changes are needed beyond adding one assertion for the new
  Languages section on `AboutScreen`.

## Risks / Trade-offs

- [Condensing loses nuance/detail from the full CV] → Acceptable: this app
  is explicitly a portfolio/demo piece, not the resume of record; the PDF is
  still sent separately with full detail (per earlier design conversation).
- [Real personal data (email, phone, address) now hardcoded in a public repo/
  web build] → Acceptable and intentional: this is a public CV app meant to
  be shared with recruiters; contact info is meant to be public-facing. No
  physical address will be included (not present in `Contact` fields
  currently, and out of scope to add).
- [Skill bucketing (Languages vs Frameworks vs Tools) is a judgment call and
  may misclassify something like "AOSP/Android Automotive"] → Low impact,
  cosmetic; easy to move a chip between groups later by editing one const
  list entry.

## Migration Plan

Single-file content edit, no data migration, no rollback complexity beyond
reverting the commit. Verify with `flutter analyze` + `flutter test` after
edits (existing CI already runs both on every push/PR).

## Open Questions

None — content source, target sections, and omissions are decided above.
