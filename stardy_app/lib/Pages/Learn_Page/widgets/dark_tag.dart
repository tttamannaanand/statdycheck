import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkTag extends StatelessWidget {
  final String text;

  const DarkTag({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: GoogleFonts.mukta(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
