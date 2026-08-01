import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:stardy_app/Views/Profile_Source/core/constants/app_colors.dart';
import 'package:stardy_app/Views/Profile_Source/core/constants/app_typography.dart';

class CareerInterestSection extends StatelessWidget {
  const CareerInterestSection({super.key});

  static const _interests = [
    ('Data Analyst', '/data-analyst'),
    ('UI UX Design', '/uiux'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Career Interests', style: AppTextStyles.heading1.copyWith(color: AppColors.textDark)),
        const SizedBox(height: 12),
        Row(
          children: [
            for (final interest in _interests) ...[
              Expanded(
                child: GestureDetector(
                  onTap: () => context.push(interest.$2),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: AppColors.redGradient),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      interest.$1,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.button.copyWith(fontSize: 13),
                    ),
                  ),
                ),
              ),
              if (interest != _interests.last) const SizedBox(width: 10),
            ],
          ],
        ),
        Center(
          child: Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.accentRed, width: 1.6),
            ),
            child: const Icon(Icons.add_rounded, color: AppColors.accentRed, size: 20),
          ),
        ),
      ],
    );
  }
}
