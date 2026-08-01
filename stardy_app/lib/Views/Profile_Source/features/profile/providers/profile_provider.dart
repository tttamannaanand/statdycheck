import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/mock_profile_data.dart';
import '../data/models/profile_model.dart';

final profileProvider =
    FutureProvider<ProfileModel>((ref) async {
  await Future.delayed(const Duration(milliseconds: 800));

  return ProfileModel.fromJson(mockProfileData);
});