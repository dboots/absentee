import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'auction.freezed.dart';
part 'auction.g.dart';

@freezed
class AuctionModel with _$AuctionModel {
  const factory AuctionModel(
      {required String description,
      required String address,
      required String documentId,
      String? state,
      String? city,
      String? zip,
      List<dynamic>? listings}) = _AuctionModel;

  factory AuctionModel.fromJson(Map<String, Object?> json) =>
      _$AuctionModelFromJson(json);
}
