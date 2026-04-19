import 'package:flutter/material.dart';
import '../../widgets/color_codes.dart';

class FullStackRoadmapPage extends StatelessWidget {
  const FullStackRoadmapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final topics = [
      "HTML",
      "CSS",
      "JavaScript",
      "React",
      "Node.js",
      "Database",
    ];

    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        title: const Text("Full Stack Roadmap"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: topics.length,
        itemBuilder: (context, index) {
          return _roadmapItem(topics[index]);
        },
      ),
    );
  }

  Widget _roadmapItem(String title) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: AppColors.primaryDark,
                shape: BoxShape.circle,
              ),
            ),
            Container(width: 2, height: 40, color: AppColors.primaryDark),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(title, style: const TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
