import 'package:flutter/material.dart';

import 'package:stardy_app/Pages/Learn_Page/models/course_model.dart';
import 'package:stardy_app/Pages/Learn_Page/screens/course_details_page.dart';

class CareerCourse {
  const CareerCourse({
    required this.title,
    required this.category,
    required this.image,
    required this.level,
  });

  final String title;
  final String category;
  final String image;
  final String level;
}

void openCareerCourse(BuildContext context, CareerCourse course) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => CourseDetailsPage(
        course: Course(
          title: course.title,
          image: course.image,
          rating: 4.5,
          progress: 0,
          category: course.category,
          uploadDate: 'N/A',
          duration: 'Self-paced',
          description: 'Course details coming soon.',
          chapters: [
            Chapter(
              title: 'Getting Started',
              topics: [Topic(title: course.title, videoUrl: '')],
            ),
          ],
        ),
      ),
    ),
  );
}

IconData iconForCareerCategory(String category) {
  switch (category.toLowerCase()) {
    case 'design':
      return Icons.brush_rounded;
    case 'cs':
      return Icons.memory_rounded;
    case 'cloud':
      return Icons.cloud_rounded;
    case 'devops':
      return Icons.settings_suggest_rounded;
    case 'development':
      return Icons.code_rounded;
    default:
      return Icons.menu_book_rounded;
  }
}
