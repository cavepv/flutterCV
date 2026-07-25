// Real CV content, sourced from CV_2026_CarlosPV.pdf.
// ponytail: hardcoded const data, no JSON/API layer; add one if content
// needs to be edited without a rebuild.

class Job {
  final String title;
  final String company;
  final String period;
  final List<String> highlights;
  // ponytail: names only, not logo image assets — avoids bundling
  // trademarked company logos; UI renders initials avatars from these.
  final List<String> companyIcons;

  const Job({
    required this.title,
    required this.company,
    required this.period,
    required this.highlights,
    required this.companyIcons,
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
      'background working with Android Automotive OS, Embedded/RTOS, System design '
      ' and architecture and app development. I\'ve worked with both product and '
      'consultancy companies and enjoy technically challenging projects. I find it '
      'rewarding to identify and strengthen the team\'s areas of improvement and '
      'together excel and achieve set goals together.\n\n'
      'I always try to have a close dialog and collaboration with the end-user/customer '
      'and keep a user-experience-first mindset, and not remain isolated in the in-office '
      'development context. Collaborating with other developers, discussing ideas, sharing '
      'knowledge, and helping each thrive and develop is something that I truly '
      'enjoy and value in a workplace.\n\n'
      'I\'ve had the pleasure to work with prestigious companies '
      'such as Volvo Cars, CPAC Systems, Epiroc Rocktec Division, and Volvo '
      'Construction Equipment, where I\'ve developed my knowledge in systems design and '
      'architecture and refined my skillset in event driven operating systems such as '
      ' AOSP/Android Automotive OS and also Real-time (RTOS) based in a embedded context.\n\n'
      'I consider myself a native LLM/AI user and follow this topic '
      'with great interest and curiosity. I have adopted and come to love the '
      'specification and test-driven development (OpenSpec and '
      'Caveman framework) approach to LLM usage. Current harnesses of choice are '
      'CoPilot CLI and PI/Caveman-code. I\'m constantly exploring and testing the '
      'field of AI and how to best use these tools as a signal amplifier/leverage my '
      'years of software development experience. Well aware of the non-deterministic '
      'nature of LLMs vs. traditional compilers, but given clear intent, '
      'requirements, fixed set of goals, years of experience as context, the output '
      'result will amplify this.\n\n'
      'I\'m born and raised in Eskilstuna, Sweden — native Swedish speaker, but also fluent in '
      'English and Spanish (both parents from Bolivia). I now live in Gothenburg with my wife '
      'and our two children.';

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
        'Drove test-driven development best-practices in the team: '
            'automated unit tests, on-target instrumentation tests, and Pytest component tests in Jenkins CI',
        'UI components in industrialized context in close collaboration with UX '
          'team to handle and implement multiple screen sizes and layouts, right/left hand drive,'
          'right-to-left text, and multi-language handling',
        'Collaborated with Google dev.teams on Automotive Services issues, '
            'using CTS/xTS certification testing via Trade Federation',
        'Improved UI/onboarding components (ViewModel) with MVVM + StateFlow',
      ],
      companyIcons: ['Volvo Cars', 'Acorn Technology'],
    ),
    Job(
      title: 'Software Engineer',
      company: 'CPAC Systems',
      period: '2019 — 2024',
      highlights: [
        'Android Automotive OS platform team: AOSP/Android Automotive OS foundation and '
            'back-end for Volvo Co-Pilot (1st & 2nd gen - SOP late 2023).',
        'Full-stack work covering everything from factory production support (EOL & FCT testers) to Python tooling '
            'and native C++, incl. IEEE754 floating point encode/decode implementation.',
        'App development alongside platform/back-end work in a GNU/Linux '
            'environment',
        'I really enjoyed the mix and challenges of working in a mid-sized product company where both the pressure and rewards come down to the effort of you and the team.',
      ],
      companyIcons: ['CPAC Systems'],
    ),
    Job(
      title: 'Software Engineer Consultant',
      company: 'Epiroc Rocktec Division (via Alten Sweden)',
      period: '2017.09 — 2019.02',
      highlights: [
        'Embedded C++14 development',
        'Part of the Epiroc battery/SIMS team of 10 people developing their new battery '
        'powered underground mining machines for the EU-funded SIMS project: https://www.simsmining.eu/',
        'Implemented electrified drive-train related code: power control component state machine (power, battery) managers, '
            'UI/Qt widgets, and J1939/CAN related components',
      ],
      companyIcons: ['Epiroc Rocktec Division', 'Alten Sweden'],
    ),
    Job(
      title: 'Software Developer Consultant',
      company: 'Volvo Construction Equipment (via Combitech Sverige)',
      period: '2013.12 — 2017.07',
      highlights: [
        'Embedded software development for RTOS (RubusVS) in a Windows environment; back-end C programming '
            'and maintenance of machine ECU code',
        'Target debugging with Trace32, communication protocol code (J1587 & J1939), '
            'ClearCase configuration management',
        'Interfaced with project managers for sprint planning; collaborated '
            'with global teams (US, India, France)',
      ],
      companyIcons: ['Combitech Sverige', 'Volvo Construction Equipment'],
    ),
  ];

  static const List<SkillGroup> skills = [
    SkillGroup(
      category: 'Languages',
      items: ['Java', 'Kotlin', 'C++', 'C', 'Python', 'C#', 'JavaScript', 'SQL', 'Bash', 'HTML/CSS'],
    ),
    SkillGroup(
      category: 'Frameworks & Platforms',
      items: [
        'Android',
        'AOSP/Android Automotive OS',
        'RTOS',
        'GNU/Linux',
        'atest',
        'LinuxSE policy',
        'Qt',
        'CTS/xTS (Trade Federation)',
        'StateFlow',
        'Pytest',
        'MVVM',
        'J1939/CAN',
      ],
    ),
    SkillGroup(
      category: 'Tools',
      items: [
        'Jenkins',
        'Gerrit',
        'ClearCase',
        'Trace32',
        'Git',
        'SVN',
        'Mercurial',
        'Docker',
        'Gradle',
        'Figma',
        'GitHub Actions',
        'GitLab CI/CD',
        'Make',
        'CMake',
        'Jira',
        'Confluence',
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
