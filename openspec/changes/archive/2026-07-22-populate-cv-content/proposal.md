## Why

`cv_app/lib/cv_data.dart` currently holds placeholder/lorem content generated
when the app was scaffolded. The app's purpose is to be shown to real
recruiters/hiring teams, so it needs to display Carlos's actual CV content
(sourced from `/home/cpalomeq/Downloads/CV_2026_CarlosPV.pdf`) instead of
placeholder text.

## What Changes

- Replace all placeholder values in `CvData` (name, tagline, about, contact
  info) with real values from the CV.
- Replace the placeholder `experience` list with real job history: current
  role (Volvo Cars / Acorn Technology) and prior roles (CPAC Systems, Alten
  Sweden/Epiroc, Combitech/Volvo CE), condensed to fit mobile card UI.
- Replace the placeholder `skills` list with real technical skills grouped by
  category (Languages, Frameworks/Platforms, Tools), derived from the
  technology tags listed per job plus the presentation section.
- Replace the placeholder `education` list with real degree (M.Sc. Media
  Technology and Engineering, Linköping University) and high school entry.
- Add a `languages` data section (Swedish/English/Spanish/French with
  proficiency) since the source CV includes it and it doesn't fit existing
  fields — surfaced on the About screen.
- Update existing widget tests (`test/screens_test.dart`, `test/main_test.dart`)
  that assert against specific placeholder strings, so they assert against
  `CvData` fields dynamically rather than needing hardcoded string updates.

## Capabilities

### New Capabilities
- `cv-content-data`: the structured, real CV data model (`CvData` and related
  classes) that the app's screens render, replacing placeholder content with
  Carlos's actual professional history, skills, education, and languages.

### Modified Capabilities
(none — no existing specs to modify; this is the first capability spec for
this repo)

## Impact

- `cv_app/lib/cv_data.dart` — content replaced, `Language` class added.
- `cv_app/lib/screens.dart` — `AboutScreen` gains a Languages section.
- `cv_app/test/screens_test.dart`, `cv_app/test/main_test.dart` — assertions
  updated to stay content-agnostic where they reference specific text.
- No changes to navigation structure, state management approach, or CI.
