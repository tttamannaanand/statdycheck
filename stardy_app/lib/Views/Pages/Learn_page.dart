import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:stardy_app/Views/widgets/Course_Source/courseCard.dart';
import 'package:stardy_app/Views/widgets/Course_Source/courseModel.dart';
import 'package:stardy_app/Views/widgets/Course_Source/course_data.dart';

import 'package:stardy_app/Views/widgets/New_carousel_course/carousel_data.dart';

import 'package:stardy_app/Views/widgets/color_codes.dart';
import '../widgets/New_carousel_course/carousel_course_card.dart';

class Learnpage extends StatefulWidget {
  const Learnpage({super.key});

  @override
  State<Learnpage> createState() => _LearnpageState();
}

class _LearnpageState extends State<Learnpage> {
  bool showStreak = true;
  int selectedIndex = 0;

  final List<String> categories = ["Beginner", "Intermediate", "Advanced"];

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() => showStreak = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredCourses = _filterCourses();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: _buildBody(filteredCourses),
    );
  }

  // ================= FILTER =================
  List<Course> _filterCourses() {
    return courses
        .where((course) => course.category == categories[selectedIndex])
        .toList();
  }

  // ================= APPBAR =================
  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(showStreak ? 240 : 180),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 10),
              _topBar(),
              if (showStreak) _streakBanner(),
              _searchBar(),
              _categoryRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topBar() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.notifications_none, color: AppColors.primaryDark),
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage("assets/images/stardy-logo.png"),
        ),
      ],
    );
  }

  Widget _streakBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.5),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
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
              onTap: () => setState(() => showStreak = false),
              child: const Icon(Icons.close, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

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
      child: const Row(
        children: [
          Icon(Icons.search, color: AppColors.textSecondary),
          SizedBox(width: 10),
          Text("Search", style: TextStyle(color: AppColors.textSecondary)),
        ],
      ),
    );
  }

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

  // ================= BODY =================
  Widget _buildBody(List<Course> filteredCourses) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          const Text(
            "New Courses",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 15),

          _carousel(),

          const SizedBox(height: 25),

          const Text(
            "Continue Learning",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 15),

          _courseList(filteredCourses),

          const SizedBox(height: 100),
        ],
      ),
    );
  }

  // ================= CAROUSEL =================
  Widget _carousel() {
    return SizedBox(
      height: 270,
      child: CarouselSlider.builder(
        itemCount: carouselCourses.length,
        options: CarouselOptions(
          height: 270,
          enlargeCenterPage: true,
          viewportFraction: 0.75,
        ),
        itemBuilder: (context, index, realIndex) {
          return CarouselCourseCard(course: carouselCourses[index]);
        },
      ),
    );
  }

  // ================= COURSE LIST =================
  Widget _courseList(List<Course> filteredCourses) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Column(
        key: ValueKey(selectedIndex),
        children: filteredCourses
            .map((course) => CourseCard(course: course))
            .toList(),
      ),
    );
  }

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
          style: TextStyle(
            color: selected ? Colors.white : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
