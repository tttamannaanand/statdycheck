import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/color_codes.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 20),

            // =====================================================
            // REFERENCES TITLE
            // =====================================================
            const Text(
              "References",

              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            const ReferenceTab(),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

// =========================================================
// NOTES TAB
// =========================================================

class NotesTab extends StatelessWidget {
  const NotesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _noteCard(
          context,
          title: "Flutter Basics",
          module: "Module 1",
          size: "2.4 MB",
          topic: "Introduction to Widgets",
        ),

        const SizedBox(height: 18),

        _noteCard(
          context,
          title: "State Management",
          module: "Module 2",
          size: "3.1 MB",
          topic: "Provider & Riverpod",
        ),

        const SizedBox(height: 18),

        _noteCard(
          context,
          title: "Navigation System",
          module: "Module 3",
          size: "1.8 MB",
          topic: "Routes & Navigation",
        ),
      ],
    );
  }

  // =========================================================
  // NOTE CARD
  // =========================================================

  Widget _noteCard(
    BuildContext context, {
    required String title,
    required String module,
    required String size,
    required String topic,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,

          MaterialPageRoute(
            builder: (_) => NotesDetailsPage(title: title, topic: topic),
          ),
        );
      },

      child: Container(
        padding: const EdgeInsets.all(18),

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
            Container(
              height: 65,
              width: 65,

              decoration: BoxDecoration(
                color: AppColors.primaryDark.withValues(alpha: 0.1),

                borderRadius: BorderRadius.circular(18),
              ),

              child: const Icon(
                Icons.note_alt_outlined,
                color: AppColors.primaryDark,
                size: 32,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    title,

                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(module, style: const TextStyle(color: Colors.grey)),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      const Icon(Icons.storage, size: 16, color: Colors.grey),

                      const SizedBox(width: 5),

                      Text(size, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),

            const Icon(Icons.arrow_forward_ios, size: 18),
          ],
        ),
      ),
    );
  }
}

// =========================================================
// NOTES DETAILS PAGE
// =========================================================

class NotesDetailsPage extends StatelessWidget {
  final String title;
  final String topic;

  const NotesDetailsPage({super.key, required this.title, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      appBar: AppBar(title: Text(title)),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Container(
          padding: const EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.circular(24),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                topic,

                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Flutter widgets are the basic building blocks of a Flutter application.\n\nWidgets describe how the application UI should look and behave.\n\nFlutter provides two types of widgets:\n\n1. StatelessWidget\n2. StatefulWidget\n\nNavigation in Flutter helps move between screens using Navigator and Routes.\n\nState management is used to manage application data efficiently.",

                style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =========================================================
// REFERENCES SECTION
// =========================================================

class ReferenceTab extends StatelessWidget {
  const ReferenceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ebookCard(
          context: context,
          title: "Flutter Complete Guide",
          author: "Google Developers",
          url: "https://docs.flutter.dev/",
        ),

        const SizedBox(height: 18),

        _ebookCard(
          context: context,
          title: "Dart Programming Ebook",
          author: "Dart Team",
          url: "https://dart.dev/guides",
        ),

        const SizedBox(height: 18),

        _ebookCard(
          context: context,
          title: "Firebase Documentation",
          author: "Firebase",
          url: "https://firebase.google.com/docs",
        ),
      ],
    );
  }

  // =========================================================
  // EBOOK CARD
  // =========================================================

  Widget _ebookCard({
    required BuildContext context,
    required String title,
    required String author,
    required String url,
  }) {
    return GestureDetector(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        final messenger = ScaffoldMessenger.of(context);

        bool launched = false;
        if (await canLaunchUrl(uri)) {
          launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
        }

        if (!launched) {
          messenger.showSnackBar(
            SnackBar(content: Text('Couldn\'t open $title')),
          );
        }
      },

      child: Container(
        padding: const EdgeInsets.all(18),

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
            Container(
              height: 65,
              width: 65,

              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),

                borderRadius: BorderRadius.circular(18),
              ),

              child: const Icon(
                Icons.menu_book_rounded,
                color: AppColors.primary,
                size: 32,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    title,

                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(author, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            const Icon(Icons.open_in_new, size: 20),
          ],
        ),
      ),
    );
  }
}
