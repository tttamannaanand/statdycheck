import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stardy_app/Views/widgets/Course_Source/courseCard.dart';
import 'package:stardy_app/Views/widgets/Course_Source/course_data.dart';
import 'package:stardy_app/Views/widgets/color_codes.dart';

class Learnpage extends StatefulWidget {
  const Learnpage({super.key});

  @override
  State<Learnpage> createState() => _LearnpageState();
}

class _LearnpageState extends State<Learnpage> {
  bool showStreak = true;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          showStreak = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      // 🔥 APPBAR
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(showStreak ? 240 : 180),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 10),

                // 🔔 Top Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.notifications_none,
                      color: AppColors.primaryDark,
                    ),
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                        "assets/images/stardy-logo.png",
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // 🔴 Streak Banner
                if (showStreak)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Continue your 7 day learning Streak !! 🔥",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() => showStreak = false);
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),

                if (showStreak) const SizedBox(height: 15),

                // 🔍 Search
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.secondary),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: AppColors.textSecondary),
                      SizedBox(width: 10),
                      Text(
                        "Search",
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // 🟢 Chips
                Row(
                  children: [
                    _chip("Beginner", true),
                    _chip("Intermediate", false),
                    _chip("Advanced", false),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      // 📱 BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // 📚 New Courses
            const Text(
              "New Courses",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _courseCard(),
                  const SizedBox(width: 15),
                  _courseCard(),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 📖 Continue Learning
            const Text(
              "Continue Learning",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 15),

            Column(
              children: courses.map((course) {
                return CourseCard(course: course);
              }).toList(),
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  // 🔘 Chip
  Widget _chip(String text, bool selected) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryDark : AppColors.secondary,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.secondary),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }

  // 📦 Course Card
  Widget _courseCard() {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage("assets/images/stardy-logo.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
