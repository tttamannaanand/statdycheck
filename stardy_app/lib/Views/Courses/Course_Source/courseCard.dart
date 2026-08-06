import 'package:flutter/material.dart';
import '../../widgets/color_codes.dart';
import 'courseModel.dart';
import '../Course_details_page.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            settings: const RouteSettings(name: '/course-details'),
            builder: (_) => CourseDetailsPage(course: course),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            // ───────── IMAGE ─────────
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: course.image.contains('Group_17')
                  ? Container(
                      height: 90,
                      width: 90,
                      color: AppColors.primary.withValues(alpha: 0.1),
                      child: const Icon(
                        Icons.menu_book_outlined,
                        color: AppColors.primary,
                      ),
                    )
                  : Image.asset(
                      course.image,
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
            ),

            const SizedBox(width: 12),

            // ───────── CONTENT ─────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TITLE + RATING
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          course.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.primaryDark,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            course.rating.toString(),
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // CATEGORY
                  Text(
                    course.category,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // PROGRESS BAR
                  Builder(
                    builder: (context) {
                      final clampedProgress = course.progress.clamp(0.0, 1.0);
                      return Row(
                        children: [
                          Expanded(
                            child: LinearProgressIndicator(
                              value: clampedProgress,
                              backgroundColor: Colors.grey[800],
                              color: AppColors.primary,
                              minHeight: 5,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "${(clampedProgress * 100).toInt()}%",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            // ───────── BUTTON ─────────
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: const RouteSettings(name: '/course-details'),
                    builder: (_) => CourseDetailsPage(course: course),
                  ),
                );
              },
              child: const Text(
                "Resume",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
