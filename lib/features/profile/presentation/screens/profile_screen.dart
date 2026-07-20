import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../application/profile_provider.dart';
import '../widgets/career_interests_section.dart';
import '../widgets/profile_header.dart';
import '../widgets/social_login_section.dart';
import '../widgets/streak_card.dart';
import '../widgets/week_rewind_section.dart';
import '../widgets/xp_progress_section.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.accentRed)),
        error: (error, stack) => Center(
          child: Text('Something went wrong', style: TextStyle(color: AppColors.textPrimary)),
        ),
        data: (profile) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileHeader(username: profile.username, avatarUrl: profile.avatarUrl),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    StreakCard(
                      streakDays: profile.streakDays,
                      checkedInDays: profile.checkedInDays,
                      username: profile.username,
                    ),
                    const SizedBox(height: 20),
                    XpProgressSection(
                      currentXp: profile.currentXp,
                      targetXp: profile.targetXp,
                      level: profile.level,
                    ),
                    const SizedBox(height: 28),
                    WeekRewindSection(
                      strongestSubject: profile.strongestSubject,
                      weakSubject: profile.weakSubject,
                      hoursStudied: profile.hoursStudied,
                      weeksEnrolled: profile.weeksEnrolled,
                      enrolledDayMarks: profile.enrolledDayMarks,
                    ),
                    const SizedBox(height: 28),
                    CareerInterestsSection(
                      interests: profile.careerInterests,
                      onInterestTap: (interest) {
                        final subjectId = interest.toLowerCase().replaceAll(' ', '-');
                        context.push('/subjects/$subjectId/detail');
                      },
                    ),
                    const SizedBox(height: 28),
                    const SocialLoginSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
