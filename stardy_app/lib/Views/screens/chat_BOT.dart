import 'package:flutter/material.dart';

class StarBuddyPage extends StatelessWidget {
  const StarBuddyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),

          child: Column(
            children: [
              const SizedBox(height: 8),

              // =========================================================
              // TOP BAR
              // =========================================================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,

                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),

                        child: const Icon(
                          Icons.smart_toy_outlined,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),

                          border: Border.all(
                            color: Colors.redAccent,
                            width: 1.2,
                          ),
                        ),

                        child: const Row(
                          children: [
                            Text(
                              "Get Pro",

                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),

                            SizedBox(width: 6),

                            Icon(Icons.add, color: Colors.redAccent, size: 18),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      _topIcon(Icons.person_add_alt_1_outlined),

                      const SizedBox(width: 10),

                      _topIcon(Icons.menu),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // =========================================================
              // LOGO
              // =========================================================
              Container(
                width: 100,
                height: 42,

                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),

              const SizedBox(height: 55),

              // =========================================================
              // CHAT BUBBLE
              // =========================================================
              Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(24),
                      ),

                      child: const Text(
                        "What can I help you with ?",

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Container(
                    width: 44,
                    height: 44,

                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.smart_toy_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // =========================================================
              // QUICK ACTIONS
              // =========================================================
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 14,
                runSpacing: 14,

                children: [
                  _quickButton(icon: Icons.work_outline, title: "Career"),

                  _quickButton(icon: Icons.description_outlined, title: "Jobs"),

                  _quickButton(icon: Icons.menu_book_outlined, title: "Course"),

                  _quickButton(icon: Icons.school_outlined, title: "Titles"),
                ],
              ),

              const Spacer(),

              // =========================================================
              // BOTTOM CHAT INPUT
              // =========================================================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),

                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(36),
                ),

                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 16),

                        decoration: InputDecoration(
                          hintText: "Ask Starbuddy",

                          hintStyle: TextStyle(
                            color: Colors.white54,
                            fontSize: 16,
                          ),

                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    const Icon(
                      Icons.mic_none_rounded,
                      color: Colors.white,
                      size: 24,
                    ),

                    const SizedBox(width: 10),

                    Container(
                      width: 48,
                      height: 48,

                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.send_rounded,
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }

  // =========================================================
  // TOP ICON
  // =========================================================

  static Widget _topIcon(IconData icon) {
    return Container(
      width: 42,
      height: 42,

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        shape: BoxShape.circle,
      ),

      child: Icon(icon, color: Colors.black54, size: 22),
    );
  }

  // =========================================================
  // QUICK BUTTON
  // =========================================================

  static Widget _quickButton({required IconData icon, required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),

        border: Border.all(color: Colors.grey.shade300),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(icon, color: Colors.black, size: 22),

          const SizedBox(width: 10),

          Text(
            title,

            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
