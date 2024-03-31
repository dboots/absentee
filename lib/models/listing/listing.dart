import 'package:absentee/models/seller/seller.dart';
import 'package:absentee/models/user-profile/user-profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'listing.freezed.dart';
part 'listing.g.dart';

@unfreezed
class ListingModel with _$ListingModel {
  factory ListingModel({
    @Default('') String uid,
    required String title,
    double? startPrice,
    String? lotNumber,
    String? location,
    int? quantity,
    String? description,
    String? locked,
    String? measurements,
    List<String>? images,
    SellerModel? seller,
    UserProfileModel? lockedProfile,
    @JsonKey(ignore: true) DocumentReference? auctionRef,
    @JsonKey(ignore: true) String? auctionId,
    @JsonKey(ignore: true) String? sellerId,
  }) = _ListingModel;

  factory ListingModel.fromJson(Map<String, Object?> json) => _$ListingModelFromJson(json);
}
