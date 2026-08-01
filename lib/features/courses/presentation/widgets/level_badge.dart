import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/course_model.dart';

class LevelBadge extends StatelessWidget {
  const LevelBadge({super.key, required this.level});

  final CourseLevel level;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        level.label,
        style: AppTextStyles.label.copyWith(color: Colors.white, fontSize: 9),
      ),
    );
  }
}
