import 'package:flutter/material.dart';

import '../Cources/Course_details_page.dart';
import '../widgets/New_carousel_course/carousel_data.dart';

class DataAnalystScreen extends StatelessWidget {
  const DataAnalystScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dataCourses = carouselCourses
        .where(
          (course) => [
            'Data Structures',
            'Cloud Computing',
            'DevOps Basics',
          ].contains(course.title),
        )
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F4F2),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },

                  child: Container(
                    width: 52,
                    height: 52,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),

                const SizedBox(height: 24),

                Center(
                  child: Image.asset(
                    'assets/images/stardy-logo.png',
                    height: 100,

                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.analytics_outlined,
                        size: 90,
                        color: Color(0xFFBE1E4A),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 18),

                const Center(
                  child: Text(
                    'Data Analyst',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  'About',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Data Analysts collect, organize and interpret data to help businesses make better decisions. They identify patterns, build dashboards and generate insights using statistics and technology.',
                  style: TextStyle(fontSize: 16, height: 1.8),
                ),

                const SizedBox(height: 28),

                const Text(
                  'Skills Required',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 18),

                _skillCard('Excel', '2–4 weeks'),

                _skillCard('SQL', '1–3 months'),

                _skillCard('Statistics', '2–4 months'),

                _skillCard('Data Visualization', '1–2 months'),

                _skillCard('Python Basics', '2–4 months'),

                const SizedBox(height: 30),

                const Text(
                  'Recommended Courses',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 18),

                ...dataCourses.map((course) {
                  String level = 'Intermediate';

                  if (course.title == 'Data Structures') {
                    level = 'Beginner';
                  }

                  if (course.title == 'Cloud Computing') {
                    level = 'Intermediate';
                  }

                  if (course.title == 'DevOps Basics') {
                    level = 'Advanced';
                  }

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              CourseDetailsPage(course: course.toCourse()),
                        ),
                      );
                    },

                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),

                      padding: const EdgeInsets.all(16),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),

                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,

                            decoration: BoxDecoration(
                              color: const Color(0xFFF4F4F4),

                              borderRadius: BorderRadius.circular(18),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(10),

                              child: Image.asset(
                                course.image,
                                fit: BoxFit.contain,

                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.analytics_outlined,
                                    size: 34,
                                    color: Color(0xFFBE1E4A),
                                  );
                                },
                              ),
                            ),
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  course.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  course.category,
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),

                                const SizedBox(height: 10),

                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),

                                  decoration: BoxDecoration(
                                    color: const Color(
                                      0xFFBE1E4A,
                                    ).withOpacity(0.1),

                                    borderRadius: BorderRadius.circular(18),
                                  ),

                                  child: Text(
                                    level,
                                    style: const TextStyle(
                                      color: Color(0xFFBE1E4A),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Icon(Icons.arrow_forward_ios, size: 18),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _skillCard(String skill, String duration) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),

      child: Row(
        children: [
          const Icon(Icons.school_outlined, color: Color(0xFFBE1E4A)),

          const SizedBox(width: 12),

          Expanded(child: Text(skill)),

          Text(
            duration,
            style: const TextStyle(
              color: Color(0xFFBE1E4A),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
