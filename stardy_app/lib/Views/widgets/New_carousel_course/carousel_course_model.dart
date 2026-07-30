import '../../Cources/Course_Source/courseModel.dart';

class CarouselCourse {
  final String id;
  final String title;
  final String category;
  final String image;
  final double rating;

  CarouselCourse({
    required this.id,
    required this.title,
    required this.category,
    required this.image,
    required this.rating,
  });

  // 🔥 FROM JSON (important for backend)
  factory CarouselCourse.fromJson(Map<String, dynamic> json) {
    return CarouselCourse(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      image: json['image'],
      rating: (json['rating'] as num).toDouble(),
    );
  }

  // 🔥 TO JSON (optional)
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "category": category,
      "image": image,
      "rating": rating,
    };
  }

  Course toCourse() {
    return Course(
      title: title,
      image: image,
      rating: rating,
      progress: 0.05,
      category: category,
      uploadDate: "Jan 1, 2026",
      duration: "4h 00m",
      description: "Learn the fundamentals of $title with this guided course.",
      chapters: [
        Chapter(
          title: "Introduction",
          topics: [
            Topic(
              title: "Getting Started with $title",
              videoUrl: "https://youtu.be/dQw4w9WgXcQ",
            ),
          ],
        ),
      ],
    );
  }
}
