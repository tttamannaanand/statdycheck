enum CourseLevel { beginner, intermediate, advance }

extension CourseLevelLabel on CourseLevel {
  String get label {
    switch (this) {
      case CourseLevel.beginner:
        return 'Beginner';
      case CourseLevel.intermediate:
        return 'Intermediate';
      case CourseLevel.advance:
        return 'Advance';
    }
  }
}

class LessonModel {
  const LessonModel({
    required this.title,
    required this.thumbnailUrl,
    required this.level,
    required this.completed,
  });

  final String title;
  final String thumbnailUrl;
  final CourseLevel level;
  final bool completed;
}

class SubjectModel {
  const SubjectModel({
    required this.title,
    required this.description,
    required this.skillsToKnow,
    required this.durationHours,
    required this.instructorAvatarUrl,
    required this.lessons,
    required this.upcoming,
  });

  final String title;
  final String description;
  final List<String> skillsToKnow;
  final int durationHours;
  final String instructorAvatarUrl;
  final List<LessonModel> lessons;
  final List<LessonModel> upcoming;

  bool get isFinished => lessons.isNotEmpty && lessons.every((l) => l.completed);
}
