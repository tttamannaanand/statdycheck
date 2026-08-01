import 'package:flutter/material.dart';

class QuestionReview {
  final String question;
  final String userAnswer;
  final String correctAnswer;
  final bool isCorrect;

  const QuestionReview({
    required this.question,
    required this.userAnswer,
    required this.correctAnswer,
    required this.isCorrect,
  });
}

class GradeItem {
  final String assignmentName;
  final int percentage;
  final String grade;
  final String status;
  final Color color;
  final List<QuestionReview> questions;

  const GradeItem({
    required this.assignmentName,
    required this.percentage,
    required this.grade,
    required this.status,
    required this.color,
    required this.questions,
  });
}
