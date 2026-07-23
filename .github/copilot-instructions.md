# Copilot Instructions

## Repository layout

This repo contains two unrelated things — don't conflate them:

- `cv_app/` — the actual Flutter project (all app work happens here).
- `index.html` — a standalone static "Flutter crash course" landing page at
  the repo root, unrelated to `cv_app/`. Not built, tested, or deployed by CI.
- `openspec/` — spec-driven change workflow (see below). `openspec/specs/`
  holds the current source-of-truth capability specs; `openspec/changes/`
  holds in-progress change proposals; `openspec/changes/archive/` holds
  completed ones (dated `YYYY-MM-DD-<change-name>/`).

All Flutter commands below assume `cd cv_app` first (CI's `defaults.run.working-directory` does the same).

## Build, test, lint

Flutter SDK: `flutter` must resolve to a real, currently-installed SDK on
`PATH` (in this environment: `/home/cpalomeq/develop/flutter/bin`). If you
install/reinstall the SDK anywhere else (e.g. `/tmp`), run
`flutter clean && flutter pub get` afterward — `.dart_tool/package_config.json`
hardcodes an absolute path to the SDK used for the last `pub get`, and a
stale path there causes cryptic web-compile failures (`Undefined name
'WidgetsBinding'`, etc.) that look unrelated to the real cause.

```bash
cd cv_app
flutter pub get              # after pubspec.yaml changes or SDK reinstall
flutter analyze              # lint/static analysis, must be clean
flutter test                 # full test suite
flutter test test/screens_test.dart                       # one file
flutter test test/screens_test.dart --plain-name "SkillsScreen"  # one test
flutter build web             # verify web build (output: build/web, gitignored)
flutter run -d web-server --web-port 8080   # serve locally, no Chrome needed
flutter run -d chrome         # hot-reload dev loop, needs a real browser
```

CI (`.github/workflows/cv_app.yml`) runs `flutter analyze` + `flutter test`
on every push/PR touching `cv_app/**`, plus an unsigned `flutter build ios
--no-codesign` on `macos-latest` (proves the iOS build compiles — no Apple
Developer account, not installable on a device); on push to `main` it also
builds web and deploys to the `gh-pages` branch; on `v*` tags it builds and
releases an APK.

## Architecture

- **Static data, no backend/state package.** All CV content lives as `const`
  data classes in `lib/cv_data.dart` (`Job`, `SkillGroup`, `Degree`,
  `Language`, and the `CvData` class holding the actual content). There is no
  JSON, API, or database — editing content means editing this file directly
  and is a deliberate simplification (see the `ponytail:` comment at the top
  of the file).
- **State management: `setState` only**, by explicit choice — no
  Provider/Riverpod/Bloc. `lib/main.dart`'s `HomePage` is the only
  `StatefulWidget`, holding just the selected bottom-nav tab index.
- **One file per concern in `lib/`:** `main.dart` (app shell + bottom nav),
  `screens.dart` (all five tab screens: About/Experience/Skills/Education/
  Contact — kept in one file since each is a small stateless widget reading
  from `CvData`), `cv_data.dart` (data models + content).
- **Contact links use `url_launcher`** (`mailto:`/`tel:`/`https:`) — the only
  third-party runtime dependency beyond Flutter itself.

## Testing conventions

- `test/screens_test.dart` — one smoke test per screen, asserting against
  `CvData` fields (not hardcoded literal strings), so content edits in
  `cv_data.dart` don't require test updates.
- `test/main_test.dart` — app shell smoke tests (starts on About tab, bottom
  nav switches tabs).
- **Use the `pumpTall` helper (in `screens_test.dart`) instead of
  `tester.pumpWidget` + `wrap`** for any screen whose content might not fit
  an 800×600 default test surface. `ListView` only builds items within its
  viewport + cache extent, so long screens (About with its Languages list,
  Experience with 4 job cards) will silently fail `find.text(...)` lookups
  on content below the fold unless the test surface is made tall first.

## Skills (Copilot CLI)

Project-level skills live in `.github/skills/` (each a `SKILL.md`) with
matching slash-command prompts in `.github/prompts/opsx-*.prompt.md`:

- `openspec-propose` (`/opsx:propose`) — describe a change, get
  `proposal.md` + `design.md` + `specs/<capability>/spec.md` +
  `tasks.md` generated in one pass.
- `openspec-apply-change` (`/opsx:apply`) — implement the pending tasks in
  an existing change's `tasks.md`, checking them off as it goes.
- `openspec-archive-change` (`/opsx:archive`) — move a completed change to
  `openspec/changes/archive/YYYY-MM-DD-<name>/` and sync its delta spec(s)
  into `openspec/specs/`.
- `openspec-explore` — think through an idea/problem before committing to a
  change (no artifacts produced).

Custom agents live in `.github/agents/` (one Markdown file per agent, with
`description`/`tools` frontmatter): `senior-flutter-dev` (production code,
`cv_app/lib/`), `test-agent` (`cv_app/test/` only), `lint-agent` (style/lint
fixes per `analysis_options.yaml`), `docs-agent` (dartdoc/README, no logic),
`software-architect` (advisory — proposals only, never edits `lib/`
directly). Each agent's boundaries say what it may/may not touch and
whether it requires an OpenSpec change first.

## OpenSpec Workflow

Changes to this repo are proposed/implemented via OpenSpec artifacts
(`proposal.md`, `design.md`, `specs/<capability>/spec.md`, `tasks.md`),
driven by the `openspec` CLI plus the skills/agents above:

1. **Propose** — `openspec-propose` scaffolds a change under
   `openspec/changes/<name>/` and generates all four artifacts.
2. **Apply** — `openspec-apply-change` works through `tasks.md` checkboxes
   (`- [ ]` → `- [x]`), implementing each task and running the relevant
   verification command (`flutter analyze`, `flutter test`,
   `flutter build web`) as the last task group.
3. **Archive** — `openspec-archive-change` moves the change directory to
   `openspec/changes/archive/YYYY-MM-DD-<name>/` and syncs its delta spec
   into `openspec/specs/<capability>/spec.md` (the source-of-truth spec,
   separate from the change's own copy).

When adding a capability spec, only `## ADDED Requirements` is needed for a
brand-new capability; use `## MODIFIED`/`## REMOVED`/`## RENAMED` only when
changing an existing one already present in `openspec/specs/`. Non-trivial
production changes should go through this workflow rather than being
implemented ad hoc — see `senior-flutter-dev`'s and `software-architect`'s
boundaries in `.github/agents/`.
