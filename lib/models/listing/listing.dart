import 'package:absentee/models/seller/seller.dart';
import 'package:absentee/models/user-profile/user-profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'listing.freezed.dart';
part 'listing.g.dart';

class IntConverter implements JsonConverter<int?, Object?> {
  const IntConverter();

  @override
  int? fromJson(Object? json) {
    if (json == null) return null;
    if (json is int) return json;
    if (json is String) return int.tryParse(json);
    return null;
  }

  @override
  Object? toJson(int? object) => object;
}

@unfreezed
class ListingModel with _$ListingModel {
  factory ListingModel({
    @Default('') String uid,
    required String title,
    double? startPrice,
    String? lotNumber,
    String? location,
    @IntConverter() int? quantity,
    String? description,
    String? category,
    String? locked,
    String? measurements,
    List<String>? images,
    SellerModel? seller,
    UserProfileModel? lockedProfile,
    @JsonKey(includeFromJson: false, includeToJson: false) DocumentReference? auctionRef,
    @JsonKey(includeFromJson: false, includeToJson: false) String? auctionId,
    @JsonKey(includeFromJson: false, includeToJson: false) String? sellerId,
  }) = _ListingModel;

  factory ListingModel.fromJson(Map<String, Object?> json) => _$ListingModelFromJson(json);
}
