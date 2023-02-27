// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuctionModel _$AuctionModelFromJson(Map<String, dynamic> json) {
  return _AuctionModel.fromJson(json);
}

/// @nodoc
mixin _$AuctionModel {
  String get description => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get documentId => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get zip => throw _privateConstructorUsedError;
  List<dynamic>? get listings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuctionModelCopyWith<AuctionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuctionModelCopyWith<$Res> {
  factory $AuctionModelCopyWith(
          AuctionModel value, $Res Function(AuctionModel) then) =
      _$AuctionModelCopyWithImpl<$Res, AuctionModel>;
  @useResult
  $Res call(
      {String description,
      String address,
      String documentId,
      String? state,
      String? city,
      String? zip,
      List<dynamic>? listings});
}

/// @nodoc
class _$AuctionModelCopyWithImpl<$Res, $Val extends AuctionModel>
    implements $AuctionModelCopyWith<$Res> {
  _$AuctionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? address = null,
    Object? documentId = null,
    Object? state = freezed,
    Object? city = freezed,
    Object? zip = freezed,
    Object? listings = freezed,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: null == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      zip: freezed == zip
          ? _value.zip
          : zip // ignore: cast_nullable_to_non_nullable
              as String?,
      listings: freezed == listings
          ? _value.listings
          : listings // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuctionModelCopyWith<$Res>
    implements $AuctionModelCopyWith<$Res> {
  factory _$$_AuctionModelCopyWith(
          _$_AuctionModel value, $Res Function(_$_AuctionModel) then) =
      __$$_AuctionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String description,
      String address,
      String documentId,
      String? state,
      String? city,
      String? zip,
      List<dynamic>? listings});
}

/// @nodoc
class __$$_AuctionModelCopyWithImpl<$Res>
    extends _$AuctionModelCopyWithImpl<$Res, _$_AuctionModel>
    implements _$$_AuctionModelCopyWith<$Res> {
  __$$_AuctionModelCopyWithImpl(
      _$_AuctionModel _value, $Res Function(_$_AuctionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? address = null,
    Object? documentId = null,
    Object? state = freezed,
    Object? city = freezed,
    Object? zip = freezed,
    Object? listings = freezed,
  }) {
    return _then(_$_AuctionModel(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      documentId: null == documentId
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      zip: freezed == zip
          ? _value.zip
          : zip // ignore: cast_nullable_to_non_nullable
              as String?,
      listings: freezed == listings
          ? _value._listings
          : listings // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuctionModel with DiagnosticableTreeMixin implements _AuctionModel {
  const _$_AuctionModel(
      {required this.description,
      required this.address,
      required this.documentId,
      this.state,
      this.city,
      this.zip,
      final List<dynamic>? listings})
      : _listings = listings;

  factory _$_AuctionModel.fromJson(Map<String, dynamic> json) =>
      _$$_AuctionModelFromJson(json);

  @override
  final String description;
  @override
  final String address;
  @override
  final String documentId;
  @override
  final String? state;
  @override
  final String? city;
  @override
  final String? zip;
  final List<dynamic>? _listings;
  @override
  List<dynamic>? get listings {
    final value = _listings;
    if (value == null) return null;
    if (_listings is EqualUnmodifiableListView) return _listings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuctionModel(description: $description, address: $address, documentId: $documentId, state: $state, city: $city, zip: $zip, listings: $listings)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuctionModel'))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('documentId', documentId))
      ..add(DiagnosticsProperty('state', state))
      ..add(DiagnosticsProperty('city', city))
      ..add(DiagnosticsProperty('zip', zip))
      ..add(DiagnosticsProperty('listings', listings));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuctionModel &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.zip, zip) || other.zip == zip) &&
            const DeepCollectionEquality().equals(other._listings, _listings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, description, address, documentId,
      state, city, zip, const DeepCollectionEquality().hash(_listings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuctionModelCopyWith<_$_AuctionModel> get copyWith =>
      __$$_AuctionModelCopyWithImpl<_$_AuctionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuctionModelToJson(
      this,
    );
  }
}

abstract class _AuctionModel implements AuctionModel {
  const factory _AuctionModel(
      {required final String description,
      required final String address,
      required final String documentId,
      final String? state,
      final String? city,
      final String? zip,
      final List<dynamic>? listings}) = _$_AuctionModel;

  factory _AuctionModel.fromJson(Map<String, dynamic> json) =
      _$_AuctionModel.fromJson;

  @override
  String get description;
  @override
  String get address;
  @override
  String get documentId;
  @override
  String? get state;
  @override
  String? get city;
  @override
  String? get zip;
  @override
  List<dynamic>? get listings;
  @override
  @JsonKey(ignore: true)
  _$$_AuctionModelCopyWith<_$_AuctionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
