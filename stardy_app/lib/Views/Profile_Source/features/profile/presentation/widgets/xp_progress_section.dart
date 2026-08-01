import 'package:flutter/material.dart';

import 'package:stardy_app/Views/Profile_Source/core/constants/app_colors.dart';
import 'package:stardy_app/Views/Profile_Source/core/constants/app_typography.dart';

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
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.lightBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('$currentXp ', style: AppTextStyles.heading2.copyWith(color: AppColors.textDark)),
                  Text('XP', style: AppTextStyles.heading2.copyWith(color: AppColors.accentRed)),
                ],
              ),
              const Icon(Icons.keyboard_double_arrow_right_rounded, color: AppColors.textDarkMuted, size: 18),
              Row(
                children: [
                  Text('$targetXp ', style: AppTextStyles.heading2.copyWith(color: AppColors.textDark)),
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
              backgroundColor: AppColors.lightSurface,
              valueColor: const AlwaysStoppedAnimation(AppColors.accentRed),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text('LEVEL ', style: AppTextStyles.body.copyWith(color: AppColors.textDark)),
              Text('$level', style: AppTextStyles.body.copyWith(color: AppColors.accentRed, fontWeight: FontWeight.w700)),
            ],
          ),
        ],
      ),
    );
  }
}
