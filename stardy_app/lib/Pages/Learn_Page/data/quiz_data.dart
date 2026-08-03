import '../models/quiz_model.dart';

final List<QuizQuestion> pythonQuiz = [
  QuizQuestion(
    question: "Which keyword is used to define a function in Python?",
    options: ["function", "define", "def", "func"],
    correctAnswer: 2,
    hint: "It's a three-letter keyword.",
    explanation:
        "The 'def' keyword is used to define a function in Python. It's followed by the function name and parentheses containing any parameters.",
  ),
  QuizQuestion(
    question: "Which data type stores multiple items?",
    options: ["List", "Integer", "Float", "String"],
    correctAnswer: 0,
    hint: "Think of a collection you can add or remove items from.",
    explanation:
        "A List is an ordered, mutable collection that can store multiple items of different types in Python.",
  ),
  QuizQuestion(
    question: "Which symbol is used for comments in Python?",
    options: ["//", "#", "/*", "--"],
    correctAnswer: 1,
    hint: "It looks like a hashtag.",
    explanation:
        "The '#' symbol marks the rest of the line as a comment, which Python ignores when running the code.",
  ),
  QuizQuestion(
    question: "Which operator is used for exponentiation?",
    options: ["^", "*", "**", "//"],
    correctAnswer: 2,
    hint: "It's made up of two of the same characters.",
    explanation:
        "The '**' operator raises a number to the power of another, e.g. 2 ** 3 equals 8.",
  ),
  QuizQuestion(
    question: "Which function prints output in Python?",
    options: ["echo()", "display()", "print()", "show()"],
    correctAnswer: 2,
    hint: "It's the most commonly used function in beginner tutorials.",
    explanation:
        "The print() function outputs text or values to the console, making it essential for debugging and displaying results.",
  ),
];
