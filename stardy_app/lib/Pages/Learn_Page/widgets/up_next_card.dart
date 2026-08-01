import 'package:flutter/material.dart';
import 'package:stardy_app/Pages/Learn_Page/screens/quiz_page.dart';
import 'package:stardy_app/Pages/Learn_Page/models/course_model.dart';
import 'package:stardy_app/Pages/Learn_Page/screens/video_learning_page.dart';
import 'package:stardy_app/Pages/Learn_Page/widgets/quiz_card.dart';
import 'package:stardy_app/Pages/Learn_Page/widgets/video_card.dart';

class UpNextCard extends StatelessWidget {
  final Course course;
  final String topicTitle;
  final int quizNumber;

  const UpNextCard({
    super.key,
    required this.course,
    required this.topicTitle,
    required this.quizNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: VideoCard(
            title: topicTitle,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => VideoLearningPage(course: course),
                ),
              );
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: QuizCard(
            title: "Quiz $quizNumber",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const QuizPage()),
              );
            },
          ),
        ),
      ],
    );
  }
}
