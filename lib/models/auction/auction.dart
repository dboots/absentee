import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'auction.freezed.dart';
part 'auction.g.dart';

@freezed
abstract class AuctionModel with _$AuctionModel {
  const factory AuctionModel(
      {required String title,
      required String address,
      required String documentId,
      DateTime? startDate,
      DateTime? endDate,
      double? premium,
      String? state,
      String? terms,
      String? city,
      String? zip,
      String? byOrderOf,
      String? userId,
      List<dynamic>? listings}) = _AuctionModel;

      factory AuctionModel.fromJson(Map<String, Object?> json)
      => _$AuctionModelFromJson(json);
} 
