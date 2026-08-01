import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/course_model.dart';
import 'level_badge.dart';

class LessonTile extends StatelessWidget {
  const LessonTile({super.key, required this.lesson, this.onTap});

  final LessonModel lesson;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    lesson.thumbnailUrl,
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 4,
                  child: LevelBadge(level: lesson.level),
                ),
              ],
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                lesson.title,
                style: AppTextStyles.body.copyWith(color: AppColors.background, fontWeight: FontWeight.w600),
              ),
            ),
            if (lesson.completed)
              const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 20),
          ],
        ),
      ),
    );
  }
}
