import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:stardy_app/Pages/Learn_Page/models/course_model.dart';
import 'package:stardy_app/Pages/Learn_Page/screens/course_details_page.dart';

class CarouselCourseCard extends StatelessWidget {
  final Course course;

  const CarouselCourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => CourseDetailsPage(course: course)),
        );
      },

      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 4),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(26),

          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(course.image),
                fit: BoxFit.cover,
              ),
            ),

            child: Container(
              padding: const EdgeInsets.all(14),

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,

                  colors: [
                    Colors.black.withValues(alpha: 0.65),
                    Colors.black.withValues(alpha: 0.15),
                    Colors.black.withValues(alpha: 0.82),
                  ],
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,

                          child: _topChip(
                            text: course.category,
                            color: Colors.white.withValues(alpha: 0.15),
                          ),
                        ),
                      ),

                      SizedBox(width: 10),

                      Align(
                        alignment: Alignment.centerRight,

                        child: _topChip(
                          text: "⭐ ${course.rating}",
                          color: Colors.orange.withValues(alpha: 0.18),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12),

                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,

                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 220),

                      child: Text(
                        course.title,

                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,

                        style: GoogleFonts.mukta(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  Flexible(
                    child: Text(
                      course.description,

                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                      style: GoogleFonts.mukta(
                        color: Colors.white70,
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                  ),

                  const Spacer(),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,

                    child: Row(
                      children: [
                        _infoChip(icon: Icons.schedule, text: course.duration),

                        SizedBox(width: 8),

                        _infoChip(
                          icon: Icons.calendar_month,
                          text: course.uploadDate,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              height: 10,
                              width: 10,

                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                            ),

                            SizedBox(width: 8),

                            Expanded(
                              child: Text(
                                "Available Now",

                                overflow: TextOverflow.ellipsis,

                                style: GoogleFonts.mukta(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 10),

                      _glassButton(context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _topChip({required String text, required Color color}) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),

        decoration: BoxDecoration(
          color: color,

          borderRadius: BorderRadius.circular(30),

          border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
        ),

        child: Text(
          text,

          maxLines: 1,
          overflow: TextOverflow.ellipsis,

          style: GoogleFonts.mukta(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _infoChip({required IconData icon, required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),

      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),

        borderRadius: BorderRadius.circular(14),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(icon, color: Colors.white, size: 14),

          SizedBox(width: 5),

          Text(
            text,

            overflow: TextOverflow.ellipsis,

            style: GoogleFonts.mukta(color: Colors.white, fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _glassButton(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),

      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),

        child: Container(
          padding: const EdgeInsets.all(10),

          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.12),

            shape: BoxShape.circle,

            border: Border.all(color: Colors.white.withValues(alpha: 0.22)),
          ),

          child: const Icon(Icons.arrow_outward, color: Colors.white, size: 18),
        ),
      ),
    );
  }
}
