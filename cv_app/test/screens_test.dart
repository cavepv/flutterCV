// One smoke test per section screen: renders without crashing and shows
// its expected data-driven content.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cv_app/cv_data.dart';
import 'package:cv_app/screens.dart';

Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

void main() {
  testWidgets('AboutScreen shows name and tagline', (tester) async {
    await tester.pumpWidget(wrap(const AboutScreen()));
    expect(find.text(CvData.name), findsOneWidget);
    expect(find.text(CvData.tagline), findsOneWidget);
  });

  testWidgets('ExperienceScreen lists every job', (tester) async {
    await tester.pumpWidget(wrap(const ExperienceScreen()));
    for (final job in CvData.experience) {
      expect(find.text(job.title), findsOneWidget);
    }
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
