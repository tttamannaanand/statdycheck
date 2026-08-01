import 'package:flutter/material.dart';

import 'package:stardy_app/Views/Profile_Source/features/profile/presentation/widgets/career_track_screen.dart';

class FrontendScreen extends StatelessWidget {
  const FrontendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CareerTrackScreen(
      title: 'Frontend Developer',
      description:
          'Frontend Developers build the visual side of websites and apps. They create responsive layouts, interactive interfaces and smooth user experiences using modern frameworks and technologies.',
      skills: ['HTML & CSS', 'JavaScript', 'React'],
      totalHours: '6 Hours',
      courses: [
        CareerCourse(
          title: 'Flutter App Dev',
          category: 'Development',
          image: 'assets/images/course_dark.png',
          level: 'Beginner',
        ),
        CareerCourse(
          title: 'React Basics',
          category: 'Development',
          image: 'assets/images/course_prototype.png',
          level: 'Intermediate',
        ),
      ],
    );
  }
}
