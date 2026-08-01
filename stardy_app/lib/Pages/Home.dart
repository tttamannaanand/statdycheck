// =========================================================
// IMPORT
// =========================================================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import '../Core/color_codes.dart';
import '../Views/screens/chat_BOT.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 16),

              // =========================================================
              // TOP BAR
              // =========================================================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Container(
                    width: 44,
                    height: 44,

                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.notifications_outlined,
                      color: AppColors.primaryDark,
                      size: 22,
                    ),
                  ),

                  Text(
                    'Hi Sai',

                    style: GoogleFonts.mukta(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                      letterSpacing: -0.8,
                    ),
                  ),

                  GestureDetector(
                    onTap: () => context.push('/profile'),

                    child: Container(
                      width: 44,
                      height: 44,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                      ),

                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/profile_avatar.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // =========================================================
              // TITLE
              // =========================================================
              Text(
                'Recommended for You',

                style: GoogleFonts.mukta(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDark,
                  letterSpacing: -0.8,
                ),
              ),

              const SizedBox(height: 12),

              // =========================================================
              // HERO CARD
              // =========================================================
              Container(
                width: double.infinity,
                height: 200,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade300,

                  image: const DecorationImage(
                    image: AssetImage('assets/images/home_hero.png'),
                    fit: BoxFit.cover,
                  ),
                ),

                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),

                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,

                          colors: [
                            Colors.transparent,
                            AppColors.primaryDark.withValues(alpha: 0.6),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 16,
                      left: 16,
                      right: 16,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            'Software Engineering',

                            style: GoogleFonts.mukta(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.background,
                              letterSpacing: -0.8,
                            ),
                          ),

                          Text(
                            'Master full-stack development with AI guided projects',

                            style: GoogleFonts.mukta(
                              fontSize: 12,
                              color: AppColors.background.withValues(alpha: 0.85),
                              letterSpacing: -0.8,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      bottom: 16,
                      left: 16,

                      child: GestureDetector(
                        onTap: () => context.go('/learn'),

                        child: Container(
                          width: 44,
                          height: 44,

                          decoration: BoxDecoration(
                            color: AppColors.background.withValues(alpha: 0.2),
                            shape: BoxShape.circle,

                            border: Border.all(
                              color: AppColors.background.withValues(alpha: 0.5),
                            ),
                          ),

                          child: const Icon(
                            Icons.arrow_outward,
                            color: AppColors.background,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // =========================================================
              // STARBUDDY CARD
              // =========================================================
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const StarBuddyPage()),
                  );
                },

                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),

                  decoration: BoxDecoration(
                    color: AppColors.primaryDark,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,

                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(14),
                        ),

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset(
                            'assets/images/starbuddy.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(width: 14),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              'Meet StarBuddy !!',

                              style: GoogleFonts.mukta(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.background,
                                letterSpacing: -0.8,
                              ),
                            ),

                            Text(
                              'Your AI mentor is here.\nTap to chat and ask anything...',

                              style: GoogleFonts.mukta(
                                fontSize: 12,
                                color: AppColors.background.withValues(alpha: 0.6),
                                letterSpacing: -0.8,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
