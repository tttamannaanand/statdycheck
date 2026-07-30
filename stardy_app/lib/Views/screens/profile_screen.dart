import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/streak_card.dart';
import '../widgets/badges_card.dart';
import '../widgets/certifications_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState
    extends State<ProfileScreen> {
  late PageController
      _pageController;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController =
        PageController(
      viewportFraction:
          0.96,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor:
          const Color(
        0xFFF5F4F2,
      ),

      body: SafeArea(
        child:
            SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 20,
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,

              children: [
                const SizedBox(
                  height: 18,
                ),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,

                  children: [
                    _iconButton(
                      Icons
                          .arrow_back_ios_new,
                    ),

                    _iconButton(
                      Icons
                          .settings_outlined,
                      onTap: () {
                        context.push(
                          '/settings',
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(
                  height: 24,
                ),

                Center(
                  child: Container(
                    width: 120,
                    height: 120,

                    decoration:
                        const BoxDecoration(
                      shape:
                          BoxShape.circle,
                      color:
                          Color(
                        0xFFECECEC,
                      ),
                    ),

                    child:
                        const Icon(
                      Icons.person,
                      size: 72,
                      color:
                          Color(
                        0xFFA7ADB7,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),

                const Center(
                  child: Text(
                    'Lakshya Idnani',
                    style:
                        TextStyle(
                      fontSize:
                          28,
                      fontWeight:
                          FontWeight
                              .w700,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 6,
                ),

                Center(
                  child: Text(
                    'Ph No :- 8085235987',
                    style:
                        TextStyle(
                      fontSize:
                          16,
                      color:
                          Colors.grey,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 24,
                ),

                SizedBox(
                  height: 360,

                  child: PageView(
                    controller:
                        _pageController,

                    onPageChanged:
                        (index) {
                      setState(() {
                        currentPage =
                            index;
                      });
                    },

                    children: const [
                      StreakCard(),
                      BadgesCard(),
                      CertificationsCard(),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 18,
                ),

                Center(
                  child: Row(
                    mainAxisSize:
                        MainAxisSize
                            .min,

                    children:
                        List.generate(
                      3,
                      (index) {
                        final isSelected =
                            currentPage ==
                                index;

                        return AnimatedContainer(
                          duration:
                              const Duration(
                            milliseconds:
                                250,
                          ),

                          margin:
                              const EdgeInsets.symmetric(
                            horizontal:
                                4,
                          ),

                          width:
                              isSelected
                                  ? 20
                                  : 8,

                          height:
                              8,

                          decoration:
                              BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(
                              20,
                            ),

                            color:
                                isSelected
                                    ? const Color(
                                        0xFFBE1E4A,
                                      )
                                    : Colors.grey
                                        .shade300,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(
                  height: 24,
                ),

                const Text(
                  'Career Interests',
                  style:
                      TextStyle(
                    fontSize:
                        18,
                    fontWeight:
                        FontWeight
                            .w700,
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Wrap(
                  spacing: 6,
                  runSpacing: 8,

                  children: [
                    _careerChip(
                      context,
                      'UI/UX Designer',
                      '/uiux',
                    ),

                    _careerChip(
                      context,
                      'Front End Dev',
                      '/frontend',
                    ),

                    _careerChip(
                      context,
                      'Data Analyst',
                      '/data',
                    ),
                  ],
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

  Widget _iconButton(
    IconData icon, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: 58,
        height: 58,

        decoration:
            BoxDecoration(
          color:
              const Color(
            0xFFEFEFEF,
          ),

          borderRadius:
              BorderRadius.circular(
            18,
          ),
        ),

        child: Icon(
          icon,
          size: 24,
        ),
      ),
    );
  }

  Widget _careerChip(
    BuildContext context,
    String text,
    String route,
  ) {
    return GestureDetector(
      onTap:
          () => context.push(
            route,
          ),

      child: Container(
        padding:
            const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 8,
        ),

        decoration:
            BoxDecoration(
          borderRadius:
              BorderRadius.circular(
            30,
          ),

          border: Border.all(
            color:
                const Color(
              0xFFBE1E4A,
            ),
          ),
        ),

        child: Text(
          text,
          style:
              const TextStyle(
            fontSize: 12,
            color:
                Color(
              0xFFBE1E4A,
            ),
            fontWeight:
                FontWeight.w600,
          ),
        ),
      ),
    );
  }
}