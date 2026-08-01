import 'package:flutter/material.dart';

import 'package:stardy_app/Views/Profile_Source/core/constants/app_colors.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),

      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.divider,
            width: 1,
          ),
        ),
      ),

      child: Row(
        children: [
          Icon(
            icon,
            size: 22,
            color: AppColors.accentRed,
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight:
                    FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),

          if (subtitle.isNotEmpty)
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),

          const SizedBox(width: 8),

          const Icon(
            Icons.chevron_right,
            size: 22,
            color: AppColors.textMuted,
          ),
        ],
      ),
    );
  }
}
