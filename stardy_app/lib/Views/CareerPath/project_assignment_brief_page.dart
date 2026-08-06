import 'package:flutter/material.dart';
import '../widgets/color_codes.dart';
import 'project_submission_page.dart';

class ProjectAssignmentBriefPage extends StatelessWidget {
  final String pathName;

  const ProjectAssignmentBriefPage({super.key, required this.pathName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/texture_dark_grid.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
            child: Column(
              children: [
                Text(
                  pathName.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Project assignment',
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                ),
                const SizedBox(height: 28),
                const Icon(
                  Icons.workspace_premium,
                  color: AppColors.primary,
                  size: 150,
                ),
                const SizedBox(height: 28),
                const _SectionTitle('Project description'),
                const SizedBox(height: 10),
                const Text(
                  'To enhance your user interface skills this project tends '
                  'to give you a sheer experience in the field of user '
                  'interface',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 28),
                const _SectionTitle('Requirements'),
                const SizedBox(height: 14),
                const _TwoColumnList(
                  items: [
                    'Make 4 UI screens for a cafe',
                    'Make it responsive to mobile',
                    'The cafe\'s name is Amado the UI should have relevance '
                        'to the name',
                    'The UI should be subject to prototype',
                  ],
                ),
                const SizedBox(height: 28),
                const _SectionTitle('Deliverables'),
                const SizedBox(height: 14),
                const _TwoColumnList(
                  items: ['All 4 UI screens in pdf format', 'Figma file Link'],
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ProjectSubmissionPage(pathName: pathName),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _TwoColumnList extends StatelessWidget {
  final List<String> items;
  const _TwoColumnList({required this.items});

  @override
  Widget build(BuildContext context) {
    final left = <String>[];
    final right = <String>[];
    for (var i = 0; i < items.length; i++) {
      (i.isEven ? left : right).add(items[i]);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _bulletColumn(left)),
        const SizedBox(width: 12),
        Expanded(child: _bulletColumn(right)),
      ],
    );
  }

  Widget _bulletColumn(List<String> texts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: texts
          .map(
            (t) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                '.  $t',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  height: 1.4,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
