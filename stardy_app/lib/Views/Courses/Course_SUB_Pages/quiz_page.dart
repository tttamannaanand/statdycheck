import 'package:flutter/material.dart';
import '../../widgets/color_codes.dart';
import 'quiz_result_page.dart';

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}

final List<QuizQuestion> _sampleQuestions = [
  QuizQuestion(
    question: 'Which of the following wrote the book "Design of Everyday '
        'Things" ?',
    options: ['Don Norman', 'Karl Lagerfield', 'Girgio Armani', 'Tom Ford'],
    correctIndex: 0,
  ),
  QuizQuestion(
    question: 'Which principle focuses on how easily a user can predict\n'
        'what a control will do before using it ?',
    options: ['Affordance', 'Feedback', 'Consistency', 'Visibility'],
    correctIndex: 0,
  ),
  QuizQuestion(
    question: 'What does "UX" stand for ?',
    options: [
      'User Experience',
      'User Exchange',
      'Universal Experience',
      'User Extension',
    ],
    correctIndex: 0,
  ),
];

class QuizPage extends StatefulWidget {
  final String title;

  const QuizPage({super.key, required this.title});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;
  final Map<int, int> _selectedAnswers = {};
  final Set<int> _flagged = {};

  QuizQuestion get _currentQuestion => _sampleQuestions[_currentIndex];

  void _next() {
    if (_currentIndex < _sampleQuestions.length - 1) {
      setState(() => _currentIndex++);
    }
  }

  void _back() {
    if (_currentIndex > 0) {
      setState(() => _currentIndex--);
    }
  }

  void _toggleFlag() {
    setState(() {
      if (_flagged.contains(_currentIndex)) {
        _flagged.remove(_currentIndex);
      } else {
        _flagged.add(_currentIndex);
      }
    });
  }

  void _submitQuiz() {
    int correct = 0;
    for (var i = 0; i < _sampleQuestions.length; i++) {
      if (_selectedAnswers[i] == _sampleQuestions[i].correctIndex) {
        correct++;
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuizResultPage(
          correct: correct,
          total: _sampleQuestions.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isFlagged = _flagged.contains(_currentIndex);
    final selected = _selectedAnswers[_currentIndex];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // PROGRESS BAR
            ClipRRect(
              child: LinearProgressIndicator(
                value: (_currentIndex + 1) / _sampleQuestions.length,
                minHeight: 4,
                backgroundColor: Colors.black12,
                color: AppColors.primary,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  // TOP ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.notifications_none,
                        color: AppColors.primaryDark,
                      ),
                      Text(
                        '${_currentIndex + 1} / ${_sampleQuestions.length}',
                        style: const TextStyle(
                          color: AppColors.primaryDark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(
                        Icons.lightbulb_outline,
                        color: AppColors.primaryDark,
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // QUESTION
                  Text(
                    _currentQuestion.question,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryDark,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // OPTIONS
                  ...List.generate(_currentQuestion.options.length, (index) {
                    final isSelected = selected == index;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        onTap: () {
                          setState(() => _selectedAnswers[_currentIndex] = index);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.08),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Text(
                                String.fromCharCode(65 + index),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.primaryDark,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  _currentQuestion.options[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: AppColors.primaryDark,
                                  ),
                                ),
                              ),
                              Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.primaryDark
                                        : Colors.grey.shade400,
                                    width: 1.5,
                                  ),
                                  color: isSelected
                                      ? AppColors.primaryDark
                                      : Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),

      // BOTTOM NAV
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _navButton(
                icon: Icons.arrow_back,
                label: 'Back',
                iconFirst: true,
                onTap: _currentIndex == 0 ? null : _back,
              ),

              GestureDetector(
                onTap: _toggleFlag,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary, width: 1.5),
                    color: isFlagged
                        ? AppColors.primary.withValues(alpha: 0.1)
                        : Colors.transparent,
                  ),
                  child: Icon(Icons.flag_outlined, color: AppColors.primary),
                ),
              ),

              _navButton(
                icon: Icons.arrow_forward,
                label: _currentIndex == _sampleQuestions.length - 1
                    ? 'Submit'
                    : 'Next',
                iconFirst: false,
                onTap: _currentIndex == _sampleQuestions.length - 1
                    ? _submitQuiz
                    : _next,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navButton({
    required IconData icon,
    required String label,
    required bool iconFirst,
    required VoidCallback? onTap,
  }) {
    final iconWidget = Icon(icon, color: Colors.white, size: 18);
    final labelWidget = Text(
      label,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
    );

    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: onTap == null ? 0.4 : 1,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: iconFirst
                ? [iconWidget, const SizedBox(width: 8), labelWidget]
                : [labelWidget, const SizedBox(width: 8), iconWidget],
          ),
        ),
      ),
    );
  }
}
