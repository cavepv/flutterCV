// Real CV content, sourced from CV_2026_CarlosPV.pdf.
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

class Language {
  final String name;
  final String level;

  const Language({required this.name, required this.level});
}

class CvData {
  static const String name = 'Carlos Palomeque Vela';
  static const String tagline = 'Senior Software Engineer';
  static const String about =
      'Over 10 years of professional experience with a broad technical '
      'background in Android Automotive OS, Embedded/RTOS, C/C++, Java, '
      'Kotlin, and Android app development. Worked with both product and '
      'consultancy companies including Volvo Cars, CPAC Systems, Epiroc '
      'Rocktec, and Volvo Construction Equipment. Enjoys technically '
      'challenging projects, always with a user-experience-first mindset, '
      'and values collaborating, sharing knowledge, and helping the team '
      'thrive. Native Swedish speaker, fluent in English and Spanish.';

  static const String email = 'carlos.palomeque.vela@gmail.com';
  static const String phone = '+46 76 868 92 99';
  static const String linkedInUrl =
      'https://www.linkedin.com/in/carlos-palomeque-vela-38771711a';
  static const String githubUrl = 'https://github.com/cavepv';

  static const List<Job> experience = [
    Job(
      title: 'Software Engineer Consultant',
      company: 'Volvo Cars (via Acorn Technology)',
      period: '2024 — Present',
      highlights: [
        'Infotainment platforms SPA1/SPA2/SPA3: driver personalization, '
            'multiuser/profile management and onboarding on Android Automotive OS',
        'Drove test-driven development: automated unit tests, on-target '
            'instrumentation tests, and Pytest component tests in Jenkins CI',
        'Collaborated with Google dev teams on Automotive Services issues, '
            'using CTS/xTS certification testing via Trade Federation',
        'Improved UI/onboarding components with MVVM + StateFlow',
      ],
    ),
    Job(
      title: 'Software Engineer',
      company: 'CPAC Systems',
      period: '2019 — 2024',
      highlights: [
        'Android platform team: AOSP/Android Automotive OS foundation and '
            'back-end for Volvo Co-Pilot 2 (1st & 2nd gen), SOP late 2023',
        'Full-stack work from factory production support to Python tooling '
            'and native C++, incl. IEEE754 floating point encode/decode',
        'App development alongside platform/back-end work in a GNU/Linux '
            'environment',
      ],
    ),
    Job(
      title: 'Software Engineer Consultant (Epiroc Rocktec Division)',
      company: 'Alten Sweden',
      period: '2017.09 — 2019.02',
      highlights: [
        'Embedded C++14 development for the EU-funded SIMS project: '
            'battery-powered underground mining machines',
        'Implemented electrified drive-train code: power control component, '
            'GUI/Qt widgets, and manager state machines (power, battery)',
        'J1939/CAN related development',
      ],
    ),
    Job(
      title: 'Software Developer Consultant',
      company: 'Combitech Sverige (for Volvo Construction Equipment)',
      period: '2013.12 — 2017.07',
      highlights: [
        'Embedded software in a Windows environment; back-end C programming '
            'and maintenance of machine ECU code',
        'Target debugging with Trace32, communication protocol code, '
            'ClearCase configuration management',
        'Interfaced with project managers for sprint planning; collaborated '
            'with global teams (US, India, France)',
      ],
    ),
  ];

  static const List<SkillGroup> skills = [
    SkillGroup(
      category: 'Languages',
      items: ['Java', 'Kotlin', 'C++', 'C', 'Python', 'C#', 'JavaScript'],
    ),
    SkillGroup(
      category: 'Frameworks & Platforms',
      items: [
        'Android',
        'AOSP/Android Automotive OS',
        'RTOS',
        'GNU/Linux',
        'Qt',
        'StateFlow',
        'MVVM',
      ],
    ),
    SkillGroup(
      category: 'Tools',
      items: [
        'Jenkins',
        'Gerrit',
        'Pytest',
        'CTS/xTS (Trade Federation)',
        'ClearCase',
        'Trace32',
        'J1939/CAN',
      ],
    ),
  ];

  static const List<Degree> education = [
    Degree(
      school: 'Linköping University',
      degree: 'Master of Science in Media Technology and Engineering',
      period: '2008 — 2013',
    ),
    Degree(
      school: 'Rinmangymnasiet',
      degree: 'High school, Teknikprogrammet',
      period: '2003 — 2006',
    ),
  ];

  static const List<Language> languages = [
    Language(name: 'Swedish', level: 'Native'),
    Language(name: 'English', level: 'Fluent'),
    Language(name: 'Spanish', level: 'Fluent'),
    Language(name: 'French', level: 'Beginner'),
  ];
}
