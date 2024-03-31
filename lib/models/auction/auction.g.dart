// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuctionModelImpl _$$AuctionModelImplFromJson(Map<String, dynamic> json) =>
    _$AuctionModelImpl(
      title: json['title'] as String,
      address: json['address'] as String,
      documentId: json['documentId'] as String,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      premium: (json['premium'] as num?)?.toDouble(),
      state: json['state'] as String?,
      terms: json['terms'] as String?,
      city: json['city'] as String?,
      zip: json['zip'] as String?,
      byOrderOf: json['byOrderOf'] as String?,
      listings: json['listings'] as List<dynamic>?,
    );

Map<String, dynamic> _$$AuctionModelImplToJson(_$AuctionModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'address': instance.address,
      'documentId': instance.documentId,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'premium': instance.premium,
      'state': instance.state,
      'terms': instance.terms,
      'city': instance.city,
      'zip': instance.zip,
      'byOrderOf': instance.byOrderOf,
      'listings': instance.listings,
    };
