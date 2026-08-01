import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressSection extends StatelessWidget {
  final double progress;

  const ProgressSection({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${(progress * 100).toInt()}% Module completed",
          style: GoogleFonts.mukta(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: LinearProgressIndicator(value: progress)),
            SizedBox(width: 12),
            const Icon(Icons.download_outlined),
          ],
        ),
      ],
    );
  }
}
