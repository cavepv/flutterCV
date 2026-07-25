// Verifies the app shell: starts on About, and bottom nav switches tabs.

import 'package:flutter_test/flutter_test.dart';

import 'package:cv_app/cv_data.dart';
import 'package:cv_app/main.dart';

void main() {
  testWidgets('starts on About tab', (tester) async {
    await tester.pumpWidget(const CvApp());
    expect(find.text('About'), findsWidgets);
    expect(find.text(CvData.name), findsOneWidget);
  });

  testWidgets('bottom nav switches to Experience tab', (tester) async {
    await tester.pumpWidget(const CvApp());
    await tester.tap(find.text('Experience'));
    await tester.pumpAndSettle();
    expect(find.text(CvData.experience.first.title), findsOneWidget);
  });

  testWidgets('bottom nav switches to Skills tab', (tester) async {
    await tester.pumpWidget(const CvApp());
    await tester.tap(find.text('Skills'));
    await tester.pumpAndSettle();
    expect(find.text(CvData.skills.first.category), findsOneWidget);
  });

  testWidgets('bottom nav switches to Education tab', (tester) async {
    await tester.pumpWidget(const CvApp());
    await tester.tap(find.text('Education'));
    await tester.pumpAndSettle();
    expect(find.text(CvData.education.first.degree), findsOneWidget);
  });

  testWidgets('bottom nav switches to Contact tab', (tester) async {
    await tester.pumpWidget(const CvApp());
    await tester.tap(find.text('Contact'));
    await tester.pumpAndSettle();
    expect(find.text(CvData.email), findsOneWidget);
  });
}
