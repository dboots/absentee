// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuctionModel _$$_AuctionModelFromJson(Map<String, dynamic> json) =>
    _$_AuctionModel(
      description: json['description'] as String,
      address: json['address'] as String,
      documentId: json['documentId'] as String,
      state: json['state'] as String?,
      city: json['city'] as String?,
      zip: json['zip'] as String?,
      listings: json['listings'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_AuctionModelToJson(_$_AuctionModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'address': instance.address,
      'documentId': instance.documentId,
      'state': instance.state,
      'city': instance.city,
      'zip': instance.zip,
      'listings': instance.listings,
    };
