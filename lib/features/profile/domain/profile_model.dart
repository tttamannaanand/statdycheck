class ProfileModel {
  const ProfileModel({
    required this.username,
    required this.avatarUrl,
    required this.streakDays,
    required this.checkedInDays,
    required this.currentXp,
    required this.targetXp,
    required this.level,
    required this.strongestSubject,
    required this.weakSubject,
    required this.hoursStudied,
    required this.weeksEnrolled,
    required this.enrolledDayMarks,
    required this.careerInterests,
  });

  final String username;
  final String avatarUrl;
  final int streakDays;
  final List<bool> checkedInDays;
  final int currentXp;
  final int targetXp;
  final int level;
  final String strongestSubject;
  final String weakSubject;
  final int hoursStudied;
  final int weeksEnrolled;
  final List<bool> enrolledDayMarks;
  final List<String> careerInterests;

  double get xpProgress => currentXp / targetXp;
}
