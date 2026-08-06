import 'package:flutter/material.dart';

class GradesPage extends StatelessWidget {
  const GradesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 10),

            const Text(
              "Assignment Results",

              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            _buildGradeCard(
              context,
              assignmentName: "Assignment 1 Result",
              percentage: 92,
              grade: "A+",
              status: "Excellent Work",
              color: Colors.green,
            ),

            const SizedBox(height: 20),

            _buildGradeCard(
              context,
              assignmentName: "Assignment 2 Result",
              percentage: 78,
              grade: "B+",
              status: "Good Performance",
              color: Colors.orange,
            ),

            const SizedBox(height: 20),

            _buildGradeCard(
              context,
              assignmentName: "Assignment 3 Result",
              percentage: 65,
              grade: "C",
              status: "Need Improvement",
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // GRADE CARD
  // =====================================================

  Widget _buildGradeCard(
    BuildContext context, {
    required String assignmentName,
    required int percentage,
    required String grade,
    required String status,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AssignmentResultPage(
              title: assignmentName,
              percentage: percentage,
            ),
          ),
        );
      },

      child: Container(
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(24),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),

              blurRadius: 10,

              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,

              children: [
                SizedBox(
                  height: 80,
                  width: 80,

                  child: CircularProgressIndicator(
                    value: percentage / 100,

                    strokeWidth: 8,

                    backgroundColor: color.withValues(alpha: 0.15),

                    valueColor: AlwaysStoppedAnimation(color),
                  ),
                ),

                Text(
                  "$percentage%",

                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    assignmentName,

                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      const Text(
                        "Grade : ",

                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),

                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.1),

                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: Text(
                          grade,

                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Text(
                    status,

                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =========================================================
// RESULT PAGE
// =========================================================

class AssignmentResultPage extends StatelessWidget {
  final String title;
  final int percentage;

  const AssignmentResultPage({
    super.key,
    required this.title,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      appBar: AppBar(title: Text(title)),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    "Score: $percentage%",

                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Marks Obtained: ${percentage ~/ 10}/10",

                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Questions Review",

              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            _questionTile(
              question: "What is Flutter?",
              userAnswer: "Programming Language",
              correctAnswer: "UI Toolkit",
              isCorrect: false,
            ),

            const SizedBox(height: 16),

            _questionTile(
              question: "Which language Flutter uses?",
              userAnswer: "Dart",
              correctAnswer: "Dart",
              isCorrect: true,
            ),

            const SizedBox(height: 16),

            _questionTile(
              question: "Widget used for scrolling list?",
              userAnswer: "ListView",
              correctAnswer: "ListView",
              isCorrect: true,
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // QUESTION TILE
  // =========================================================

  Widget _questionTile({
    required String question,
    required String userAnswer,
    required String correctAnswer,
    required bool isCorrect,
  }) {
    return ExpansionTile(
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      title: Text(
        question,

        style: const TextStyle(fontWeight: FontWeight.bold),
      ),

      trailing: Icon(
        isCorrect ? Icons.check_circle : Icons.cancel,
        color: isCorrect ? Colors.green : Colors.red,
      ),

      childrenPadding: const EdgeInsets.all(16),

      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Your Answer: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Expanded(
              child: Text(
                userAnswer,

                style: TextStyle(
                  color: isCorrect ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Correct Answer: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Expanded(
              child: Text(
                correctAnswer,

                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
