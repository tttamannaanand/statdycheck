import 'package:flutter/material.dart';
import '../widgets//color_codes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 18),

              // TOP ICON ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _RoundIconBtn(icon: Icons.notifications),
                  _RoundIconBtn(icon: Icons.share_outlined),
                ],
              ),

              const SizedBox(height: 24),

              // PROFILE IMAGE WITH CURVED BG
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipPath(
                    clipper: ProfileCurveClipper(),
                    child: Container(
                      height: 190,
                      width: double.infinity,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  Column(
                    children: [
                      // PROFILE AVATAR
                      Container(
                        width: 158,
                        height: 158,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.background,
                          border: Border.all(
                            color: AppColors.primary,
                            width: 4,
                          ),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 88,
                          color: AppColors.primary,
                        ),
                      ),

                      const SizedBox(height: 6),

                      // LEVEL BADGE
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          'LVL 15',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // NAME
              const Text(
                'Sai Sharan',
                style: TextStyle(
                  color: AppColors.background,
                  fontSize: 34,
                  height: 0.95,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 12),

              // ASSISTANT BADGE
              Container(
                width: 66,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primaryDark.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(42),
                  border: Border.all(
                    color: AppColors.primaryDark.withOpacity(0.6),
                    width: 1.5,
                  ),
                ),
                child: const Icon(
                  Icons.assistant_outlined,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 20),

              // NEXT LEVEL TEXT
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'NEXT LEVEL PROGRESS',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 11,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    '1,450 / 2,000 XP',
                    style: TextStyle(
                      color: AppColors.background,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // PROGRESS BAR
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.primaryDark.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: FractionallySizedBox(
                  widthFactor: 0.73,
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // SKILL CHIPS
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: const [
                  _Chip(text: 'FULL-STACK DEVELOPER'),
                  _Chip(text: 'PRODUCT MANAGER'),
                  _Chip(text: 'DATA SCIENTIST'),
                  _Chip(text: 'ADD', isAdd: true),
                ],
              ),

              const SizedBox(height: 16),

              // PROFILE SETTINGS
              const _SettingsCard(),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// CURVE CLIPPER
class ProfileCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 40,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// UI COMPONENTS
class _RoundIconBtn extends StatelessWidget {
  final IconData icon;
  const _RoundIconBtn({required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: AppColors.primaryDark.withOpacity(0.2),
      child: Icon(icon, color: AppColors.primaryDark),
    );
  }
}

class _Chip extends StatelessWidget {
  final String text;
  final bool isAdd;
  const _Chip({required this.text, this.isAdd = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isAdd
            ? AppColors.primaryDark.withOpacity(0.3)
            : AppColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w800,
          color: AppColors.secondary,
        ),
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.primaryDark.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: const [
          Icon(Icons.person_outline, color: AppColors.secondary),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Profile Settings',
              style: TextStyle(
                color: AppColors.secondary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Icon(Icons.chevron_right, color: AppColors.textSecondary),
        ],
      ),
    );
  }
}
