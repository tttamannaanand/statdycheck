import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stardy_app/Core/color_codes.dart';

class ProgressSection extends StatelessWidget {
  final double progress;
  final String downloadSize;
  final int assignmentsDue;

  const ProgressSection({
    super.key,
    required this.progress,
    this.downloadSize = "235 MB",
    this.assignmentsDue = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${(progress * 100).toInt()}% Module Completed",
          style: GoogleFonts.mukta(fontWeight: FontWeight.bold, fontSize: 16),
        ),

        SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                  backgroundColor: Colors.grey.shade200,
                  color: AppColors.primary,
                ),
              ),
            ),

            SizedBox(width: 16),

            Column(
              children: [
                const Icon(Icons.file_download_outlined, size: 20),
                SizedBox(height: 2),
                Text(
                  "Download",
                  style: GoogleFonts.mukta(fontSize: 11, fontWeight: FontWeight.w600),
                ),
                Text(
                  downloadSize,
                  style: GoogleFonts.mukta(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: 10),

        Text(
          "$assignmentsDue Assignments Due",
          style: GoogleFonts.mukta(color: Colors.grey.shade600, fontSize: 13),
        ),
      ],
    );
  }
}
