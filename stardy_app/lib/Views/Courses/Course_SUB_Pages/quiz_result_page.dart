import 'package:flutter/material.dart';
import '../../widgets/color_codes.dart';
import '../../../services/auth_service.dart';
import '../../../services/firestore_service.dart';
import 'remedial_quiz_page.dart';

class QuizResultPage extends StatefulWidget {
  final int correct;
  final int total;
  final String title;

  const QuizResultPage({
    super.key,
    required this.correct,
    required this.total,
    this.title = 'this course',
  });

  @override
  State<QuizResultPage> createState() => _QuizResultPageState();
}

class _QuizResultPageState extends State<QuizResultPage> {
  @override
  void initState() {
    super.initState();
    _saveGrade();
  }

  Future<void> _saveGrade() async {
    final uid = AuthService.instance.currentUser?.uid;
    if (uid == null) return;

    final percentage = widget.total == 0
        ? 0
        : ((widget.correct / widget.total) * 100).round();
    try {
      await UserProfileService.instance.setGrade(uid, widget.title, percentage);
    } catch (_) {
      // No Firestore project configured yet — score just won't persist.
    }
  }

  @override
  Widget build(BuildContext context) {
    final correct = widget.correct;
    final total = widget.total;
    final title = widget.title;
    final percentage = total == 0 ? 0 : ((correct / total) * 100).round();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 36),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'You got $correct/$total Right',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const Text(
                'Congratulations you scored',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 12),
              Text(
                '$percentage %',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Image.asset(
                'assets/images/icon_trophy.png',
                width: 72,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.emoji_events, size: 72, color: AppColors.primary),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: null,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Share your score',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              if (correct < total) ...[
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RemedialQuizPage(title: title),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Practice Weak Areas',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).popUntil(ModalRoute.withName('/course-details'));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Back to course',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
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
