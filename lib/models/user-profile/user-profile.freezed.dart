// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user-profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) {
  return _UserProfileModel.fromJson(json);
}

/// @nodoc
mixin _$UserProfileModel {
  String get name => throw _privateConstructorUsedError;
  UserProfileModel? get locked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileModelCopyWith<UserProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileModelCopyWith<$Res> {
  factory $UserProfileModelCopyWith(
          UserProfileModel value, $Res Function(UserProfileModel) then) =
      _$UserProfileModelCopyWithImpl<$Res, UserProfileModel>;
  @useResult
  $Res call({String name, UserProfileModel? locked});

  $UserProfileModelCopyWith<$Res>? get locked;
}

/// @nodoc
class _$UserProfileModelCopyWithImpl<$Res, $Val extends UserProfileModel>
    implements $UserProfileModelCopyWith<$Res> {
  _$UserProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? locked = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      locked: freezed == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileModelCopyWith<$Res>? get locked {
    if (_value.locked == null) {
      return null;
    }

    return $UserProfileModelCopyWith<$Res>(_value.locked!, (value) {
      return _then(_value.copyWith(locked: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserProfileModelCopyWith<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  factory _$$_UserProfileModelCopyWith(
          _$_UserProfileModel value, $Res Function(_$_UserProfileModel) then) =
      __$$_UserProfileModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, UserProfileModel? locked});

  @override
  $UserProfileModelCopyWith<$Res>? get locked;
}

/// @nodoc
class __$$_UserProfileModelCopyWithImpl<$Res>
    extends _$UserProfileModelCopyWithImpl<$Res, _$_UserProfileModel>
    implements _$$_UserProfileModelCopyWith<$Res> {
  __$$_UserProfileModelCopyWithImpl(
      _$_UserProfileModel _value, $Res Function(_$_UserProfileModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? locked = freezed,
  }) {
    return _then(_$_UserProfileModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      locked: freezed == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfileModel
    with DiagnosticableTreeMixin
    implements _UserProfileModel {
  const _$_UserProfileModel({required this.name, this.locked});

  factory _$_UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfileModelFromJson(json);

  @override
  final String name;
  @override
  final UserProfileModel? locked;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserProfileModel(name: $name, locked: $locked)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserProfileModel'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('locked', locked));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfileModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.locked, locked) || other.locked == locked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, locked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProfileModelCopyWith<_$_UserProfileModel> get copyWith =>
      __$$_UserProfileModelCopyWithImpl<_$_UserProfileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileModelToJson(
      this,
    );
  }
}

abstract class _UserProfileModel implements UserProfileModel {
  const factory _UserProfileModel(
      {required final String name,
      final UserProfileModel? locked}) = _$_UserProfileModel;

  factory _UserProfileModel.fromJson(Map<String, dynamic> json) =
      _$_UserProfileModel.fromJson;

  @override
  String get name;
  @override
  UserProfileModel? get locked;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileModelCopyWith<_$_UserProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}
