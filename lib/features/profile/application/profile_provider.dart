import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/profile_model.dart';

final profileProvider = FutureProvider<ProfileModel>((ref) async {
  return const ProfileModel(
    username: '@lakshya_12',
    avatarUrl: 'https://i.pravatar.cc/300?img=13',
    streakDays: 4,
    checkedInDays: [true, true, true, true, false, false, false],
    currentXp: 1899,
    targetXp: 2500,
    level: 12,
    strongestSubject: 'Design Thinking',
    weakSubject: 'Empathy',
    hoursStudied: 30,
    weeksEnrolled: 6,
    enrolledDayMarks: [true, true, true, true, true, true, true],
    careerInterests: ['Data Analyst', 'UI UX Design'],
  );
});
