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

  bool answeredWrong = false;
  bool showCorrectPanel = false;

  int score = 0;

  bool showResult = false;

  void selectOption(int index) {
    if (showCorrectPanel) return;

    final question = pythonQuiz[currentQuestion];

    setState(() {
      selectedAnswer = index;

      if (index == question.correctAnswer) {
        answeredWrong = false;
        showCorrectPanel = true;
        score++;
      } else {
        answeredWrong = true;
      }
    });
  }

  void retry() {
    setState(() {
      selectedAnswer = null;
      answeredWrong = false;
    });
  }

  void showHint() {
    final question = pythonQuiz[currentQuestion];
    final hint = question.hint;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(hint.isEmpty ? "No hint available." : hint)),
    );
  }

  void goToNextQuestion() {
    if (currentQuestion == pythonQuiz.length - 1) {
      setState(() {
        showResult = true;
      });
    } else {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
        answeredWrong = false;
        showCorrectPanel = false;
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
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),

        child: showCorrectPanel ? _buildCorrectPanel() : _buildQuestionScreen(),
      ),
    );
  }

  Widget _buildQuestionScreen() {
    final question = pythonQuiz[currentQuestion];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Center(
          child: Column(
            children: [
              Text(
                "Don't worry",
                style: GoogleFonts.mukta(fontSize: 20, color: Colors.grey.shade600),
              ),
              Text(
                "You've got this !",
                style: GoogleFonts.mukta(fontSize: 20, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),

        SizedBox(height: 30),

        _progressDashes(),

        SizedBox(height: 24),

        Text(
          "Q ${(currentQuestion + 1).toString().padLeft(2, '0')}",
          style: GoogleFonts.mukta(color: Colors.grey.shade500, fontSize: 13),
        ),

        SizedBox(height: 8),

        Text(
          question.question,
          style: GoogleFonts.mukta(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            height: 1.3,
          ),
        ),

        SizedBox(height: 30),

        ...List.generate(
          question.options.length,
          (index) => _optionCard(index, question.options[index]),
        ),

        const Spacer(),

        _hintRetryBar(),

        SizedBox(height: 20),
      ],
    );
  }

  Widget _progressDashes() {
    return Row(
      children: List.generate(pythonQuiz.length, (index) {
        bool filled = index <= currentQuestion;

        return Expanded(
          child: Container(
            margin: EdgeInsets.only(
              right: index == pythonQuiz.length - 1 ? 0 : 6,
            ),
            height: 6,
            decoration: BoxDecoration(
              color: filled ? Colors.red : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }),
    );
  }

  Widget _optionCard(int index, String option) {
    bool selected = selectedAnswer == index;
    bool isWrongSelection = selected && answeredWrong;

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () => selectOption(index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isWrongSelection ? Colors.red : Colors.grey.shade300,
            width: isWrongSelection ? 1.6 : 1,
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
                  color: isWrongSelection ? Colors.red : Colors.grey.shade500,
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
                  color: isWrongSelection ? Colors.red : Colors.black,
                ),
              ),
            ),

            if (isWrongSelection)
              const Icon(Icons.cancel, color: Colors.red, size: 22)
            else
              Container(
                height: 22,
                width: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.8, color: Colors.grey.shade400),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _hintRetryBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        TextButton.icon(
          onPressed: showHint,
          icon: const Icon(Icons.lightbulb_outline, color: Colors.black, size: 18),
          label: Text(
            "Hint",
            style: GoogleFonts.mukta(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),

        if (answeredWrong)
          SizedBox(
            width: 120,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: retry,
              child: Text(
                "Retry",
                style: GoogleFonts.mukta(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCorrectPanel() {
    final question = pythonQuiz[currentQuestion];
    final correctLetter = String.fromCharCode(65 + question.correctAnswer);
    final correctText = question.options[question.correctAnswer];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        SizedBox(height: 40),

        Text(
          "Correct Answer",
          style: GoogleFonts.mukta(color: Colors.grey.shade500, fontSize: 14),
        ),

        SizedBox(height: 8),

        Text(
          "Option $correctLetter : $correctText",
          style: GoogleFonts.mukta(
            color: Colors.green.shade600,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 20),

        Text(
          question.explanation,
          style: GoogleFonts.mukta(color: Colors.black87, fontSize: 15, height: 1.6),
        ),

        const Spacer(),

        SizedBox(
          width: double.infinity,
          height: 54,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: goToNextQuestion,
            child: Text(
              "Next",
              style: GoogleFonts.mukta(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),

        SizedBox(height: 20),
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
