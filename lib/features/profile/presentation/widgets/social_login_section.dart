import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key, this.onTapInstagram, this.onTapDiscord, this.onTapX});

  final VoidCallback? onTapInstagram;
  final VoidCallback? onTapDiscord;
  final VoidCallback? onTapX;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Log in with', style: AppTextStyles.heading2),
        const SizedBox(height: 12),
        Row(
          children: [
            _SocialIcon(icon: Icons.camera_alt_outlined, onTap: onTapInstagram),
            const SizedBox(width: 16),
            _SocialIcon(icon: Icons.forum_rounded, onTap: onTapDiscord),
            const SizedBox(width: 16),
            _SocialIcon(icon: Icons.close_rounded, onTap: onTapX),
          ],
        ),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  const _SocialIcon({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: AppColors.accentRed, size: 26),
    );
  }
}
