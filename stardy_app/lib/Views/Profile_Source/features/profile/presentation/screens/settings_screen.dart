import 'package:flutter/material.dart';

import 'package:stardy_app/Views/Profile_Source/core/constants/app_colors.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),

            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),

                /// top bar
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(
                          context,
                        );
                      },

                      child: Container(
                        width: 52,
                        height: 52,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: AppColors.lightBorder),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),

                        child: const Icon(
                          Icons.chevron_left_rounded,
                          size: 26,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 26,
                ),

                /// profile image
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColors.lightSurface,
                  backgroundImage: AssetImage('assets/images/profile_avatar.png'),
                ),

                const SizedBox(
                  height: 18,
                ),

                const Text(
                  'Sai',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),

                const SizedBox(
                  height: 6,
                ),

                Text(
                  'Ph No :- 8085235987',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textDarkMuted,
                  ),
                ),

                const SizedBox(
                  height: 28,
                ),

                /// settings card
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(30),
                  ),

                  child: const Column(
                    children: [
                      SettingsTile(
                        icon: Icons.person_outline,
                        title: 'Personal Information',
                        subtitle: '',
                      ),

                      SettingsTile(
                        icon: Icons.wb_sunny_outlined,
                        title: 'Theme',
                        subtitle: 'Light',
                      ),

                      SettingsTile(
                        icon: Icons.language,
                        title: 'Language',
                        subtitle: 'English (UK)',
                      ),

                      SettingsTile(
                        icon: Icons.description_outlined,
                        title: 'Terms & Conditions',
                        subtitle: '',
                      ),

                      SettingsTile(
                        icon: Icons.info_outline,
                        title: 'About Stardy',
                        subtitle: '',
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 22,
                ),

                /// logout card
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 20,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppColors.accentRed.withValues(alpha: 0.3)),
                  ),

                  child: const Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: AppColors.accentRed,
                        size: 24,
                      ),

                      SizedBox(
                        width: 14,
                      ),

                      Text(
                        'Log Out',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.accentRed,
                        ),
                      ),

                      Spacer(),

                      Icon(
                        Icons.chevron_right,
                        color: AppColors.accentRed,
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
