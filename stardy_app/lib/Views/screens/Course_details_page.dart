import 'package:flutter/material.dart';
import '../widgets/Course_Source/courseModel.dart';
import '../widgets/color_codes.dart';
import '../screens/Video_Larning_Page.dart';

class CourseDetailsPage extends StatelessWidget {
  final Course course;
  const CourseDetailsPage({super.key, required this.course});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,

      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Icon(Icons.alarm, color: Colors.black),
          SizedBox(width: 15),
          Icon(Icons.more_vert, color: Colors.black),
          SizedBox(width: 10),
        ],
        title: Text(
          course.title,
          style: const TextStyle(
            color: AppColors.primaryDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _tab("Home", true),
                _tab("Grades", false),
                _tab("Notes", false),
                _tab("Resources", false),
              ],
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Progress
                    Text(
                      "${(course.progress * 100).toInt()}% Module completed",
                      style: const TextStyle(color: AppColors.primaryDark),
                    ),

                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColors.primaryDark.withOpacity(0.2),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: course.progress,
                                backgroundColor: AppColors.secondary,
                                color: AppColors.primary,
                                minHeight: 8,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            Icon(Icons.download_outlined),
                            Column(
                              children: [
                                Text(
                                  'Download',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight(600),
                                  ),
                                ),
                                Text('200 MB', style: TextStyle(fontSize: 8)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    /// Upload Date & Duration
                    Text(
                      "0 Assignments due",
                      style: const TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 20),

                    /// Chapters Count (New 🔥)
                    Text(
                      "Total Chapters: ${course.chapters.length}",
                      style: const TextStyle(
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// Description
                    const Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      course.description,
                      style: const TextStyle(color: Colors.grey, height: 1.5),
                    ),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// ---------------- START BUTTON ----------------
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoLearningPage(course: course),
                ),
              );
            },
            child: const Text(
              "Start Learning",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _tab(String text, bool selected) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 4,
            width: 60,

            color: selected ? Colors.black : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
