import '../models/resources_model.dart';

final List<NoteItem> notesList = [
  NoteItem(
    title: "Flutter Basics",
    module: "Module 1",
    size: "2.4 MB",
    topic: "Introduction to Widgets",
    content: "Flutter widgets are the basic building blocks of a Flutter application.\n\nWidgets describe how the application UI should look and behave.\n\nFlutter provides two types of widgets:\n\n1. StatelessWidget\n2. StatefulWidget\n\nNavigation in Flutter helps move between screens using Navigator and Routes.\n\nState management is used to manage application data efficiently.",
  ),
  NoteItem(
    title: "State Management",
    module: "Module 2",
    size: "3.1 MB",
    topic: "Provider & Riverpod",
    content: "State management is crucial in Flutter to propagate changes across components.\n\nPopular patterns include:\n- Provider\n- Riverpod\n- Bloc\n\nChoose state management based on project size and complexity.",
  ),
  NoteItem(
    title: "Navigation System",
    module: "Module 3",
    size: "1.8 MB",
    topic: "Routes & Navigation",
    content: "Navigator 1.0 vs Navigator 2.0 (Router API).\n\nGoRouter is a popular choice for routing in larger apps, providing declarative routing, deep linking, and parsing query parameters.",
  ),
];

final List<ReferenceItem> referencesList = [
  ReferenceItem(
    title: "Flutter Complete Guide",
    author: "Google Developers",
    url: "https://docs.flutter.dev/",
  ),
  ReferenceItem(
    title: "Dart Programming Ebook",
    author: "Dart Team",
    url: "https://dart.dev/guides",
  ),
  ReferenceItem(
    title: "Firebase Documentation",
    author: "Firebase",
    url: "https://firebase.google.com/docs",
  ),
];
