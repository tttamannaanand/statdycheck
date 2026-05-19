class ProfileModel {
  final String name;
  final String phone;
  final String avatar;
  final int currentStreak;
  final HighestStreak highestStreak;
  final List<DailyStudy> weeklyStudy;
  final List<String> careerInterests;
  final ProfilePreferences preferences;

  ProfileModel({
    required this.name,
    required this.phone,
    required this.avatar,
    required this.currentStreak,
    required this.highestStreak,
    required this.weeklyStudy,
    required this.careerInterests,
    required this.preferences,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      phone: json['phone'],
      avatar: json['avatar'],
      currentStreak: json['currentStreak'],
      highestStreak:
          HighestStreak.fromJson(json['highestStreak']),
      weeklyStudy: (json['weeklyStudy'] as List)
          .map((e) => DailyStudy.fromJson(e))
          .toList(),
      careerInterests:
          List<String>.from(json['careerInterests']),
      preferences: ProfilePreferences.fromJson(
          json['preferences']),
    );
  }
}

class HighestStreak {
  final int days;
  final int hours;

  HighestStreak({
    required this.days,
    required this.hours,
  });

  factory HighestStreak.fromJson(
      Map<String, dynamic> json) {
    return HighestStreak(
      days: json['days'],
      hours: json['hours'],
    );
  }
}

class DailyStudy {
  final String day;
  final int hours;

  DailyStudy({
    required this.day,
    required this.hours,
  });

  factory DailyStudy.fromJson(
      Map<String, dynamic> json) {
    return DailyStudy(
      day: json['day'],
      hours: json['hours'],
    );
  }
}

class ProfilePreferences {
  final String theme;
  final String language;
  final bool notifications;

  ProfilePreferences({
    required this.theme,
    required this.language,
    required this.notifications,
  });

  factory ProfilePreferences.fromJson(
      Map<String, dynamic> json) {
    return ProfilePreferences(
      theme: json['theme'],
      language: json['language'],
      notifications: json['notifications'],
    );
  }
}