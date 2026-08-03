class Course {
  final String title;
  final String subtitle;
  final String image;
  final double rating;
  double progress; // make mutable
  final String category;
  final String uploadDate;
  final String duration;
  final String description;
  final String downloadSize;
  final int assignmentsDue;
  final List<Chapter> chapters;

  Course({
    required this.title,
    this.subtitle = "",
    required this.image,
    required this.rating,
    required this.progress,
    required this.category,
    required this.uploadDate,
    required this.duration,
    required this.description,
    this.downloadSize = "235 MB",
    this.assignmentsDue = 0,
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
