import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class StreakCard extends StatelessWidget {
  const StreakCard({
    super.key,
    required this.streakDays,
    required this.checkedInDays,
    required this.username,
    this.weekDayLabels = const ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
    this.trailingDates = const [29, 30, 31],
  });

  final int streakDays;
  final List<bool> checkedInDays;
  final String username;
  final List<String> weekDayLabels;
  final List<int> trailingDates;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 16,
            child: _backgroundCard(width: 0.86, color: AppColors.surfaceMuted.withOpacity(0.6)),
          ),
          Positioned(
            top: 8,
            child: _backgroundCard(width: 0.93, color: AppColors.surfaceLight.withOpacity(0.8)),
          ),
          _mainCard(context),
        ],
      ),
    );
  }

  Widget _backgroundCard({required double width, required Color color}) {
    return FractionallySizedBox(
      widthFactor: width,
      child: Container(
        height: 260,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }

  Widget _mainCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Text('$streakDays', style: AppTextStyles.displayHuge),
          const SizedBox(height: 4),
          Text('Days Streak', style: AppTextStyles.heading2),
          const SizedBox(height: 4),
          Text(
            "You're doing really great ${username.replaceAll('@', '').split('_').first[0].toUpperCase()}${username.replaceAll('@', '').split('_').first.substring(1)}",
            style: AppTextStyles.bodyMuted,
          ),
          const SizedBox(height: 18),
          Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.local_fire_department_rounded,
              color: AppColors.accentRed,
              size: 34,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(weekDayLabels.length, (i) {
              final bool isCurrent = i == checkedInDays.length - 3;
              return Text(
                weekDayLabels[i],
                style: AppTextStyles.label.copyWith(
                  color: isCurrent ? Colors.white : AppColors.textSecondary,
                  fontWeight: isCurrent ? FontWeight.w800 : FontWeight.w600,
                ),
              );
            }),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(weekDayLabels.length, (i) {
              if (i < checkedInDays.length && checkedInDays[i]) {
                return _CheckBadge();
              }
              final dateIndex = i - checkedInDays.where((e) => e).length;
              final date = dateIndex >= 0 && dateIndex < trailingDates.length
                  ? trailingDates[dateIndex]
                  : null;
              return SizedBox(
                width: 30,
                child: Center(
                  child: Text(
                    date?.toString() ?? '',
                    style: AppTextStyles.bodyMuted,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _CheckBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
        color: AppColors.accentRed,
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.check_rounded, color: Colors.white, size: 16),
    );
  }
}
