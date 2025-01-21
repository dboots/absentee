// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListingModelImpl _$$ListingModelImplFromJson(Map<String, dynamic> json) =>
    _$ListingModelImpl(
      uid: json['uid'] as String? ?? '',
      title: json['title'] as String,
      startPrice: (json['startPrice'] as num?)?.toDouble(),
      lotNumber: json['lotNumber'] as String?,
      location: json['location'] as String?,
      quantity: const IntConverter().fromJson(json['quantity']),
      description: json['description'] as String?,
      category: json['category'] as String?,
      locked: json['locked'] as String?,
      measurements: json['measurements'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      seller: json['seller'] == null
          ? null
          : SellerModel.fromJson(json['seller'] as Map<String, dynamic>),
      lockedProfile: json['lockedProfile'] == null
          ? null
          : UserProfileModel.fromJson(
              json['lockedProfile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ListingModelImplToJson(_$ListingModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'title': instance.title,
      'startPrice': instance.startPrice,
      'lotNumber': instance.lotNumber,
      'location': instance.location,
      'quantity': const IntConverter().toJson(instance.quantity),
      'description': instance.description,
      'category': instance.category,
      'locked': instance.locked,
      'measurements': instance.measurements,
      'images': instance.images,
      'seller': instance.seller,
      'lockedProfile': instance.lockedProfile,
    };
