import 'dart:ui';
import 'package:flutter/material.dart';
import '../New_carousel_course/carousel_course_model.dart';

class CarouselCourseCard extends StatelessWidget {
  final CarouselCourse course;

  const CarouselCourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(course.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.6),
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔥 TOP ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    course.category,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    "⭐ ${course.rating}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // 🔥 TITLE
              Text(
                course.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              // 🔥 GLASS ICON
              _glassIcon(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _glassIcon() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.25)),
            ),
            child: const Icon(
              Icons.arrow_outward,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
