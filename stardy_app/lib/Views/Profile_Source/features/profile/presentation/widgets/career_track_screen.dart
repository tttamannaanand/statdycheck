import 'package:flutter/material.dart';

import 'package:stardy_app/Views/Profile_Source/core/constants/app_colors.dart';
import 'career_course.dart';
import 'course_row_tile.dart';
import '../screens/course_list_screen.dart';

export 'career_course.dart' show CareerCourse;

class CareerTrackScreen extends StatelessWidget {
  const CareerTrackScreen({
    super.key,
    required this.title,
    required this.description,
    required this.skills,
    required this.totalHours,
    required this.courses,
    this.avatarAsset = 'assets/images/profile_avatar.png',
    this.previewCount = 1,
  });

  final String title;
  final String description;
  final List<String> skills;
  final String totalHours;
  final List<CareerCourse> courses;
  final String avatarAsset;
  final int previewCount;

  @override
  Widget build(BuildContext context) {
    final previewCourses = courses.take(previewCount).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _HeroCard(
                title: title,
                description: description,
                skills: skills,
                totalHours: totalHours,
                avatarAsset: avatarAsset,
                onStartCourse: courses.isEmpty ? null : () => openCareerCourse(context, courses.first),
                onBack: () => Navigator.pop(context),
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark),
                  ),
                  GestureDetector(
                    onTap: courses.length <= previewCount
                        ? null
                        : () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CourseListScreen(title: title, courses: courses),
                              ),
                            ),
                    child: Text(
                      'See all',
                      style: TextStyle(fontSize: 14, color: AppColors.textDarkMuted, decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              ...previewCourses.map(
                (course) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: CourseRowTile(course: course, onTap: () => openCareerCourse(context, course)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({
    required this.title,
    required this.description,
    required this.skills,
    required this.totalHours,
    required this.avatarAsset,
    required this.onBack,
    this.onStartCourse,
  });

  final String title;
  final String description;
  final List<String> skills;
  final String totalHours;
  final String avatarAsset;
  final VoidCallback onBack;
  final VoidCallback? onStartCourse;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.cardGradient,
          ),
        ),
        child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: onBack,
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.08),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.notifications_none_rounded, color: Colors.white, size: 22),
                        ),
                      ),
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: AppColors.surfaceMuted,
                        backgroundImage: AssetImage(avatarAsset),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 1.1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12.5, height: 1.5, color: Colors.white70),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _iconChip(Icons.north_east_rounded),
                      const SizedBox(width: 12),
                      _pill('Skills to Know'),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text(
                    skills.join('   •   '),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _iconChip(Icons.schedule_rounded),
                      const SizedBox(width: 12),
                      _pill(totalHours),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onStartCourse,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accentRed,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        elevation: 0,
                      ),
                      child: const Text('Start Course', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.24),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }

  Widget _iconChip(IconData icon) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
      ),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }

  Widget _pill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14),
      ),
    );
  }
}
