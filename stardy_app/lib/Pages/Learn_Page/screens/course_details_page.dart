import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stardy_app/Pages/Learn_Page/models/course_model.dart';
import 'package:stardy_app/Core/color_codes.dart';

import 'package:stardy_app/Pages/Learn_Page/screens/course_home_tab.dart';
import 'package:stardy_app/Pages/Learn_Page/screens/grades_page.dart';
import 'package:stardy_app/Pages/Learn_Page/screens/notes_page.dart';
import 'package:stardy_app/Pages/Learn_Page/screens/resources_page.dart';

class CourseDetailsPage extends StatefulWidget {
  final Course course;

  const CourseDetailsPage({super.key, required this.course});

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  int selectedTab = 0;

  final List<String> tabs = ["Home", "Grades", "Notes", "Resources"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondary,

        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),

                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.access_time, color: Colors.black),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.more_vert, color: Colors.black),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          widget.course.title,
                          style: GoogleFonts.mukta(
                            color: AppColors.primaryDark,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        if (widget.course.subtitle.isNotEmpty) ...[
                          SizedBox(height: 4),
                          Text(
                            "( ${widget.course.subtitle} )",
                            style: GoogleFonts.mukta(
                              color: Colors.grey.shade600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),

                  SizedBox(height: 8),
                ],
              ),
            ),

            Row(
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

            const Divider(height: 1),

            Expanded(child: _buildPage()),
          ],
        ),
      ),
    );
  }

  Widget _buildPage() {
    switch (selectedTab) {
      case 0:
        return HomePage(course: widget.course);

      case 1:
        return const GradesPage();

      case 2:
        return const NotesPage();

      case 3:
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
          style: GoogleFonts.mukta(
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            color: Colors.black,
          ),
        ),

        SizedBox(height: 5),

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
