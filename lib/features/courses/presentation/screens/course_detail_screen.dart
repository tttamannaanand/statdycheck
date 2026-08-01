import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_bottom_nav_bar.dart';
import '../../application/course_provider.dart';
import '../widgets/skill_dot_label.dart';
import '../widgets/upcoming_lesson_tile.dart';

class CourseDetailScreen extends ConsumerStatefulWidget {
  const CourseDetailScreen({super.key, required this.subjectId});

  final String subjectId;

  @override
  ConsumerState<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends ConsumerState<CourseDetailScreen> {
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    final subjectAsync = ref.watch(subjectProvider(widget.subjectId));

    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _navIndex,
        onTap: (i) {
          setState(() => _navIndex = i);
          if (i == 0) context.go('/profile');
        },
      ),
      body: subjectAsync.when(
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.accentRed)),
        error: (e, s) => Center(child: Text('Something went wrong', style: AppTextStyles.body)),
        data: (subject) => SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => context.pop(),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: AppColors.surfaceLight,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.notifications_none_rounded, color: Colors.white, size: 20),
                            ),
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(subject.instructorAvatarUrl),
                            onBackgroundImageError: (_, __) {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        subject.title.toUpperCase(),
                        style: AppTextStyles.heading1.copyWith(letterSpacing: 1),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        subject.description,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyMuted,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: AppColors.surfaceLight,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.north_east_rounded, color: Colors.white, size: 18),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceLight,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text('Skills to Know', style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Wrap(
                        spacing: 16,
                        children: subject.skillsToKnow.map((s) => SkillDotLabel(label: s)).toList(),
                      ),
                      const SizedBox(height: 18),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceLight,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.access_time_rounded, color: Colors.white, size: 16),
                            const SizedBox(width: 6),
                            Text('${subject.durationHours} Hours', style: AppTextStyles.body),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => context.push('/subjects/${widget.subjectId}/lessons'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accentRed,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          ),
                          child: Text('Start Course', style: AppTextStyles.button),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Upcoming', style: AppTextStyles.heading2),
                    GestureDetector(
                      onTap: () {},
                      child: Text('See all', style: AppTextStyles.bodyMuted.copyWith(decoration: TextDecoration.underline)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ...subject.upcoming.map(
                  (lesson) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: UpcomingLessonTile(lesson: lesson),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
