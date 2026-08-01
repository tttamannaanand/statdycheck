import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class WeekRewindSection extends StatelessWidget {
  const WeekRewindSection({
    super.key,
    required this.strongestSubject,
    required this.weakSubject,
    required this.hoursStudied,
    required this.weeksEnrolled,
    required this.enrolledDayMarks,
    this.weekDayLabels = const ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
  });

  final String strongestSubject;
  final String weakSubject;
  final int hoursStudied;
  final int weeksEnrolled;
  final List<bool> enrolledDayMarks;
  final List<String> weekDayLabels;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Week Rewind', style: AppTextStyles.heading1),
        const SizedBox(height: 12),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _SubjectCard(strongestSubject: strongestSubject, weakSubject: weakSubject)),
              const SizedBox(width: 12),
              Expanded(
                child: _StudyStatsCard(
                  hoursStudied: hoursStudied,
                  weeksEnrolled: weeksEnrolled,
                  enrolledDayMarks: enrolledDayMarks,
                  weekDayLabels: weekDayLabels,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SubjectCard extends StatelessWidget {
  const _SubjectCard({required this.strongestSubject, required this.weakSubject});

  final String strongestSubject;
  final String weakSubject;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Strongest Subject', style: AppTextStyles.bodyMuted),
          const SizedBox(height: 4),
          Text(strongestSubject, style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 16),
          Text('Subject you need to work on', style: AppTextStyles.bodyMuted),
          const SizedBox(height: 4),
          Text(weakSubject, style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _StudyStatsCard extends StatelessWidget {
  const _StudyStatsCard({
    required this.hoursStudied,
    required this.weeksEnrolled,
    required this.enrolledDayMarks,
    required this.weekDayLabels,
  });

  final int hoursStudied;
  final int weeksEnrolled;
  final List<bool> enrolledDayMarks;
  final List<String> weekDayLabels;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hours studied', style: AppTextStyles.bodyMuted),
          const SizedBox(height: 4),
          Text('$hoursStudied Hours', style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          Text('Weeks Enrolled', style: AppTextStyles.bodyMuted),
          const SizedBox(height: 4),
          Text('$weeksEnrolled Weeks', style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(weekDayLabels.length, (i) {
              final bool marked = i < enrolledDayMarks.length && enrolledDayMarks[i];
              return Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: marked ? AppColors.accentRed : AppColors.surfaceMuted,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  weekDayLabels[i],
                  style: AppTextStyles.label.copyWith(fontSize: 9, color: Colors.white),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
