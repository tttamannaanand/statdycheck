import 'package:flutter/material.dart';
import '../Course_Source/courseModel.dart';
import '../../widgets/color_codes.dart';
import '../Course_Source/Video_Larning_Page.dart';
import '../Course_SUB_Pages/assignment_page.dart';

class HomePage extends StatelessWidget {
  final Course course;

  const HomePage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProgressSection(),

          const SizedBox(height: 25),

          _buildDescriptionSection(),

          const SizedBox(height: 30),

          _buildCurrentVideoCard(context),

          const SizedBox(height: 30),

          _buildChapterCount(),

          const SizedBox(height: 30),

          _buildUpNextSection(context),

          const SizedBox(height: 30),

          _buildAssignmentSection(context),

          const SizedBox(height: 100),
        ],
      ),
    );
  }

  // =====================================================
  // PROGRESS SECTION
  // =====================================================

  Widget _buildProgressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${(course.progress * 100).toInt()}% Module completed",
          style: const TextStyle(color: AppColors.primaryDark),
        ),

        const SizedBox(height: 8),

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

            const SizedBox(width: 10),

            const Row(
              children: [
                Icon(Icons.download_outlined),

                SizedBox(width: 5),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Download',

                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Text('200 MB', style: TextStyle(fontSize: 8)),
                  ],
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 12),

        const Text("0 Assignments due", style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  // =====================================================
  // DESCRIPTION SECTION
  // =====================================================

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Text(
          "Description",

          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Text(
          course.description,

          style: const TextStyle(color: Colors.grey, height: 1.5),
        ),
      ],
    );
  }

  // =====================================================
  // CURRENT VIDEO CARD
  // =====================================================

  Widget _buildCurrentVideoCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(24),

        border: Border.all(color: Colors.red.shade200),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            course.chapters.first.topics.first.title,

            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "This lecture talks about communication design and related concepts.",

            style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.5),
          ),

          const SizedBox(height: 25),

          Row(
            children: [
              _smallButton(icon: Icons.play_arrow_outlined, text: "Video"),

              const SizedBox(width: 10),

              _smallButton(text: "5 min"),

              const Spacer(),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (_) => VideoLearningPage(course: course),
                    ),
                  );
                },

                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 14,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.black,

                    borderRadius: BorderRadius.circular(14),
                  ),

                  child: const Text(
                    "Play",

                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // =====================================================
  // CHAPTER COUNT
  // =====================================================

  Widget _buildChapterCount() {
    return Text(
      "Total Chapters: ${course.chapters.length}",

      style: const TextStyle(
        color: AppColors.primaryDark,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }

  // =====================================================
  // UP NEXT SECTION
  // =====================================================

  Widget _buildUpNextSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Text(
          "Up Next",

          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 20),

        ...course.chapters.expand(
          (chapter) => chapter.topics.map(
            (topic) => Padding(
              padding: const EdgeInsets.only(bottom: 16),

              child: _buildVideoCard(context, topic.title),
            ),
          ),
        ),
      ],
    );
  }

  // =====================================================
  // VIDEO CARD
  // =====================================================

  Widget _buildVideoCard(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,

          MaterialPageRoute(builder: (_) => VideoLearningPage(course: course)),
        );
      },

      child: Container(
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    title,

                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 18),

                  Row(
                    children: [
                      _darkTag("Video"),

                      const SizedBox(width: 10),

                      _darkTag("15 min"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            Container(
              height: 55,
              width: 55,

              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),

              child: const Icon(Icons.play_arrow, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // ASSIGNMENT SECTION
  // =====================================================

  Widget _buildAssignmentSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Text(
          "Assignments",

          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 20),

        _buildAssignmentCard(context, "UI Design Assignment", "Due Tomorrow"),

        const SizedBox(height: 16),

        _buildAssignmentCard(
          context,
          "Flutter App Assignment",
          "Due in 3 Days",
        ),
      ],
    );
  }

  // =====================================================
  // ASSIGNMENT CARD
  // =====================================================

  Widget _buildAssignmentCard(
    BuildContext context,
    String title,
    String dueDate,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,

          MaterialPageRoute(builder: (_) => AssignmentPage(title: title)),
        );
      },

      child: Container(
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,

              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),

                borderRadius: BorderRadius.circular(16),
              ),

              child: const Icon(
                Icons.assignment,
                color: Colors.orange,
                size: 30,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    title,

                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(dueDate, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            const Icon(Icons.arrow_forward_ios, size: 18),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // SMALL BUTTON
  // =====================================================

  Widget _smallButton({IconData? icon, required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),

        border: Border.all(color: Colors.grey.shade300),
      ),

      child: Row(
        children: [
          if (icon != null) ...[Icon(icon, size: 18), const SizedBox(width: 5)],

          Text(text),
        ],
      ),
    );
  }

  // =====================================================
  // DARK TAG
  // =====================================================

  Widget _darkTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),

      decoration: BoxDecoration(
        color: Colors.black,

        borderRadius: BorderRadius.circular(8),
      ),

      child: Text(
        text,

        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
