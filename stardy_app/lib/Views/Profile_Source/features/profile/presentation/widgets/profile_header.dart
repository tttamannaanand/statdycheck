import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:stardy_app/Views/Profile_Source/core/constants/app_colors.dart';
import 'package:stardy_app/Views/Profile_Source/core/constants/app_typography.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.username,
    required this.avatarAsset,
  });

  final String username;
  final String avatarAsset;

  @override
  Widget build(BuildContext context) {
    final double topInset = MediaQuery.of(context).padding.top;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(28),
        bottomRight: Radius.circular(28),
      ),
      child: Container(
        height: 220 + topInset,
        width: double.infinity,
        color: AppColors.surface,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/profile_banner.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: topInset + 12,
              left: 16,
              child: _BackButton(onTap: () => Navigator.pop(context)),
            ),
            Positioned(
              top: topInset + 12,
              right: 16,
              child: Row(
                children: [
                  const Icon(Icons.ios_share_rounded, color: Colors.white, size: 22),
                  const SizedBox(width: 18),
                  GestureDetector(
                    onTap: () => context.push('/settings'),
                    child: const Icon(Icons.settings_rounded, color: Colors.white, size: 22),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 44,
                  backgroundColor: AppColors.lightSurface,
                  backgroundImage: AssetImage(avatarAsset),
                ),
                const SizedBox(height: 12),
                Text(username, style: AppTextStyles.heading2.copyWith(color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
    );
  }
}
