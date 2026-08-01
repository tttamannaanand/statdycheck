import 'package:flutter/material.dart';

import 'package:stardy_app/Views/Profile_Source/features/profile/presentation/widgets/career_track_screen.dart';

class UiUxScreen extends StatelessWidget {
  const UiUxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CareerTrackScreen(
      title: 'UI UX Design',
      description:
          'UI/UX Design focuses on creating intuitive, user-centered digital experiences by combining visual design with usability principles. It involves understanding user needs.',
      skills: ['Empathy', 'Research', 'User Testing'],
      totalHours: '5 Hours',
      courses: [
        CareerCourse(
          title: 'Graphic Design',
          category: 'Design',
          image: 'assets/images/course_laptop.png',
          level: 'Beginner',
        ),
        CareerCourse(
          title: 'UI/UX Mastery',
          category: 'Design',
          image: 'assets/images/course_meeting.png',
          level: 'Advanced',
        ),
      ],
    );
  }
}
