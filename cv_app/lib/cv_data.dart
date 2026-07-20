// Placeholder CV content — replace with your real data.
// ponytail: hardcoded const data, no JSON/API layer; add one if content
// needs to be edited without a rebuild.

class Job {
  final String title;
  final String company;
  final String period;
  final List<String> highlights;

  const Job({
    required this.title,
    required this.company,
    required this.period,
    required this.highlights,
  });
}

class SkillGroup {
  final String category;
  final List<String> items;

  const SkillGroup({required this.category, required this.items});
}

class Degree {
  final String school;
  final String degree;
  final String period;

  const Degree({required this.school, required this.degree, required this.period});
}

class CvData {
  static const String name = 'Carlos Palomeque';
  static const String tagline = 'Flutter & Dart Developer';
  static const String about =
      'Placeholder bio. Mobile developer focused on building clean, '
      'maintainable Flutter apps across Android, iOS and web. Passionate '
      'about developer experience, performance, and shipping real products.';

  static const String email = 'carlos@example.com';
  static const String phone = '+1 555 123 4567';
  static const String linkedInUrl = 'https://linkedin.com/in/example';
  static const String githubUrl = 'https://github.com/example';

  static const List<Job> experience = [
    Job(
      title: 'Flutter Developer',
      company: 'Example Corp',
      period: '2023 — Present',
      highlights: [
        'Built and shipped cross-platform features used by 100k+ users',
        'Reduced app startup time by 30% through profiling and refactoring',
        'Mentored junior developers on state management best practices',
      ],
    ),
    Job(
      title: 'Mobile Developer',
      company: 'Previous Company',
      period: '2021 — 2023',
      highlights: [
        'Migrated legacy native app to Flutter',
        'Introduced CI/CD pipeline for automated testing and releases',
      ],
    ),
  ];

  static const List<SkillGroup> skills = [
    SkillGroup(category: 'Languages', items: ['Dart', 'Kotlin', 'Swift', 'JavaScript']),
    SkillGroup(category: 'Frameworks', items: ['Flutter', 'Provider', 'Riverpod', 'Bloc']),
    SkillGroup(category: 'Tools', items: ['Git', 'GitHub Actions', 'Firebase', 'REST APIs']),
  ];

  static const List<Degree> education = [
    Degree(
      school: 'Example University',
      degree: 'B.Sc. Computer Science',
      period: '2017 — 2021',
    ),
  ];
}
