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
}
