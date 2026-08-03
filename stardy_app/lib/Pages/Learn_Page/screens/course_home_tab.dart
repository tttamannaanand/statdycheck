import 'package:flutter/material.dart';
import 'package:stardy_app/Pages/Learn_Page/widgets/assignment_card.dart';
import 'package:stardy_app/Pages/Learn_Page/widgets/chapter_count.dart';
import 'package:stardy_app/Pages/Learn_Page/widgets/current_video_card.dart';
import 'package:stardy_app/Pages/Learn_Page/widgets/description_section.dart';
import 'package:stardy_app/Pages/Learn_Page/widgets/progress_section.dart';
import 'package:stardy_app/Pages/Learn_Page/widgets/up_next_card.dart';
import 'package:stardy_app/Pages/Learn_Page/screens/assignment_page.dart';
import 'package:stardy_app/Pages/Learn_Page/screens/project_details_page.dart';
import 'package:stardy_app/Pages/Learn_Page/models/course_model.dart';
import 'package:stardy_app/Pages/Learn_Page/widgets/project_card.dart';

class HomePage extends StatefulWidget {
  final Course course;

  const HomePage({super.key, required this.course});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool certificateDownloaded = false;

  void _downloadCertificate() {
    setState(() {
      certificateDownloaded = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Certificate Downloaded Successfully")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          /// Progress Section
          ProgressSection(
            progress: widget.course.progress,
            downloadSize: widget.course.downloadSize,
            assignmentsDue: widget.course.assignmentsDue,
          ),

          SizedBox(height: 25),

          /// Description + Certificate
          DescriptionSection(
            course: widget.course,

            certificateDownloaded: certificateDownloaded,

            onDownload: _downloadCertificate,
          ),

          SizedBox(height: 30),

          /// Current Video Card
          CurrentVideoCard(
            course: widget.course,

            certificateDownloaded: certificateDownloaded,
          ),

          SizedBox(height: 30),

          /// Chapter Count
          ChapterCount(count: widget.course.chapters.length),

          SizedBox(height: 30),

          /// Up Next Section
          Column(
            children: widget.course.chapters.expand((chapter) {
              return chapter.topics.asMap().entries.map((entry) {
                return UpNextCard(
                  course: widget.course,
                  topicTitle: entry.value.title,
                  quizNumber: entry.key + 1,
                );
              });
            }).toList(),
          ),

          SizedBox(height: 30),

          /// Assignments + Project
          AssignmentCard(
            title: "Flutter Assignment",
            dueDate: "Due Tomorrow",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const AssignmentPage(title: "Flutter Assignment"),
                ),
              );
            },
          ),

          SizedBox(height: 16),

          ProjectCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProjectDetailsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
