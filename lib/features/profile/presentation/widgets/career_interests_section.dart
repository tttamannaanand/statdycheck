import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class CareerInterestsSection extends StatelessWidget {
  const CareerInterestsSection({
    super.key,
    required this.interests,
    this.onAddPressed,
    this.onInterestTap,
  });

  final List<String> interests;
  final VoidCallback? onAddPressed;
  final ValueChanged<String>? onInterestTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Career Interests', style: AppTextStyles.heading1),
        const SizedBox(height: 12),
        ...interests.map(
          (interest) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () => onInterestTap?.call(interest),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: AppColors.redGradient),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(interest, style: AppTextStyles.button),
              ),
            ),
          ),
        ),
        Center(
          child: GestureDetector(
            onTap: onAddPressed,
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: AppColors.surfaceLight,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.divider),
              ),
              child: const Icon(Icons.add_rounded, color: AppColors.textSecondary, size: 20),
            ),
          ),
        ),
      ],
    );
  }
}
