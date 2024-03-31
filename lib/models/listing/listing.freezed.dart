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
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;
  double? get startPrice => throw _privateConstructorUsedError;
  set startPrice(double? value) => throw _privateConstructorUsedError;
  String? get lotNumber => throw _privateConstructorUsedError;
  set lotNumber(String? value) => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  set location(String? value) => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  set quantity(int? value) => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  set description(String? value) => throw _privateConstructorUsedError;
  String? get locked => throw _privateConstructorUsedError;
  set locked(String? value) => throw _privateConstructorUsedError;
  String? get measurements => throw _privateConstructorUsedError;
  set measurements(String? value) => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  set images(List<String>? value) => throw _privateConstructorUsedError;
  SellerModel? get seller => throw _privateConstructorUsedError;
  set seller(SellerModel? value) => throw _privateConstructorUsedError;
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
  @JsonKey(ignore: true)
  String? get sellerId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  set sellerId(String? value) => throw _privateConstructorUsedError;

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
      String title,
      double? startPrice,
      String? lotNumber,
      String? location,
      int? quantity,
      String? description,
      String? locked,
      String? measurements,
      List<String>? images,
      SellerModel? seller,
      UserProfileModel? lockedProfile,
      @JsonKey(ignore: true) DocumentReference<Object?>? auctionRef,
      @JsonKey(ignore: true) String? auctionId,
      @JsonKey(ignore: true) String? sellerId});

  $SellerModelCopyWith<$Res>? get seller;
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
    Object? title = null,
    Object? startPrice = freezed,
    Object? lotNumber = freezed,
    Object? location = freezed,
    Object? quantity = freezed,
    Object? description = freezed,
    Object? locked = freezed,
    Object? measurements = freezed,
    Object? images = freezed,
    Object? seller = freezed,
    Object? lockedProfile = freezed,
    Object? auctionRef = freezed,
    Object? auctionId = freezed,
    Object? sellerId = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startPrice: freezed == startPrice
          ? _value.startPrice
          : startPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      lotNumber: freezed == lotNumber
          ? _value.lotNumber
          : lotNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      locked: freezed == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as String?,
      measurements: freezed == measurements
          ? _value.measurements
          : measurements // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      seller: freezed == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as SellerModel?,
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
      sellerId: freezed == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SellerModelCopyWith<$Res>? get seller {
    if (_value.seller == null) {
      return null;
    }

    return $SellerModelCopyWith<$Res>(_value.seller!, (value) {
      return _then(_value.copyWith(seller: value) as $Val);
    });
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
abstract class _$$ListingModelImplCopyWith<$Res>
    implements $ListingModelCopyWith<$Res> {
  factory _$$ListingModelImplCopyWith(
          _$ListingModelImpl value, $Res Function(_$ListingModelImpl) then) =
      __$$ListingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String title,
      double? startPrice,
      String? lotNumber,
      String? location,
      int? quantity,
      String? description,
      String? locked,
      String? measurements,
      List<String>? images,
      SellerModel? seller,
      UserProfileModel? lockedProfile,
      @JsonKey(ignore: true) DocumentReference<Object?>? auctionRef,
      @JsonKey(ignore: true) String? auctionId,
      @JsonKey(ignore: true) String? sellerId});

  @override
  $SellerModelCopyWith<$Res>? get seller;
  @override
  $UserProfileModelCopyWith<$Res>? get lockedProfile;
}

/// @nodoc
class __$$ListingModelImplCopyWithImpl<$Res>
    extends _$ListingModelCopyWithImpl<$Res, _$ListingModelImpl>
    implements _$$ListingModelImplCopyWith<$Res> {
  __$$ListingModelImplCopyWithImpl(
      _$ListingModelImpl _value, $Res Function(_$ListingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? title = null,
    Object? startPrice = freezed,
    Object? lotNumber = freezed,
    Object? location = freezed,
    Object? quantity = freezed,
    Object? description = freezed,
    Object? locked = freezed,
    Object? measurements = freezed,
    Object? images = freezed,
    Object? seller = freezed,
    Object? lockedProfile = freezed,
    Object? auctionRef = freezed,
    Object? auctionId = freezed,
    Object? sellerId = freezed,
  }) {
    return _then(_$ListingModelImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startPrice: freezed == startPrice
          ? _value.startPrice
          : startPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      lotNumber: freezed == lotNumber
          ? _value.lotNumber
          : lotNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      locked: freezed == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as String?,
      measurements: freezed == measurements
          ? _value.measurements
          : measurements // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      seller: freezed == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as SellerModel?,
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
      sellerId: freezed == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListingModelImpl with DiagnosticableTreeMixin implements _ListingModel {
  _$ListingModelImpl(
      {this.uid = '',
      required this.title,
      this.startPrice,
      this.lotNumber,
      this.location,
      this.quantity,
      this.description,
      this.locked,
      this.measurements,
      this.images,
      this.seller,
      this.lockedProfile,
      @JsonKey(ignore: true) this.auctionRef,
      @JsonKey(ignore: true) this.auctionId,
      @JsonKey(ignore: true) this.sellerId});

  factory _$ListingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListingModelImplFromJson(json);

  @override
  @JsonKey()
  String uid;
  @override
  String title;
  @override
  double? startPrice;
  @override
  String? lotNumber;
  @override
  String? location;
  @override
  int? quantity;
  @override
  String? description;
  @override
  String? locked;
  @override
  String? measurements;
  @override
  List<String>? images;
  @override
  SellerModel? seller;
  @override
  UserProfileModel? lockedProfile;
  @override
  @JsonKey(ignore: true)
  DocumentReference<Object?>? auctionRef;
  @override
  @JsonKey(ignore: true)
  String? auctionId;
  @override
  @JsonKey(ignore: true)
  String? sellerId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ListingModel(uid: $uid, title: $title, startPrice: $startPrice, lotNumber: $lotNumber, location: $location, quantity: $quantity, description: $description, locked: $locked, measurements: $measurements, images: $images, seller: $seller, lockedProfile: $lockedProfile, auctionRef: $auctionRef, auctionId: $auctionId, sellerId: $sellerId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ListingModel'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('startPrice', startPrice))
      ..add(DiagnosticsProperty('lotNumber', lotNumber))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('quantity', quantity))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('locked', locked))
      ..add(DiagnosticsProperty('measurements', measurements))
      ..add(DiagnosticsProperty('images', images))
      ..add(DiagnosticsProperty('seller', seller))
      ..add(DiagnosticsProperty('lockedProfile', lockedProfile))
      ..add(DiagnosticsProperty('auctionRef', auctionRef))
      ..add(DiagnosticsProperty('auctionId', auctionId))
      ..add(DiagnosticsProperty('sellerId', sellerId));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListingModelImplCopyWith<_$ListingModelImpl> get copyWith =>
      __$$ListingModelImplCopyWithImpl<_$ListingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListingModelImplToJson(
      this,
    );
  }
}

abstract class _ListingModel implements ListingModel {
  factory _ListingModel(
      {String uid,
      required String title,
      double? startPrice,
      String? lotNumber,
      String? location,
      int? quantity,
      String? description,
      String? locked,
      String? measurements,
      List<String>? images,
      SellerModel? seller,
      UserProfileModel? lockedProfile,
      @JsonKey(ignore: true) DocumentReference<Object?>? auctionRef,
      @JsonKey(ignore: true) String? auctionId,
      @JsonKey(ignore: true) String? sellerId}) = _$ListingModelImpl;

  factory _ListingModel.fromJson(Map<String, dynamic> json) =
      _$ListingModelImpl.fromJson;

  @override
  String get uid;
  set uid(String value);
  @override
  String get title;
  set title(String value);
  @override
  double? get startPrice;
  set startPrice(double? value);
  @override
  String? get lotNumber;
  set lotNumber(String? value);
  @override
  String? get location;
  set location(String? value);
  @override
  int? get quantity;
  set quantity(int? value);
  @override
  String? get description;
  set description(String? value);
  @override
  String? get locked;
  set locked(String? value);
  @override
  String? get measurements;
  set measurements(String? value);
  @override
  List<String>? get images;
  set images(List<String>? value);
  @override
  SellerModel? get seller;
  set seller(SellerModel? value);
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
  String? get sellerId;
  @JsonKey(ignore: true)
  set sellerId(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ListingModelImplCopyWith<_$ListingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
