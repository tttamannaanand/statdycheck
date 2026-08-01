import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CertificateCard extends StatelessWidget {
  final bool certificateDownloaded;
  final VoidCallback onDownload;

  const CertificateCard({
    super.key,
    required this.certificateDownloaded,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _CertificateHeader(),

          SizedBox(height: 25),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: onDownload,
              icon: const Icon(Icons.download, color: Colors.black),
              label: Text(
                certificateDownloaded
                    ? "Certificate Downloaded"
                    : "Download Certificate",
                style: GoogleFonts.mukta(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CertificateHeader extends StatelessWidget {
  const _CertificateHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.workspace_premium,
            color: Colors.amber,
            size: 34,
          ),
        ),

        SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Course Completed 🎉",
                style: GoogleFonts.mukta(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 6),

              Text(
                "Download your certificate",
                style: GoogleFonts.mukta(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
