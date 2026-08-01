import 'package:flutter/material.dart';
import '../models/grades_model.dart';

final List<GradeItem> gradeItems = [
  GradeItem(
    assignmentName: "Assignment 1 Result",
    percentage: 92,
    grade: "A+",
    status: "Excellent Work",
    color: Colors.green,
    questions: [
      QuestionReview(
        question: "What is Flutter?",
        userAnswer: "Programming Language",
        correctAnswer: "UI Toolkit",
        isCorrect: false,
      ),
      QuestionReview(
        question: "Which language Flutter uses?",
        userAnswer: "Dart",
        correctAnswer: "Dart",
        isCorrect: true,
      ),
      QuestionReview(
        question: "Widget used for scrolling list?",
        userAnswer: "ListView",
        correctAnswer: "ListView",
        isCorrect: true,
      ),
    ],
  ),
  GradeItem(
    assignmentName: "Assignment 2 Result",
    percentage: 78,
    grade: "B+",
    status: "Good Performance",
    color: Colors.orange,
    questions: [
      QuestionReview(
        question: "State Management in Flutter?",
        userAnswer: "Provider",
        correctAnswer: "Provider",
        isCorrect: true,
      ),
      QuestionReview(
        question: "Is Flutter single-threaded?",
        userAnswer: "Yes",
        correctAnswer: "Yes",
        isCorrect: true,
      ),
    ],
  ),
  GradeItem(
    assignmentName: "Assignment 3 Result",
    percentage: 65,
    grade: "C",
    status: "Need Improvement",
    color: Colors.red,
    questions: [
      QuestionReview(
        question: "What is an Isolate?",
        userAnswer: "Thread",
        correctAnswer: "An independent worker thread",
        isCorrect: false,
      ),
    ],
  ),
];
