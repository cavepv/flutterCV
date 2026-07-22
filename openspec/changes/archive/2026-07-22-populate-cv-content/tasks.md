## 1. Data model

- [x] 1.1 Add `Language { name, level }` class to `cv_data.dart`

## 2. Real content — identity, about, contact

- [x] 2.1 Replace `CvData.name`, `tagline`, `about` with real values from the
      CV's header and Presentation section
- [x] 2.2 Replace `CvData.email`, `phone`, `linkedInUrl` with real values;
      set/confirm `githubUrl` (ask user if not present in CV)
- [x] 2.3 Add `CvData.languages` const list (Swedish/native, English/fluent,
      Spanish/fluent, French/beginner)

## 3. Real content — experience

- [x] 3.1 Replace `CvData.experience` with 4 real `Job` entries: Volvo
      Cars/Acorn (current), CPAC Systems, Alten/Epiroc Rocktec,
      Combitech/Volvo CE — each with real title/company/period and ≤4
      condensed highlight bullets

## 4. Real content — skills

- [x] 4.1 Replace `CvData.skills` with real, deduplicated `SkillGroup`
      entries bucketed into Languages/Frameworks & Platforms/Tools,
      sourced from the per-job tech tags and presentation section

## 5. Real content — education

- [x] 5.1 Replace `CvData.education` with real `Degree` entries: M.Sc. Media
      Technology and Engineering (Linköping University, 2008-2013); optionally
      high school entry

## 6. UI

- [x] 6.1 Add a "Languages" section to `AboutScreen` rendering
      `CvData.languages`

## 7. Verification

- [x] 7.1 Update/add widget test assertions for the new Languages section in
      `test/screens_test.dart` (AboutScreen)
- [x] 7.2 Run `flutter analyze` — no new issues
- [x] 7.3 Run `flutter test` — all tests pass
- [x] 7.4 Run `flutter build web` — build succeeds
