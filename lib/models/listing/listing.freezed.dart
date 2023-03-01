// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListingModel _$ListingModelFromJson(Map<String, dynamic> json) {
  return _ListingModel.fromJson(json);
}

/// @nodoc
mixin _$ListingModel {
  double get bidIncrement => throw _privateConstructorUsedError;
  set bidIncrement(double value) => throw _privateConstructorUsedError;
  double get startPrice => throw _privateConstructorUsedError;
  set startPrice(double value) => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;
  String? get locked => throw _privateConstructorUsedError;
  set locked(String? value) => throw _privateConstructorUsedError;
  UserProfileModel? get lockedProfile => throw _privateConstructorUsedError;
  set lockedProfile(UserProfileModel? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListingModelCopyWith<ListingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListingModelCopyWith<$Res> {
  factory $ListingModelCopyWith(
          ListingModel value, $Res Function(ListingModel) then) =
      _$ListingModelCopyWithImpl<$Res, ListingModel>;
  @useResult
  $Res call(
      {double bidIncrement,
      double startPrice,
      String title,
      String? locked,
      UserProfileModel? lockedProfile});

  $UserProfileModelCopyWith<$Res>? get lockedProfile;
}

/// @nodoc
class _$ListingModelCopyWithImpl<$Res, $Val extends ListingModel>
    implements $ListingModelCopyWith<$Res> {
  _$ListingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bidIncrement = null,
    Object? startPrice = null,
    Object? title = null,
    Object? locked = freezed,
    Object? lockedProfile = freezed,
  }) {
    return _then(_value.copyWith(
      bidIncrement: null == bidIncrement
          ? _value.bidIncrement
          : bidIncrement // ignore: cast_nullable_to_non_nullable
              as double,
      startPrice: null == startPrice
          ? _value.startPrice
          : startPrice // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      locked: freezed == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as String?,
      lockedProfile: freezed == lockedProfile
          ? _value.lockedProfile
          : lockedProfile // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileModelCopyWith<$Res>? get lockedProfile {
    if (_value.lockedProfile == null) {
      return null;
    }

    return $UserProfileModelCopyWith<$Res>(_value.lockedProfile!, (value) {
      return _then(_value.copyWith(lockedProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ListingModelCopyWith<$Res>
    implements $ListingModelCopyWith<$Res> {
  factory _$$_ListingModelCopyWith(
          _$_ListingModel value, $Res Function(_$_ListingModel) then) =
      __$$_ListingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double bidIncrement,
      double startPrice,
      String title,
      String? locked,
      UserProfileModel? lockedProfile});

  @override
  $UserProfileModelCopyWith<$Res>? get lockedProfile;
}

/// @nodoc
class __$$_ListingModelCopyWithImpl<$Res>
    extends _$ListingModelCopyWithImpl<$Res, _$_ListingModel>
    implements _$$_ListingModelCopyWith<$Res> {
  __$$_ListingModelCopyWithImpl(
      _$_ListingModel _value, $Res Function(_$_ListingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bidIncrement = null,
    Object? startPrice = null,
    Object? title = null,
    Object? locked = freezed,
    Object? lockedProfile = freezed,
  }) {
    return _then(_$_ListingModel(
      bidIncrement: null == bidIncrement
          ? _value.bidIncrement
          : bidIncrement // ignore: cast_nullable_to_non_nullable
              as double,
      startPrice: null == startPrice
          ? _value.startPrice
          : startPrice // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      locked: freezed == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as String?,
      lockedProfile: freezed == lockedProfile
          ? _value.lockedProfile
          : lockedProfile // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListingModel with DiagnosticableTreeMixin implements _ListingModel {
  _$_ListingModel(
      {required this.bidIncrement,
      required this.startPrice,
      required this.title,
      this.locked,
      this.lockedProfile});

  factory _$_ListingModel.fromJson(Map<String, dynamic> json) =>
      _$$_ListingModelFromJson(json);

  @override
  double bidIncrement;
  @override
  double startPrice;
  @override
  String title;
  @override
  String? locked;
  @override
  UserProfileModel? lockedProfile;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ListingModel(bidIncrement: $bidIncrement, startPrice: $startPrice, title: $title, locked: $locked, lockedProfile: $lockedProfile)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ListingModel'))
      ..add(DiagnosticsProperty('bidIncrement', bidIncrement))
      ..add(DiagnosticsProperty('startPrice', startPrice))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('locked', locked))
      ..add(DiagnosticsProperty('lockedProfile', lockedProfile));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListingModelCopyWith<_$_ListingModel> get copyWith =>
      __$$_ListingModelCopyWithImpl<_$_ListingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListingModelToJson(
      this,
    );
  }
}

abstract class _ListingModel implements ListingModel {
  factory _ListingModel(
      {required double bidIncrement,
      required double startPrice,
      required String title,
      String? locked,
      UserProfileModel? lockedProfile}) = _$_ListingModel;

  factory _ListingModel.fromJson(Map<String, dynamic> json) =
      _$_ListingModel.fromJson;

  @override
  double get bidIncrement;
  set bidIncrement(double value);
  @override
  double get startPrice;
  set startPrice(double value);
  @override
  String get title;
  set title(String value);
  @override
  String? get locked;
  set locked(String? value);
  @override
  UserProfileModel? get lockedProfile;
  set lockedProfile(UserProfileModel? value);
  @override
  @JsonKey(ignore: true)
  _$$_ListingModelCopyWith<_$_ListingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
