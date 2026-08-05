import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:stardy_app/Pages/Learn_Page/models/resources_model.dart';
import 'package:stardy_app/Pages/Learn_Page/data/resources_data.dart';

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
            SizedBox(height: 20),

            Text(
              "Notes",

              style: GoogleFonts.mukta(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            const NotesTab(),

            SizedBox(height: 40),

            Text(
              "References",

              style: GoogleFonts.mukta(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            const ReferenceTab(),

            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class NotesTab extends StatelessWidget {
  const NotesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: notesList.map((note) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: _noteCard(context, note),
        );
      }).toList(),
    );
  }

  Widget _noteCard(
    BuildContext context,
    NoteItem note,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => NotesDetailsPage(noteItem: note),
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
                color: Colors.blue.withValues(alpha: 0.1),

                borderRadius: BorderRadius.circular(18),
              ),

              child: const Icon(
                Icons.note_alt_outlined,
                color: Colors.blue,
                size: 32,
              ),
            ),

            SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    note.title,

                    style: GoogleFonts.mukta(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(note.module, style: GoogleFonts.mukta(color: Colors.grey)),

                  SizedBox(height: 6),

                  Row(
                    children: [
                      const Icon(Icons.storage, size: 16, color: Colors.grey),

                      SizedBox(width: 5),

                      Text(note.size, style: GoogleFonts.mukta(color: Colors.grey)),
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

class NotesDetailsPage extends StatelessWidget {
  final NoteItem noteItem;

  const NotesDetailsPage({super.key, required this.noteItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      appBar: AppBar(
        title: Text(noteItem.title),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.circular(24),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                noteItem.topic,

                style: GoogleFonts.mukta(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              Text(
                noteItem.content,

                style: GoogleFonts.mukta(fontSize: 16, color: Colors.grey, height: 1.7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReferenceTab extends StatelessWidget {
  const ReferenceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: referencesList.map((ref) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: _ebookCard(ref),
        );
      }).toList(),
    );
  }

  Widget _ebookCard(ReferenceItem ref) {
    return GestureDetector(
      onTap: () async {
        final Uri uri = Uri.parse(ref.url);

        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
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
                color: Colors.orange.withValues(alpha: 0.1),

                borderRadius: BorderRadius.circular(18),
              ),

              child: const Icon(
                Icons.menu_book_rounded,
                color: Colors.orange,
                size: 32,
              ),
            ),

            SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    ref.title,

                    style: GoogleFonts.mukta(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(ref.author, style: GoogleFonts.mukta(color: Colors.grey)),
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
