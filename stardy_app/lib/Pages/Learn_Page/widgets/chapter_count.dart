import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChapterCount extends StatelessWidget {
  final int count;

  const ChapterCount({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Total Chapters: $count",
      style: GoogleFonts.mukta(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
