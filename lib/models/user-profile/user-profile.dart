import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user-profile.freezed.dart';
part 'user-profile.g.dart';

@freezed
class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
      required String name,
      UserProfileModel? locked}) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, Object?> json) =>
      _$UserProfileModelFromJson(json);
}
