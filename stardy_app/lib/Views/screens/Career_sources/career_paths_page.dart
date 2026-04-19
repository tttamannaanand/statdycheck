import 'package:flutter/material.dart';
import '../../widgets/color_codes.dart';
import './fullstack_roadmap.dart';

class CareerPathsPage extends StatelessWidget {
  const CareerPathsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final careers = [
      "Full Stack Developer",
      "Frontend Developer",
      "Backend Developer",
      "Mobile App Developer",
      "Data Science",
      "DevOps Engineer",
    ];

    return Container(
      color: AppColors.secondary,
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: careers.length,
        itemBuilder: (context, index) {
          return _careerTile(context, careers[index]);
        },
      ),
    );
  }

  Widget _careerTile(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const FullStackRoadmapPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: AppColors.secondary),
          ],
        ),
      ),
    );
  }
}
