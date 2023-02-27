import 'package:absentee/models/user-profile/user-profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'listing.freezed.dart';
part 'listing.g.dart';

@freezed
class ListingModel with _$ListingModel {
  const factory ListingModel({
      required double bidIncrement,
      required double startPrice,
      required String title,
      String? locked,
      UserProfileModel? lockedProfile}) = _ListingModel;

  factory ListingModel.fromJson(Map<String, Object?> json) =>
      _$ListingModelFromJson(json);
}
