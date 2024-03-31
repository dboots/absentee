// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SellerModel _$SellerModelFromJson(Map<String, dynamic> json) {
  return _SellerModel.fromJson(json);
}

/// @nodoc
mixin _$SellerModel {
  String get uid => throw _privateConstructorUsedError;
  set uid(String value) => throw _privateConstructorUsedError;
  String get company => throw _privateConstructorUsedError;
  set company(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SellerModelCopyWith<SellerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerModelCopyWith<$Res> {
  factory $SellerModelCopyWith(
          SellerModel value, $Res Function(SellerModel) then) =
      _$SellerModelCopyWithImpl<$Res, SellerModel>;
  @useResult
  $Res call({String uid, String company});
}

/// @nodoc
class _$SellerModelCopyWithImpl<$Res, $Val extends SellerModel>
    implements $SellerModelCopyWith<$Res> {
  _$SellerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? company = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellerModelImplCopyWith<$Res>
    implements $SellerModelCopyWith<$Res> {
  factory _$$SellerModelImplCopyWith(
          _$SellerModelImpl value, $Res Function(_$SellerModelImpl) then) =
      __$$SellerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String company});
}

/// @nodoc
class __$$SellerModelImplCopyWithImpl<$Res>
    extends _$SellerModelCopyWithImpl<$Res, _$SellerModelImpl>
    implements _$$SellerModelImplCopyWith<$Res> {
  __$$SellerModelImplCopyWithImpl(
      _$SellerModelImpl _value, $Res Function(_$SellerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? company = null,
  }) {
    return _then(_$SellerModelImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellerModelImpl implements _SellerModel {
  _$SellerModelImpl({this.uid = '', required this.company});

  factory _$SellerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellerModelImplFromJson(json);

  @override
  @JsonKey()
  String uid;
  @override
  String company;

  @override
  String toString() {
    return 'SellerModel(uid: $uid, company: $company)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerModelImplCopyWith<_$SellerModelImpl> get copyWith =>
      __$$SellerModelImplCopyWithImpl<_$SellerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellerModelImplToJson(
      this,
    );
  }
}

abstract class _SellerModel implements SellerModel {
  factory _SellerModel({String uid, required String company}) =
      _$SellerModelImpl;

  factory _SellerModel.fromJson(Map<String, dynamic> json) =
      _$SellerModelImpl.fromJson;

  @override
  String get uid;
  set uid(String value);
  @override
  String get company;
  set company(String value);
  @override
  @JsonKey(ignore: true)
  _$$SellerModelImplCopyWith<_$SellerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
