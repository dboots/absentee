// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListingModel _$$_ListingModelFromJson(Map<String, dynamic> json) =>
    _$_ListingModel(
      bidIncrement: (json['bidIncrement'] as num).toDouble(),
      startPrice: (json['startPrice'] as num).toDouble(),
      title: json['title'] as String,
      locked: json['locked'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      lockedProfile: json['lockedProfile'] == null
          ? null
          : UserProfileModel.fromJson(
              json['lockedProfile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ListingModelToJson(_$_ListingModel instance) =>
    <String, dynamic>{
      'bidIncrement': instance.bidIncrement,
      'startPrice': instance.startPrice,
      'title': instance.title,
      'locked': instance.locked,
      'images': instance.images,
      'lockedProfile': instance.lockedProfile,
    };
