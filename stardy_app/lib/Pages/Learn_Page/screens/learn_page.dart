import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:stardy_app/Pages/Learn_Page/widgets/course_card.dart';
import 'package:stardy_app/Pages/Learn_Page/models/course_model.dart';
import 'package:stardy_app/Pages/Learn_Page/data/course_data.dart';

import 'package:stardy_app/Core/color_codes.dart';
import 'package:stardy_app/Pages/Learn_Page/widgets/carousel_course_card.dart';

// IMPORT STARBUDDY PAGE
import 'package:stardy_app/Views/screens/chat_BOT.dart';

class Learnpage extends StatefulWidget {
  const Learnpage({super.key});

  @override
  State<Learnpage> createState() => _LearnpageState();
}

class _LearnpageState extends State<Learnpage> {
  bool showStreak = true;

  int selectedIndex = 0;

  String searchQuery = '';

  final List<String> categories = ["Beginner", "Intermediate", "Advanced"];

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

  // =====================================================
  // FILTER COURSES
  // =====================================================

  List<Course> _filterCourses() {
    return courses.where((course) {
      final matchesCategory = course.category == categories[selectedIndex];

      final matchesSearch = course.title.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );

      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredCourses = _filterCourses();

    return Scaffold(
      backgroundColor: AppColors.background,

      // =====================================================
      // FLOATING STARBUDDY BUTTON
      // =====================================================
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),

        child: FloatingActionButton(
          backgroundColor: AppColors.primaryDark,
          elevation: 10,

          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const StarBuddyPage()),
            );
          },

          child: const Icon(
            Icons.smart_toy_outlined,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),

            Expanded(child: _buildBody(filteredCourses)),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // HEADER
  // =====================================================

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),

      child: Column(
        children: [
          SizedBox(height: 10),

          _topBar(),

          if (showStreak) _streakBanner(),

          _searchBar(),

          _categoryRow(),
        ],
      ),
    );
  }

  // =====================================================
  // TOP BAR
  // =====================================================

  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        const Icon(Icons.notifications_none, color: AppColors.primaryDark),

        GestureDetector(
          onTap: () => context.push('/profile'),

          child: const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/Group_17.png"),
          ),
        ),
      ],
    );
  }

  // =====================================================
  // STREAK BANNER
  // =====================================================

  Widget _streakBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),

      child: Container(
        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: AppColors.primaryDark,

          borderRadius: BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(
              color: AppColors.primaryDark.withOpacity(0.5),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Row(
          children: [
            Expanded(
              child: Text(
                "Continue your 7 day learning Streak !! 🔥",
                style: GoogleFonts.mukta(color: Colors.white),
              ),
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  showStreak = false;
                });
              },

              child: const Icon(Icons.close, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // SEARCH BAR
  // =====================================================

  Widget _searchBar() {
    return Container(
      height: 50,

      padding: const EdgeInsets.symmetric(horizontal: 15),

      decoration: BoxDecoration(
        color: AppColors.secondary,

        borderRadius: BorderRadius.circular(20),

        border: Border.all(color: Colors.white.withOpacity(0.05)),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Row(
        children: [
          const Icon(Icons.search, color: AppColors.textSecondary),

          SizedBox(width: 10),

          Expanded(
            child: TextField(
              style: GoogleFonts.mukta(
                color: AppColors.textPrimary,
                fontSize: 16,
              ),

              cursorColor: AppColors.textPrimary,

              decoration: InputDecoration(
                hintText: "Search courses",

                hintStyle: GoogleFonts.mukta(
                  color: AppColors.textSecondary,
                  fontSize: 15,
                ),

                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),

              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // CATEGORY ROW
  // =====================================================

  Widget _categoryRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,

        child: Row(
          children: List.generate(categories.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),

              child: _chip(categories[index], index),
            );
          }),
        ),
      ),
    );
  }

  // =====================================================
  // BODY
  // =====================================================

  Widget _buildBody(List<Course> filteredCourses) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(height: 20),

          Text(
            "New Courses",

            style: GoogleFonts.mukta(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),

          SizedBox(height: 15),

          _carousel(),

          SizedBox(height: 25),

          Text(
            "Continue Learning",

            style: GoogleFonts.mukta(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),

          SizedBox(height: 15),

          _courseList(filteredCourses),

          SizedBox(height: 130),
        ],
      ),
    );
  }

  // =====================================================
  // CAROUSEL
  // =====================================================

  Widget _carousel() {
    return SizedBox(
      height: 270,

      child: CarouselSlider.builder(
        itemCount: courses.length,

        options: CarouselOptions(
          height: 270,
          enlargeCenterPage: true,
          viewportFraction: 0.75,
          autoPlay: true,
        ),

        itemBuilder: (context, index, realIndex) {
          return CarouselCourseCard(course: courses[index]);
        },
      ),
    );
  }

  // =====================================================
  // COURSE LIST
  // =====================================================

  Widget _courseList(List<Course> filteredCourses) {
    if (filteredCourses.isEmpty) {
      return Padding(
        padding: EdgeInsets.only(top: 30),

        child: Center(
          child: Text(
            "No courses found",

            style: GoogleFonts.mukta(color: Colors.white70, fontSize: 16),
          ),
        ),
      );
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),

      child: Column(
        key: ValueKey(selectedIndex + searchQuery.hashCode),

        children: filteredCourses
            .map((course) => CourseCard(course: course))
            .toList(),
      ),
    );
  }

  // =====================================================
  // CATEGORY CHIP
  // =====================================================

  Widget _chip(String text, int index) {
    final bool selected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),

        decoration: BoxDecoration(
          color: selected ? AppColors.primaryDark : AppColors.secondary,

          borderRadius: BorderRadius.circular(20),

          border: Border.all(color: Colors.white.withOpacity(0.05)),

          boxShadow: [
            BoxShadow(
              color: selected
                  ? AppColors.primaryDark.withOpacity(0.6)
                  : Colors.black.withOpacity(0.25),

              blurRadius: selected ? 14 : 8,

              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Text(
          text,

          style: GoogleFonts.mukta(
            color: selected ? Colors.white : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
