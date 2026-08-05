import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stardy_app/Pages/Learn_Page/models/grades_model.dart';
import 'package:stardy_app/Pages/Learn_Page/data/grades_data.dart';

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
            SizedBox(height: 10),

            Text(
              "Assignment Results",

              style: GoogleFonts.mukta(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 25),

            Column(
              children: gradeItems.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _buildGradeCard(context, item),
                );
              }).toList(),
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
    BuildContext context,
    GradeItem item,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AssignmentResultPage(
              gradeItem: item,
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
                    value: item.percentage / 100,

                    strokeWidth: 8,

                    backgroundColor: item.color.withValues(alpha: 0.15),

                    valueColor: AlwaysStoppedAnimation(item.color),
                  ),
                ),

                Text(
                  "${item.percentage}%",

                  style: GoogleFonts.mukta(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: item.color,
                  ),
                ),
              ],
            ),

            SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    item.assignmentName,

                    style: GoogleFonts.mukta(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Row(
                    children: [
                      Text(
                        "Grade : ",

                        style: GoogleFonts.mukta(fontWeight: FontWeight.w600),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),

                        decoration: BoxDecoration(
                          color: item.color.withValues(alpha: 0.1),

                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: Text(
                          item.grade,

                          style: GoogleFonts.mukta(
                            color: item.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12),

                  Text(
                    item.status,

                    style: GoogleFonts.mukta(color: Colors.grey, fontSize: 14),
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
  final GradeItem gradeItem;

  const AssignmentResultPage({
    super.key,
    required this.gradeItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      appBar: AppBar(
        title: Text(gradeItem.assignmentName),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    "Score: ${gradeItem.percentage}%",

                    style: GoogleFonts.mukta(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Marks Obtained: ${gradeItem.percentage ~/ 10}/10",

                    style: GoogleFonts.mukta(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            Text(
              "Questions Review",

              style: GoogleFonts.mukta(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            Column(
              children: gradeItem.questions.map((review) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _questionTile(
                    question: review.question,
                    userAnswer: review.userAnswer,
                    correctAnswer: review.correctAnswer,
                    isCorrect: review.isCorrect,
                  ),
                );
              }).toList(),
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

        style: GoogleFonts.mukta(fontWeight: FontWeight.bold),
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
            Text(
              "Your Answer: ",
              style: GoogleFonts.mukta(fontWeight: FontWeight.bold),
            ),

            Expanded(
              child: Text(
                userAnswer,

                style: GoogleFonts.mukta(
                  color: isCorrect ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 10),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Correct Answer: ",
              style: GoogleFonts.mukta(fontWeight: FontWeight.bold),
            ),

            Expanded(
              child: Text(
                correctAnswer,

                style: GoogleFonts.mukta(
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
