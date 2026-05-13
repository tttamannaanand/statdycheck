class Course {
  final String title;
  final String image;
  final double rating;
  double progress; // make mutable
  final String category;
  final String uploadDate;
  final String duration;
  final String description;
  final List<Chapter> chapters;

  Course({
    required this.title,
    required this.image,
    required this.rating,
    required this.progress,
    required this.category,
    required this.uploadDate,
    required this.duration,
    required this.description,
    required this.chapters,
  });
}

class Chapter {
  final String title;
  final List<Topic> topics;

  Chapter({required this.title, required this.topics});
}

class Topic {
  final String title;
  final String videoUrl;

  Topic({required this.title, required this.videoUrl});
}
