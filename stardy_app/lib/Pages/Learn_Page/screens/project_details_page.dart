import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'assignment_submission_page.dart';

class ProjectDetailsPage extends StatelessWidget {
  const ProjectDetailsPage({
    super.key,
    this.title = 'Flutter Learning App',
    this.subtitle = 'Project assignment',
    this.description =
        'To enhance your Flutter development skills this project tends to give you a hands-on experience in building a real learning platform.',
    this.requirements = const [
      'Build 4 core screens for the app',
      'Include authentication and quiz flow',
      'Make it responsive to mobile',
      'The UI should follow the app design system',
    ],
    this.deliverables = const [
      'Complete Flutter project (zip)',
      'Demo video link',
    ],
  });

  final String title;
  final String subtitle;
  final String description;
  final List<String> requirements;
  final List<String> deliverables;

  static const Color _accentRed = Color(0xFFBE1E4A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1B1B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.chevron_left_rounded, size: 26),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        title.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mukta(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 0.6,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mukta(fontSize: 14, color: Colors.white60),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const Icon(Icons.military_tech_rounded, color: _accentRed, size: 120),
                            Container(
                              width: 62,
                              height: 62,
                              decoration: const BoxDecoration(color: _accentRed, shape: BoxShape.circle),
                              child: const Icon(Icons.star_rounded, color: Colors.white, size: 30),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 34),
                      _sectionHeading('Project description'),
                      const SizedBox(height: 10),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mukta(fontSize: 13, color: Colors.white70, height: 1.6),
                      ),
                      const SizedBox(height: 30),
                      _sectionHeading('Requirements'),
                      const SizedBox(height: 14),
                      _bulletGrid(requirements),
                      const SizedBox(height: 30),
                      _sectionHeading('Deliverables'),
                      const SizedBox(height: 14),
                      _bulletGrid(deliverables),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AssignmentSubmissionPage()),
                    );
                  },
                  child: Text(
                    'Submit',
                    style: GoogleFonts.mukta(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeading(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.mukta(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget _bulletGrid(List<String> items) {
    final left = <String>[];
    final right = <String>[];
    for (int i = 0; i < items.length; i++) {
      (i.isEven ? left : right).add(items[i]);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _bulletColumn(left)),
        const SizedBox(width: 16),
        Expanded(child: _bulletColumn(right)),
      ],
    );
  }

  Widget _bulletColumn(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                '. $item',
                style: GoogleFonts.mukta(fontSize: 12, color: Colors.white70, height: 1.5),
              ),
            ),
          )
          .toList(),
    );
  }
}
