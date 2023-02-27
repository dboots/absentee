// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfileModel _$$_UserProfileModelFromJson(Map<String, dynamic> json) =>
    _$_UserProfileModel(
      name: json['name'] as String,
      locked: json['locked'] == null
          ? null
          : UserProfileModel.fromJson(json['locked'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserProfileModelToJson(_$_UserProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'locked': instance.locked,
    };
