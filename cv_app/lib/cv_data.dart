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
      'With over 10 years of professional experience, I have a broad technical '
      'background working with Android Automotive OS, Embedded/RTOS, C/C++, Java, '
      'Kotlin, and Android App development. I\'ve worked with both product and '
      'consultancy companies and enjoy technically challenging projects. I find it '
      'rewarding to identify and strengthen the team\'s areas of improvement and '
      'together excel and achieve set goals together.\n\n'
      'I like speaking with customers and even though often found in back-end work — '
      'always keeping close to the product, always with a user-experience-first '
      'mindset. Collaborating with other developers, discussing ideas, sharing '
      'knowledge, and helping each thrive and develop is something that I truly '
      'enjoy and value in a workplace.\n\n'
      'I\'m born and raised in Sweden — native Swedish speaker, but also fluent in '
      'English and Spanish. I\'ve had the pleasure to work with prestigious companies '
      'such as Volvo Cars, CPAC Systems, Epiroc Rocktec Division, and Volvo '
      'Construction Equipment, where I\'ve developed my knowledge in systems design and '
      'architecture and skills in Java, Kotlin, C++, Python, AOSP/Android Automotive OS, '
      'and Real-time (RTOS) and event driven operating systems .\n\n'
      'With much curiosity I consider myself a native LLM/AI user and have adopted '
      'and come to love specification and test-driven development (OpenSpec and '
      'Caveman framework) through LLM usage. Current harnesses of choice are '
      'CoPilot CLI and PI/Caveman-code. I\'m constantly exploring and testing the '
      'field of AI and how to best use these tools as a signal amplifier/leverage my '
      'years of software development experience. Well aware of the non-deterministic '
      'nature of LLMs vs. traditional compilers, but given clear intent, '
      'requirements, fixed set of goals, years of experience as context, the output '
      'result will amplify this.';

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
