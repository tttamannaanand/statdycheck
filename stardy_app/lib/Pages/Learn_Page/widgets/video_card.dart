import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stardy_app/Pages/Learn_Page/widgets/dark_tag.dart';

class VideoCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const VideoCard({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.07),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.mukta(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 18),

                  Row(
                    children: const [
                      DarkTag(text: "Video"),

                      SizedBox(width: 10),

                      DarkTag(text: "15 min"),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              height: 55,
              width: 55,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.play_arrow, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
