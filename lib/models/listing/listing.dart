import 'package:absentee/models/user-profile/user-profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'listing.freezed.dart';
part 'listing.g.dart';

@unfreezed
class ListingModel with _$ListingModel {
  factory ListingModel({
    @Default('')
    String uid,
    required double bidIncrement,
    required double startPrice,
    required String title,
    String? locked,
    List<String>? images,
    UserProfileModel? lockedProfile,
    @JsonKey(ignore: true) DocumentReference? auctionRef,
    @JsonKey(ignore: true) String? auctionId,
  }) = _ListingModel;

  factory ListingModel.fromJson(Map<String, Object?> json) =>
      _$ListingModelFromJson(json);
}
