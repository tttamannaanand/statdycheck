import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stardy_app/Pages/Learn_Page/models/course_model.dart';
import 'package:stardy_app/Pages/Learn_Page/widgets/certificate_card.dart';

class DescriptionSection extends StatelessWidget {
  final Course course;
  final bool certificateDownloaded;
  final VoidCallback onDownload;

  const DescriptionSection({
    super.key,
    required this.course,
    required this.certificateDownloaded,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    final completed = course.progress >= 1.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: GoogleFonts.mukta(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 10),

        Text(
          course.description,
          style: GoogleFonts.mukta(color: Colors.grey, height: 1.5),
        ),

        if (completed) ...[
          SizedBox(height: 30),
          CertificateCard(
            certificateDownloaded: certificateDownloaded,
            onDownload: onDownload,
          ),
        ],
      ],
    );
  }
}
