// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileModelImpl _$$UserProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileModelImpl(
      name: json['name'] as String,
      locked: json['locked'] == null
          ? null
          : UserProfileModel.fromJson(json['locked'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserProfileModelImplToJson(
        _$UserProfileModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'locked': instance.locked,
    };
