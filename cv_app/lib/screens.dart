// One file for all five section screens — ponytail: each screen is a
// small stateless widget, not worth splitting into separate files yet.
// Split out if any screen grows real complexity/state of its own.

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'cv_data.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const Center(
          // ListView forces a tight full-width constraint on children, so the
          // avatar needs Center to be free to size itself instead of stretching.
          child: ClipOval(
            child: SizedBox(
              width: 130,
              height: 130,
              child: Image(
                image: AssetImage('assets/images/profile.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment(0, -0.6),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(CvData.name, style: Theme.of(context).textTheme.headlineMedium),
        Text(CvData.tagline, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 24),
        Text(CvData.about, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 24),
        Text('Languages', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        for (final language in CvData.languages)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text('${language.name} — ${language.level}'),
          ),
        const SizedBox(height: 24),
        Text('Drivers license: B since 2005', style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}

// ponytail: initials avatar stands in for a company logo image — no
// trademarked assets to source/bundle, upgrade to real logos if provided.
String _initials(String name) {
  final words = name.split(RegExp(r'\s+')).where((w) => w.isNotEmpty);
  return words.take(2).map((w) => w[0].toUpperCase()).join();
}

// ponytail: derived from each job's period start year instead of a
// hardcoded number — stays correct every year, no manual bump needed.
int _yearsOfExperience(List<Job> jobs) {
  final startYears = jobs.map(
    (j) => int.parse(RegExp(r'\d{4}').firstMatch(j.period)!.group(0)!),
  );
  return DateTime.now().year - startYears.reduce((a, b) => a < b ? a : b);
}

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${_yearsOfExperience(CvData.experience)}+ years of professional experience',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        Expanded(child: _ExperienceList()),
      ],
    );
  }
}

class _ExperienceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: CvData.experience.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final job = CvData.experience[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(job.title, style: Theme.of(context).textTheme.titleLarge),
                Text('${job.company} · ${job.period}',
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 8),
                Row(
                  children: [
                    for (final name in job.companyIcons)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Tooltip(
                          message: name,
                          child: CircleAvatar(
                            radius: 16,
                            child: Text(_initials(name)),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                for (final h in job.highlights)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text('• $h'),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        for (final group in CvData.skills)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(group.category, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final skill in group.items) Chip(label: Text(skill)),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: CvData.education.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final degree = CvData.education[index];
        return Card(
          child: ListTile(
            title: Text(degree.degree),
            subtitle: Text('${degree.school} · ${degree.period}'),
          ),
        );
      },
    );
  }
}

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Future<void> _open(String url) => launchUrl(Uri.parse(url));

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ListTile(
          leading: const Icon(Icons.email),
          title: const Text('Email'),
          subtitle: Text(CvData.email),
          onTap: () => _open('mailto:${CvData.email}'),
        ),
        ListTile(
          leading: const Icon(Icons.phone),
          title: const Text('Phone'),
          subtitle: Text(CvData.phone),
          onTap: () => _open('tel:${CvData.phone}'),
        ),
        ListTile(
          leading: const Icon(Icons.link),
          title: const Text('LinkedIn'),
          onTap: () => _open(CvData.linkedInUrl),
        ),
        ListTile(
          leading: const Icon(Icons.code),
          title: const Text('GitHub'),
          onTap: () => _open(CvData.githubUrl),
        ),
      ],
    );
  }
}
