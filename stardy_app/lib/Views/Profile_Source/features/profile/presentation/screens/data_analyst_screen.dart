import 'package:flutter/material.dart';

import 'package:stardy_app/Views/Profile_Source/features/profile/presentation/widgets/career_track_screen.dart';

class DataAnalystScreen extends StatelessWidget {
  const DataAnalystScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CareerTrackScreen(
      title: 'Data Analyst',
      description:
          'Data Analysts collect, clean and interpret data to help businesses make informed decisions. They use statistics, visualization tools and problem-solving skills to uncover patterns and insights.',
      skills: ['Excel', 'SQL', 'Python'],
      totalHours: '6 Hours',
      courses: [
        CareerCourse(
          title: 'Data Structures',
          category: 'CS',
          image: 'assets/images/course_laptop.png',
          level: 'Beginner',
        ),
        CareerCourse(
          title: 'Cloud Computing',
          category: 'Cloud',
          image: 'assets/images/course_meeting.png',
          level: 'Intermediate',
        ),
        CareerCourse(
          title: 'DevOps Basics',
          category: 'DevOps',
          image: 'assets/images/course_prototype.png',
          level: 'Advanced',
        ),
      ],
    );
  }
}
