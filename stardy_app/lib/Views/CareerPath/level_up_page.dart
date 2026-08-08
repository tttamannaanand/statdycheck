import 'package:flutter/material.dart';
import '../widgets/color_codes.dart';
import '../../services/auth_service.dart';
import '../../services/firestore_service.dart';

class LevelUpPage extends StatefulWidget {
  final VoidCallback? onContinue;
  final int xpEarned;

  const LevelUpPage({super.key, this.onContinue, this.xpEarned = 7750});

  @override
  State<LevelUpPage> createState() => _LevelUpPageState();
}

class _LevelUpPageState extends State<LevelUpPage> {
  @override
  void initState() {
    super.initState();
    _saveProgress();
  }

  Future<void> _saveProgress() async {
    final uid = AuthService.instance.currentUser?.uid;
    if (uid == null) return;

    try {
      final profile = await UserProfileService.instance.fetchProfile(uid);
      final currentXp = (profile?['xp'] as int?) ?? 0;
      final currentLevel = (profile?['level'] as int?) ?? 1;
      await UserProfileService.instance.updateXp(
        uid,
        xp: currentXp + widget.xpEarned,
        level: currentLevel + 1,
      );
    } catch (_) {
      // No Firestore project configured yet — level up just won't persist.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDEDED),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.chevron_left, color: Colors.black),
                ),
              ),
              const Spacer(),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.hexagon,
                      size: 110,
                      color: AppColors.primary.withValues(alpha: 0.6),
                    ),
                    const Icon(
                      Icons.hexagon,
                      size: 96,
                      color: AppColors.primaryDark,
                    ),
                    const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'LEVEL UP!',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _rewardTile(
                    icon: Icons.shield_outlined,
                    iconColor: AppColors.primary,
                    label: 'Badge',
                    sublabel: 'New badge',
                  ),
                  _rewardTile(
                    icon: Icons.bolt,
                    iconColor: Colors.white,
                    iconBg: AppColors.primary,
                    label: '+7,750',
                    sublabel: 'XP Earned',
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: widget.onContinue ??
                      () {
                        Navigator.of(
                          context,
                        ).popUntil(ModalRoute.withName('/module-list'));
                      },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Sharing isn\'t available in this demo yet')),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 56,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Share the News',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 22,
                            height: 22,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.bolt,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            '+250',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rewardTile({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String sublabel,
    Color? iconBg,
  }) {
    return Column(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: iconBg,
            border: iconBg == null
                ? Border.all(color: AppColors.primary, width: 1.5)
                : null,
          ),
          child: Icon(icon, color: iconColor),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          sublabel,
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
        ),
      ],
    );
  }
}
