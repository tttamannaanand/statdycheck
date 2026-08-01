import 'package:flutter/material.dart';

import '../Views/Profile_Source/core/constants/app_colors.dart';
import '../Views/Profile_Source/features/profile/presentation/widgets/badges_card.dart';
import '../Views/Profile_Source/features/profile/presentation/widgets/career_interest_section.dart';
import '../Views/Profile_Source/features/profile/presentation/widgets/certifications_card.dart';
import '../Views/Profile_Source/features/profile/presentation/widgets/profile_header.dart';
import '../Views/Profile_Source/features/profile/presentation/widgets/social_login_section.dart';
import '../Views/Profile_Source/features/profile/presentation/widgets/streak_card.dart';
import '../Views/Profile_Source/features/profile/presentation/widgets/week_rewind_section.dart';
import '../Views/Profile_Source/features/profile/presentation/widgets/xp_progress_section.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late PageController _pageController;

  int currentPage = 0;

  static const String _username = 'Sai';
  static const String _avatarAsset = 'assets/images/profile_avatar.png';

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.96);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ProfileHeader(username: _username, avatarAsset: _avatarAsset),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 380,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      children: const [
                        StreakCard(
                          streakDays: 4,
                          checkedInDays: [true, true, true, true, false, false, false],
                          username: _username,
                        ),
                        BadgesCard(),
                        CertificationsCard(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(3, (index) {
                        final isSelected = currentPage == index;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: isSelected ? 20 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: isSelected ? AppColors.accentRed : AppColors.lightSurface,
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const XpProgressSection(currentXp: 1899, targetXp: 2500, level: 12),
                  const SizedBox(height: 28),
                  const WeekRewindSection(
                    strongestSubject: 'Design Thinking',
                    weakSubject: 'Empathy',
                    hoursStudied: 30,
                    weeksEnrolled: 6,
                    enrolledDayMarks: [true, true, true, true, true, true, true],
                  ),
                  const SizedBox(height: 28),
                  const CareerInterestSection(),
                  const SizedBox(height: 28),
                  const SocialLoginSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
