import 'package:flutter/material.dart';

import 'package:stardy_app/Views/Profile_Source/core/constants/app_colors.dart';
import '../widgets/career_course.dart';
import '../widgets/course_row_tile.dart';

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key, required this.title, required this.courses});

  final String title;
  final List<CareerCourse> courses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.lightBorder),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.chevron_left_rounded, color: Colors.black, size: 26),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Text(
                title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textDark),
              ),
              const SizedBox(height: 18),
              ...courses.map(
                (course) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: CourseRowTile(course: course, onTap: () => openCareerCourse(context, course)),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(color: AppColors.accentRed, shape: BoxShape.circle),
                    child: const Icon(Icons.flag_rounded, color: Colors.white, size: 18),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "YAY! You've finished it!",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textDark),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
