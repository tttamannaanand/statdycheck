import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stardy_app/Pages/Learn_Page/screens/video_learning_page.dart';
import 'package:stardy_app/Pages/Learn_Page/models/course_model.dart';
import 'package:stardy_app/Pages/Learn_Page/widgets/small_button.dart';

class CurrentVideoCard extends StatelessWidget {
  final Course course;
  final bool certificateDownloaded;

  const CurrentVideoCard({
    super.key,
    required this.course,
    required this.certificateDownloaded,
  });

  @override
  Widget build(BuildContext context) {
    final bool completed = course.progress >= 1.0;
    final bool disableVideo = completed && !certificateDownloaded;

    return Opacity(
      opacity: disableVideo ? 0.5 : 1,
      child: IgnorePointer(
        ignoring: disableVideo,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => VideoLearningPage(course: course),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: disableVideo ? Colors.grey : Colors.black,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (completed)
                  _CourseStatusBadge(
                    certificateDownloaded: certificateDownloaded,
                  ),

                Text(
                  course.chapters.first.topics.first.title,
                  style: GoogleFonts.mukta(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "This lecture talks about communication design and related concepts.",
                  style: GoogleFonts.mukta(color: Colors.grey, height: 1.5),
                ),

                SizedBox(height: 25),

                Row(
                  children: [
                    const SmallButton(
                      icon: Icons.play_arrow_outlined,
                      text: "Video",
                    ),

                    SizedBox(width: 10),

                    const SmallButton(text: "5 min"),

                    const Spacer(),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 35,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: disableVideo ? Colors.grey : Colors.black,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        disableVideo ? "Locked" : "Play",
                        style: GoogleFonts.mukta(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CourseStatusBadge extends StatelessWidget {
  final bool certificateDownloaded;

  const _CourseStatusBadge({required this.certificateDownloaded});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 18),
          SizedBox(width: 8),
          Text(
            certificateDownloaded ? "Unlocked Again" : "Course Completed",
            style: GoogleFonts.mukta(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
