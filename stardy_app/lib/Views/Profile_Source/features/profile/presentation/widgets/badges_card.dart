import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:stardy_app/Views/Profile_Source/core/constants/app_colors.dart';

class BadgesCard extends StatelessWidget {
  const BadgesCard({super.key, this.onLoadMore});

  final VoidCallback? onLoadMore;

  static const _badges = [
    _BadgeData(icon: FontAwesomeIcons.dove, label: 'EARLY BIRD'),
    _BadgeData(icon: FontAwesomeIcons.rocket, label: 'FIRST LAUNCH'),
    _BadgeData(icon: FontAwesomeIcons.chessRook, label: 'MULTITASKER'),
    _BadgeData(icon: FontAwesomeIcons.shieldHalved, label: 'COMEBACK KID'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.cardGradient,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'YOUR BADGES',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.05,
              physics: const BouncingScrollPhysics(),
              children: _badges.map((b) => _BadgeTile(data: b)).toList(),
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onLoadMore,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentRed,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: const Text('Load More', style: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}

class _BadgeData {
  const _BadgeData({required this.icon, required this.label});

  final FaIconData icon;
  final String label;
}

class _BadgeTile extends StatelessWidget {
  const _BadgeTile({required this.data});

  final _BadgeData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 58,
            height: 58,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: _HexagonClipper(),
                  child: Container(width: 58, height: 58, color: AppColors.accentRed),
                ),
                ClipPath(
                  clipper: _HexagonClipper(),
                  child: Container(width: 50, height: 50, color: AppColors.surfaceLight),
                ),
                FaIcon(data.icon, color: AppColors.accentRed, size: 22),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            data.label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double w = size.width;
    final double h = size.height;
    return Path()
      ..moveTo(w * 0.5, 0)
      ..lineTo(w, h * 0.25)
      ..lineTo(w, h * 0.75)
      ..lineTo(w * 0.5, h)
      ..lineTo(0, h * 0.75)
      ..lineTo(0, h * 0.25)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
