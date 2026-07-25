// One smoke test per section screen: renders without crashing and shows
// its expected data-driven content.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cv_app/cv_data.dart';
import 'package:cv_app/screens.dart';

Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

// ponytail: ListView only builds items within its viewport + cache extent,
// so screens with long content need a tall test surface to render fully
// (real usage is unaffected — users just scroll).
Future<void> pumpTall(WidgetTester tester, Widget child) async {
  tester.view.physicalSize = const Size(1200, 4000);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  await tester.pumpWidget(wrap(child));
  await tester.pump();
}

void main() {
  testWidgets('AboutScreen shows name and tagline', (tester) async {
    await pumpTall(tester, const AboutScreen());
    expect(find.text(CvData.name), findsOneWidget);
    expect(find.text(CvData.tagline), findsOneWidget);
    for (final language in CvData.languages) {
      expect(find.text('${language.name} — ${language.level}'), findsOneWidget);
    }
  });

  testWidgets('ExperienceScreen lists every job', (tester) async {
    await pumpTall(tester, const ExperienceScreen());
    for (final job in CvData.experience) {
      expect(find.text('${job.company} · ${job.period}'), findsOneWidget);
    }
  });

  testWidgets('ExperienceScreen shows a company icon per companyIcons entry',
      (tester) async {
    await pumpTall(tester, const ExperienceScreen());
    final totalIcons =
        CvData.experience.fold<int>(0, (sum, job) => sum + job.companyIcons.length);
    expect(find.byType(CircleAvatar), findsNWidgets(totalIcons));
  });

  testWidgets('SkillsScreen shows every skill as a chip', (tester) async {
    await tester.pumpWidget(wrap(const SkillsScreen()));
    for (final group in CvData.skills) {
      expect(find.text(group.category), findsOneWidget);
      for (final skill in group.items) {
        expect(find.widgetWithText(Chip, skill), findsOneWidget);
      }
    }
  });

  testWidgets('EducationScreen lists every degree', (tester) async {
    await tester.pumpWidget(wrap(const EducationScreen()));
    for (final degree in CvData.education) {
      expect(find.text(degree.degree), findsOneWidget);
    }
  });

  testWidgets('ContactScreen shows email, phone, LinkedIn, GitHub', (tester) async {
    await tester.pumpWidget(wrap(const ContactScreen()));
    expect(find.text(CvData.email), findsOneWidget);
    expect(find.text(CvData.phone), findsOneWidget);
    expect(find.text('LinkedIn'), findsOneWidget);
    expect(find.text('GitHub'), findsOneWidget);
  });
}
