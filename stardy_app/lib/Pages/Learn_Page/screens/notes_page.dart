import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Notes Page", style: GoogleFonts.mukta(fontSize: 24)),
    );
  }
}
