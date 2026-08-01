import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stardy_app/Pages/Learn_Page/data/quiz_data.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestion = 0;

  int? selectedAnswer;

  int score = 0;

  bool showResult = false;

  final List<int> userAnswers = [];

  void nextQuestion() {
    if (selectedAnswer == null) return;

    userAnswers.add(selectedAnswer!);

    if (selectedAnswer == pythonQuiz[currentQuestion].correctAnswer) {
      score++;
    }

    if (currentQuestion == pythonQuiz.length - 1) {
      setState(() {
        showResult = true;
      });
    } else {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (showResult) {
      return _buildResultScreen();
    }

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        iconTheme: const IconThemeData(color: Colors.black),

        title: Text(
          "Python Quiz",

          style: GoogleFonts.mukta(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: _buildQuestionScreen(),
      ),
    );
  }

  Widget _buildQuestionScreen() {
    final question = pythonQuiz[currentQuestion];

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: (currentQuestion + 1) / pythonQuiz.length,
                  minHeight: 3,
                  backgroundColor: Colors.grey.shade300,
                  color: Colors.red,
                ),
              ),
            ),

            SizedBox(width: 20),

            Text(
              "${currentQuestion + 1}/${pythonQuiz.length}",
              style: GoogleFonts.mukta(fontWeight: FontWeight.w500),
            ),
          ],
        ),

        SizedBox(height: 40),

        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            question.question,
            style: GoogleFonts.mukta(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              height: 1.3,
            ),
          ),
        ),

        SizedBox(height: 30),

        ...List.generate(
          question.options.length,
          (index) => _optionCard(index, question.options[index]),
        ),

        const Spacer(),

        _bottomButtons(),
      ],
    );
  }

  Widget _optionCard(int index, String option) {
    bool selected = selectedAnswer == index;

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        setState(() {
          selectedAnswer = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected ? Colors.black : Colors.grey.shade300,
            width: selected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 28,
              child: Text(
                String.fromCharCode(65 + index),
                style: GoogleFonts.mukta(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),

            SizedBox(width: 16),

            Expanded(
              child: Text(
                option,
                style: GoogleFonts.mukta(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1.8,
                  color: selected ? Colors.black : Colors.grey,
                ),
              ),
              child: selected
                  ? Center(
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: currentQuestion == 0
                ? null
                : () {
                    setState(() {
                      currentQuestion--;
                      selectedAnswer = null;
                    });
                  },
            icon: const Icon(Icons.arrow_back, size: 18),
            label: Text("Back"),
          ),
        ),

        SizedBox(width: 16),

        Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.bookmark_border, color: Colors.red),
        ),

        SizedBox(width: 16),

        Expanded(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            onPressed: nextQuestion,
            icon: const Icon(Icons.arrow_forward, size: 18),
            label: Text(
              currentQuestion == pythonQuiz.length - 1 ? "Finish" : "Next",
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResultScreen() {
    final total = pythonQuiz.length;
    final percent = total == 0 ? 0 : ((score / total) * 100).round();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 28),
          padding: const EdgeInsets.all(30),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Text(
                "You got $score/$total Right",
                style: GoogleFonts.mukta(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),

              Text(
                "Congratulations you scored",
                style: GoogleFonts.mukta(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "$percent %",
                style: GoogleFonts.mukta(
                  color: Colors.red,
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Image.asset('assets/images/trophy.png', width: 90, height: 90),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Share your score",
                    style: GoogleFonts.mukta(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Back to course",
                    style: GoogleFonts.mukta(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
