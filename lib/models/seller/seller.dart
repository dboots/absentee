import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller.freezed.dart';
part 'seller.g.dart';

@unfreezed
class SellerModel with _$SellerModel {
  factory SellerModel({
    @Default('')
    String uid,
    required String company,
  }) = _SellerModel;

  factory SellerModel.fromJson(Map<String, Object?> json) =>
      _$SellerModelFromJson(json);
}
