import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class XpProgressSection extends StatelessWidget {
  const XpProgressSection({
    super.key,
    required this.currentXp,
    required this.targetXp,
    required this.level,
  });

  final int currentXp;
  final int targetXp;
  final int level;

  @override
  Widget build(BuildContext context) {
    final double progress = (currentXp / targetXp).clamp(0.0, 1.0);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('$currentXp ', style: AppTextStyles.heading2),
                  Text('XP', style: AppTextStyles.heading2.copyWith(color: AppColors.accentRed)),
                ],
              ),
              Icon(Icons.keyboard_double_arrow_right_rounded, color: AppColors.textMuted, size: 18),
              Row(
                children: [
                  Text('$targetXp ', style: AppTextStyles.heading2),
                  Text('XP', style: AppTextStyles.heading2.copyWith(color: AppColors.accentRed)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: AppColors.surfaceMuted,
              valueColor: const AlwaysStoppedAnimation(AppColors.accentRed),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text('LEVEL ', style: AppTextStyles.body),
              Text('$level', style: AppTextStyles.body.copyWith(color: AppColors.accentRed, fontWeight: FontWeight.w700)),
            ],
          ),
        ],
      ),
    );
  }
}
