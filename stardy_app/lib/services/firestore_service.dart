import 'package:cloud_firestore/cloud_firestore.dart';

/// Reads/writes each user's progress data from a single document at
/// `users/{uid}`:
/// ```
/// {
///   xp: int,
///   level: int,
///   streakDays: int,
///   badges: [String],
///   grades: { assignmentTitle: percentage },
/// }
/// ```
/// Only the XP/level fields are wired into a screen right now (Profile
/// page). Streak, badges, and grades share the same document shape and can
/// be read/written the same way once there's real data to back them.
class UserProfileService {
  UserProfileService._();
  static final UserProfileService instance = UserProfileService._();

  CollectionReference<Map<String, dynamic>> get _users =>
      FirebaseFirestore.instance.collection('users');

  Future<Map<String, dynamic>?> fetchProfile(String uid) async {
    final snapshot = await _users.doc(uid).get();
    return snapshot.data();
  }

  Stream<Map<String, dynamic>?> watchProfile(String uid) {
    return _users.doc(uid).snapshots().map((snapshot) => snapshot.data());
  }

  Future<void> updateXp(String uid, {required int xp, required int level}) {
    return _users.doc(uid).set({
      'xp': xp,
      'level': level,
    }, SetOptions(merge: true));
  }

  Future<void> updateStreak(String uid, int streakDays) {
    return _users.doc(
      uid,
    ).set({'streakDays': streakDays}, SetOptions(merge: true));
  }

  Future<void> setGrade(String uid, String assignmentTitle, int percentage) {
    return _users.doc(uid).set({
      'grades': {assignmentTitle: percentage},
    }, SetOptions(merge: true));
  }
}
