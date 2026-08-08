import 'package:flutter/material.dart';
import '../../widgets/color_codes.dart';
import '../../CareerPath/level_up_page.dart';

class _RemedialQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  final String hint;

  const _RemedialQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    required this.hint,
  });
}

const List<_RemedialQuestion> _remedialQuestions = [
  _RemedialQuestion(
    question: 'What is closest word to describe UX Design ?',
    options: ['User psychology', 'Aesthetics', 'UI Design', 'Empathise'],
    correctIndex: 3,
    explanation:
        'UX (User Experience) Design is the process of creating products and '
        'digital experiences that are useful, intuitive, and enjoyable for '
        'users. It focuses on understanding user needs, behaviors, and pain '
        'points to build solutions that feel seamless and efficient.\n\n'
        'UX designers conduct research, create user flows, wireframes, and '
        'prototypes, and continuously test designs to improve usability. The '
        'goal is to ensure that every interaction is meaningful and easy to '
        'navigate.',
    hint: 'Think about who the design is really built around.',
  ),
  _RemedialQuestion(
    question: 'Which of these best describes a wireframe ?',
    options: [
      'A finished visual design',
      'A low-fidelity layout blueprint',
      'A marketing document',
      'A type of animation',
    ],
    correctIndex: 1,
    explanation:
        'A wireframe is a low-fidelity blueprint of a screen that focuses on '
        'layout and structure rather than visual polish. It helps teams '
        'agree on content placement and flow before investing time in '
        'detailed visuals.',
    hint: 'Think "skeleton", not "finished artwork".',
  ),
  _RemedialQuestion(
    question: 'What does a "user persona" represent ?',
    options: [
      'A real customer\'s exact data',
      'A fictional character representing a user segment',
      'A legal agreement',
      'A type of chart',
    ],
    correctIndex: 1,
    explanation:
        'A user persona is a fictional, generalized character built from '
        'research that represents a segment of your real users. It keeps '
        'design decisions grounded in the goals and pain points of the '
        'people who will actually use the product.',
    hint: 'Personas are made up, but based on real research.',
  ),
];

class RemedialQuizPage extends StatefulWidget {
  final String title;

  const RemedialQuizPage({super.key, required this.title});

  @override
  State<RemedialQuizPage> createState() => _RemedialQuizPageState();
}

class _RemedialQuizPageState extends State<RemedialQuizPage> {
  int _currentIndex = 0;
  int? _selectedIndex;
  bool _showWrong = false;
  bool _revealing = false;

  _RemedialQuestion get _current => _remedialQuestions[_currentIndex];
  bool get _isLastQuestion => _currentIndex == _remedialQuestions.length - 1;

  void _selectOption(int index) {
    setState(() {
      _selectedIndex = index;
      _showWrong = false;
    });
  }

  void _showHint() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(_current.hint)),
    );
  }

  void _onPrimaryButtonTap() {
    if (_showWrong) {
      setState(() {
        _showWrong = false;
        _selectedIndex = null;
      });
      return;
    }

    if (_selectedIndex == null) return;

    if (_selectedIndex == _current.correctIndex) {
      setState(() => _revealing = true);
    } else {
      setState(() => _showWrong = true);
    }
  }

  void _goToNextQuestion() {
    if (_isLastQuestion) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => LevelUpPage(
            onContinue: () {
              Navigator.of(
                context,
              ).popUntil(ModalRoute.withName('/course-details'));
            },
          ),
        ),
      );
      return;
    }

    setState(() {
      _currentIndex++;
      _selectedIndex = null;
      _showWrong = false;
      _revealing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, 0.7),
            radius: 1.3,
            colors: [Color(0xFFF7D9D9), Colors.white],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Icon(Icons.chevron_left, color: Colors.black),
                    ),
                  ),
                ),
              ),
              if (!_revealing) ...[
                const SizedBox(height: 12),
                const Text(
                  "Don't worry\nYou've Got this !",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
              ],
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: SizedBox(
                      width: 320,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        clipBehavior: Clip.none,
                        children: [
                          _ghostCard(rotation: -0.045, dx: 16, dy: 18),
                          _ghostCard(rotation: 0.04, dx: -14, dy: 26),
                          _ghostCard(rotation: -0.02, dx: 6, dy: 34),
                          _revealing ? _buildRevealCard() : _buildQuestionCard(),
                        ],
                      ),
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

  Widget _ghostCard({required double rotation, required double dx, required double dy}) {
    return Transform.translate(
      offset: Offset(dx, dy),
      child: Transform.rotate(
        angle: rotation,
        child: Container(
          width: 300,
          height: 420,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionCard() {
    final total = _remedialQuestions.length;

    return Container(
      width: 300,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: List.generate(total, (i) {
              final filled = i <= _currentIndex;
              return Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: i == total - 1 ? 0 : 6),
                  height: 4,
                  decoration: BoxDecoration(
                    color: filled ? AppColors.primary : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 16),
          Text(
            'Q ${(_currentIndex + 1).toString().padLeft(2, '0')}',
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 8),
          Text(
            _current.question,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(_current.options.length, (index) {
            final isSelected = _selectedIndex == index;
            final isWrong = isSelected && _showWrong;

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () => _selectOption(index),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isWrong ? AppColors.primary : Colors.grey.shade300,
                      width: isWrong ? 1.5 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        String.fromCharCode(65 + index),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _current.options[index],
                          style: const TextStyle(fontSize: 13, color: Colors.black87),
                        ),
                      ),
                      if (isWrong)
                        const Icon(Icons.cancel, color: AppColors.primary, size: 20)
                      else
                        Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? Colors.black : Colors.grey.shade400,
                              width: 1.5,
                            ),
                            color: isSelected ? Colors.black : Colors.transparent,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: _showHint,
                child: const Row(
                  children: [
                    Icon(Icons.lightbulb_outline, size: 16, color: Colors.black54),
                    SizedBox(width: 6),
                    Text('Hint', style: TextStyle(color: Colors.black54, fontSize: 13)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: _onPrimaryButtonTap,
                child: Opacity(
                  opacity: (_selectedIndex == null && !_showWrong) ? 0.4 : 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _showWrong ? 'Retry' : 'Next',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
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

  Widget _buildRevealCard() {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Correct Answer',
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 6),
          Text(
            'Option ${String.fromCharCode(65 + _current.correctIndex)} : '
            '${_current.options[_current.correctIndex]}',
            style: const TextStyle(
              color: Colors.green,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            _current.explanation,
            style: const TextStyle(fontSize: 13, color: Colors.black87, height: 1.5),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _goToNextQuestion,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                _isLastQuestion ? 'Finish' : 'Next',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
