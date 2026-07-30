import 'package:flutter/material.dart';

import '../widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF5F4F2,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(
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
                        width: 64,
                        height: 64,

                        decoration:
                            BoxDecoration(
                              color:
                                  const Color(
                                    0xFFEEEEEE,
                                  ),
                              borderRadius:
                                  BorderRadius.circular(
                                    22,
                                  ),
                            ),

                        child: const Icon(
                          Icons
                              .arrow_back_ios_new,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 26,
                ),

                /// profile image
                Container(
                  width: 120,
                  height: 120,

                  decoration:
                      const BoxDecoration(
                        shape:
                            BoxShape.circle,
                        color:
                            Color(
                              0xFFF0F0F0,
                            ),
                      ),

                  child: const Icon(
                    Icons.person,
                    size: 75,
                    color: Color(
                      0xFFA6AAB7,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 18,
                ),

                const Text(
                  'Lakshya Idnani',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight:
                        FontWeight.w700,
                    color: Color(
                      0xFF16161E,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 6,
                ),

                const Text(
                  'Ph No :- 8085235987',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(
                  height: 28,
                ),

                /// settings card
                Container(
                  decoration:
                      BoxDecoration(
                        color:
                            Colors.white,
                        borderRadius:
                            BorderRadius.circular(
                              30,
                            ),
                      ),

                  child: Column(
                    children: const [
                      SettingsTile(
                        icon:
                            Icons.person_outline,
                        title:
                            'Personal Information',
                        subtitle:
                            '',
                      ),

                      SettingsTile(
                        icon:
                            Icons
                                .wb_sunny_outlined,
                        title:
                            'Theme',
                        subtitle:
                            'Light',
                      ),

                      SettingsTile(
                        icon:
                            Icons.language,
                        title:
                            'Language',
                        subtitle:
                            'English (UK)',
                      ),

                      SettingsTile(
                        icon:
                            Icons
                                .description_outlined,
                        title:
                            'Terms & Conditions',
                        subtitle:
                            '',
                      ),

                      SettingsTile(
                        icon:
                            Icons.info_outline,
                        title:
                            'About Stardy',
                        subtitle:
                            '',
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 22,
                ),

                /// logout card
                Container(
                  padding:
                      const EdgeInsets.symmetric(
                        horizontal:
                            22,
                        vertical:
                            22,
                      ),

                  decoration:
                      BoxDecoration(
                        color:
                            Colors.white,
                        borderRadius:
                            BorderRadius.circular(
                              24,
                            ),
                      ),

                  child: const Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Color(
                          0xFFB61D45,
                        ),
                        size: 26,
                      ),

                      SizedBox(
                        width: 14,
                      ),

                      Text(
                        'Log Out',
                        style:
                            TextStyle(
                              fontSize:
                                  20,
                              fontWeight:
                                  FontWeight
                                      .w600,
                              color:
                                  Color(
                                    0xFFB61D45,
                                  ),
                            ),
                      ),

                      Spacer(),

                      Icon(
                        Icons
                            .chevron_right,
                        color: Color(
                          0xFFB61D45,
                        ),
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