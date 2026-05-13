import 'package:flutter/material.dart';
import 'package:stardy_app/Views/Cources/Course_Source/courseModel.dart';
import 'package:stardy_app/Views/widgets/color_codes.dart';

import '../Cources/Course_SUB_Pages/ home_page.dart';
import '../Cources/Course_SUB_Pages/grades_page.dart';
import '../Cources/Course_SUB_Pages/resources_page.dart';

class CourseDetailsPage extends StatefulWidget {
  final Course course;

  const CourseDetailsPage({super.key, required this.course});

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  int selectedTab = 0;

  final List<String> tabs = ["Home", "Grades", "Resources"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,

      appBar: AppBar(
        backgroundColor: AppColors.secondary,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),

        title: Text(
          widget.course.title,
          style: const TextStyle(
            color: AppColors.primaryDark,
            fontWeight: FontWeight.bold,
          ),
        ),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: List.generate(
              tabs.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTab = index;
                  });
                },

                child: _tab(tabs[index], selectedTab == index),
              ),
            ),
          ),
        ),
      ),

      body: _buildPage(),
    );
  }

  Widget _buildPage() {
    switch (selectedTab) {
      case 0:
        return HomePage(course: widget.course);

      case 1:
        return const GradesPage();

      case 2:
        return const ResourcesPage();

      default:
        return HomePage(course: widget.course);
    }
  }

  Widget _tab(String text, bool selected) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        Text(
          text,
          style: TextStyle(
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 5),

        AnimatedContainer(
          duration: const Duration(milliseconds: 300),

          height: 4,
          width: 60,

          decoration: BoxDecoration(
            color: selected ? Colors.black : Colors.transparent,

            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
