import 'package:flutter/material.dart';

import 'cv_data.dart';
import 'screens.dart';

void main() {
  runApp(const CvApp());
}

class CvApp extends StatelessWidget {
  const CvApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${CvData.name} — CV',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  static const _screens = [
    AboutScreen(),
    ExperienceScreen(),
    SkillsScreen(),
    EducationScreen(),
    ContactScreen(),
  ];

  static const _titles = ['About', 'Previous work experience', 'Skills', 'Education', 'Contact'];

  static const _navLabels = ['About', 'Experience', 'Skills', 'Education', 'Contact'];

  static const _navIcons = [
    Icons.person,
    Icons.work,
    Icons.star,
    Icons.school,
    Icons.contact_mail,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_index])),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: IndexedStack(index: _index, children: _screens),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          for (var i = 0; i < _navLabels.length; i++)
            NavigationDestination(
              icon: Icon(_navIcons[i]),
              label: _navLabels[i],
            ),
        ],
      ),
    );
  }
}
