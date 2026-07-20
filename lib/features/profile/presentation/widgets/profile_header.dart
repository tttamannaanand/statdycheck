import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.username,
    required this.avatarUrl,
  });

  final String username;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(28),
        bottomRight: Radius.circular(28),
      ),
      child: Container(
        height: 220,
        width: double.infinity,
        color: AppColors.surface,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0.25,
              child: CustomPaint(
                size: const Size(double.infinity, 220),
                painter: _GridPatternPainter(),
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: _RoundIconButton(
                icon: Icons.chevron_left_rounded,
                onTap: () => context.pop(),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: Row(
                children: [
                  _RoundIconButton(icon: Icons.ios_share_rounded, onTap: () {}),
                  const SizedBox(width: 10),
                  _RoundIconButton(icon: Icons.settings_rounded, onTap: () {}),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 44,
                  backgroundColor: AppColors.surfaceMuted,
                  backgroundImage: NetworkImage(avatarUrl),
                ),
                const SizedBox(height: 12),
                Text(username, style: AppTextStyles.body),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: AppColors.surfaceLight,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.textPrimary, size: 20),
      ),
    );
  }
}

class _GridPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.textMuted
      ..strokeWidth = 0.6;
    const step = 22.0;
    for (double x = -size.height; x < size.width; x += step) {
      canvas.drawLine(Offset(x, size.height), Offset(x + size.height, 0), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
