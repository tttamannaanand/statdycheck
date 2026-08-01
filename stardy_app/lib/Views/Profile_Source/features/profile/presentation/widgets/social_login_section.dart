import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:stardy_app/Views/Profile_Source/core/constants/app_colors.dart';
import 'package:stardy_app/Views/Profile_Source/core/constants/app_typography.dart';

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
        Text('Log In with', style: AppTextStyles.heading2.copyWith(color: AppColors.textDark)),
        const SizedBox(height: 12),
        Row(
          children: [
            _SocialIcon(icon: FontAwesomeIcons.instagram, onTap: onTapInstagram),
            const SizedBox(width: 14),
            _SocialIcon(icon: FontAwesomeIcons.discord, onTap: onTapDiscord),
            const SizedBox(width: 14),
            _SocialIcon(icon: FontAwesomeIcons.xTwitter, onTap: onTapX),
          ],
        ),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  const _SocialIcon({required this.icon, this.onTap});

  final FaIconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.accentRed, width: 1.6),
        ),
        child: Center(child: FaIcon(icon, color: AppColors.accentRed, size: 20)),
      ),
    );
  }
}
