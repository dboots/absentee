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
  String get uid => throw _privateConstructorUsedError;
  set uid(String value) => throw _privateConstructorUsedError;
  double get bidIncrement => throw _privateConstructorUsedError;
  set bidIncrement(double value) => throw _privateConstructorUsedError;
  double get startPrice => throw _privateConstructorUsedError;
  set startPrice(double value) => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;
  String? get locked => throw _privateConstructorUsedError;
  set locked(String? value) => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  set images(List<String>? value) => throw _privateConstructorUsedError;
  UserProfileModel? get lockedProfile => throw _privateConstructorUsedError;
  set lockedProfile(UserProfileModel? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  DocumentReference<Object?>? get auctionRef =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  set auctionRef(DocumentReference<Object?>? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String? get auctionId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  set auctionId(String? value) => throw _privateConstructorUsedError;

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
      {String uid,
      double bidIncrement,
      double startPrice,
      String title,
      String? locked,
      List<String>? images,
      UserProfileModel? lockedProfile,
      @JsonKey(ignore: true) DocumentReference<Object?>? auctionRef,
      @JsonKey(ignore: true) String? auctionId});

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
    Object? uid = null,
    Object? bidIncrement = null,
    Object? startPrice = null,
    Object? title = null,
    Object? locked = freezed,
    Object? images = freezed,
    Object? lockedProfile = freezed,
    Object? auctionRef = freezed,
    Object? auctionId = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
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
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      lockedProfile: freezed == lockedProfile
          ? _value.lockedProfile
          : lockedProfile // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
      auctionRef: freezed == auctionRef
          ? _value.auctionRef
          : auctionRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      auctionId: freezed == auctionId
          ? _value.auctionId
          : auctionId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {String uid,
      double bidIncrement,
      double startPrice,
      String title,
      String? locked,
      List<String>? images,
      UserProfileModel? lockedProfile,
      @JsonKey(ignore: true) DocumentReference<Object?>? auctionRef,
      @JsonKey(ignore: true) String? auctionId});

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
    Object? uid = null,
    Object? bidIncrement = null,
    Object? startPrice = null,
    Object? title = null,
    Object? locked = freezed,
    Object? images = freezed,
    Object? lockedProfile = freezed,
    Object? auctionRef = freezed,
    Object? auctionId = freezed,
  }) {
    return _then(_$_ListingModel(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
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
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      lockedProfile: freezed == lockedProfile
          ? _value.lockedProfile
          : lockedProfile // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
      auctionRef: freezed == auctionRef
          ? _value.auctionRef
          : auctionRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Object?>?,
      auctionId: freezed == auctionId
          ? _value.auctionId
          : auctionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListingModel with DiagnosticableTreeMixin implements _ListingModel {
  _$_ListingModel(
      {this.uid = '',
      required this.bidIncrement,
      required this.startPrice,
      required this.title,
      this.locked,
      this.images,
      this.lockedProfile,
      @JsonKey(ignore: true) this.auctionRef,
      @JsonKey(ignore: true) this.auctionId});

  factory _$_ListingModel.fromJson(Map<String, dynamic> json) =>
      _$$_ListingModelFromJson(json);

  @override
  @JsonKey()
  String uid;
  @override
  double bidIncrement;
  @override
  double startPrice;
  @override
  String title;
  @override
  String? locked;
  @override
  List<String>? images;
  @override
  UserProfileModel? lockedProfile;
  @override
  @JsonKey(ignore: true)
  DocumentReference<Object?>? auctionRef;
  @override
  @JsonKey(ignore: true)
  String? auctionId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ListingModel(uid: $uid, bidIncrement: $bidIncrement, startPrice: $startPrice, title: $title, locked: $locked, images: $images, lockedProfile: $lockedProfile, auctionRef: $auctionRef, auctionId: $auctionId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ListingModel'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('bidIncrement', bidIncrement))
      ..add(DiagnosticsProperty('startPrice', startPrice))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('locked', locked))
      ..add(DiagnosticsProperty('images', images))
      ..add(DiagnosticsProperty('lockedProfile', lockedProfile))
      ..add(DiagnosticsProperty('auctionRef', auctionRef))
      ..add(DiagnosticsProperty('auctionId', auctionId));
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
      {String uid,
      required double bidIncrement,
      required double startPrice,
      required String title,
      String? locked,
      List<String>? images,
      UserProfileModel? lockedProfile,
      @JsonKey(ignore: true) DocumentReference<Object?>? auctionRef,
      @JsonKey(ignore: true) String? auctionId}) = _$_ListingModel;

  factory _ListingModel.fromJson(Map<String, dynamic> json) =
      _$_ListingModel.fromJson;

  @override
  String get uid;
  set uid(String value);
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
  List<String>? get images;
  set images(List<String>? value);
  @override
  UserProfileModel? get lockedProfile;
  set lockedProfile(UserProfileModel? value);
  @override
  @JsonKey(ignore: true)
  DocumentReference<Object?>? get auctionRef;
  @JsonKey(ignore: true)
  set auctionRef(DocumentReference<Object?>? value);
  @override
  @JsonKey(ignore: true)
  String? get auctionId;
  @JsonKey(ignore: true)
  set auctionId(String? value);
  @override
  @JsonKey(ignore: true)
  _$$_ListingModelCopyWith<_$_ListingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
