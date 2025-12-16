// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {
  @JsonKey(name: 'cpsCmpId')
  int get cpsCmpId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cpsTerId')
  int get cpsTerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cpsTerType')
  String get cpsTerType => throw _privateConstructorUsedError;
  @JsonKey(name: 'no')
  int get no => throw _privateConstructorUsedError;
  @JsonKey(name: 'commercialName')
  String get commercialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'datePeremption')
  DateTime get datePeremption => throw _privateConstructorUsedError;
  @JsonKey(name: 'prixPpa')
  double get prixPpa => throw _privateConstructorUsedError;
  @JsonKey(name: 'qte')
  double get qte => throw _privateConstructorUsedError;
  @JsonKey(name: 'prixPh')
  double get prixPh => throw _privateConstructorUsedError;
  @JsonKey(name: 'txRistourne')
  double? get txRistourne => throw _privateConstructorUsedError;
  @JsonKey(name: 'montant')
  num? get montant => throw _privateConstructorUsedError;

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cpsCmpId') int cpsCmpId,
      @JsonKey(name: 'cpsTerId') int cpsTerId,
      @JsonKey(name: 'cpsTerType') String cpsTerType,
      @JsonKey(name: 'no') int no,
      @JsonKey(name: 'commercialName') String commercialName,
      @JsonKey(name: 'datePeremption') DateTime datePeremption,
      @JsonKey(name: 'prixPpa') double prixPpa,
      @JsonKey(name: 'qte') double qte,
      @JsonKey(name: 'prixPh') double prixPh,
      @JsonKey(name: 'txRistourne') double? txRistourne,
      @JsonKey(name: 'montant') num? montant});
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cpsCmpId = null,
    Object? cpsTerId = null,
    Object? cpsTerType = null,
    Object? no = null,
    Object? commercialName = null,
    Object? datePeremption = null,
    Object? prixPpa = null,
    Object? qte = null,
    Object? prixPh = null,
    Object? txRistourne = freezed,
    Object? montant = freezed,
  }) {
    return _then(_value.copyWith(
      cpsCmpId: null == cpsCmpId
          ? _value.cpsCmpId
          : cpsCmpId // ignore: cast_nullable_to_non_nullable
              as int,
      cpsTerId: null == cpsTerId
          ? _value.cpsTerId
          : cpsTerId // ignore: cast_nullable_to_non_nullable
              as int,
      cpsTerType: null == cpsTerType
          ? _value.cpsTerType
          : cpsTerType // ignore: cast_nullable_to_non_nullable
              as String,
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as int,
      commercialName: null == commercialName
          ? _value.commercialName
          : commercialName // ignore: cast_nullable_to_non_nullable
              as String,
      datePeremption: null == datePeremption
          ? _value.datePeremption
          : datePeremption // ignore: cast_nullable_to_non_nullable
              as DateTime,
      prixPpa: null == prixPpa
          ? _value.prixPpa
          : prixPpa // ignore: cast_nullable_to_non_nullable
              as double,
      qte: null == qte
          ? _value.qte
          : qte // ignore: cast_nullable_to_non_nullable
              as double,
      prixPh: null == prixPh
          ? _value.prixPh
          : prixPh // ignore: cast_nullable_to_non_nullable
              as double,
      txRistourne: freezed == txRistourne
          ? _value.txRistourne
          : txRistourne // ignore: cast_nullable_to_non_nullable
              as double?,
      montant: freezed == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
          _$CartItemImpl value, $Res Function(_$CartItemImpl) then) =
      __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cpsCmpId') int cpsCmpId,
      @JsonKey(name: 'cpsTerId') int cpsTerId,
      @JsonKey(name: 'cpsTerType') String cpsTerType,
      @JsonKey(name: 'no') int no,
      @JsonKey(name: 'commercialName') String commercialName,
      @JsonKey(name: 'datePeremption') DateTime datePeremption,
      @JsonKey(name: 'prixPpa') double prixPpa,
      @JsonKey(name: 'qte') double qte,
      @JsonKey(name: 'prixPh') double prixPh,
      @JsonKey(name: 'txRistourne') double? txRistourne,
      @JsonKey(name: 'montant') num? montant});
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
      _$CartItemImpl _value, $Res Function(_$CartItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cpsCmpId = null,
    Object? cpsTerId = null,
    Object? cpsTerType = null,
    Object? no = null,
    Object? commercialName = null,
    Object? datePeremption = null,
    Object? prixPpa = null,
    Object? qte = null,
    Object? prixPh = null,
    Object? txRistourne = freezed,
    Object? montant = freezed,
  }) {
    return _then(_$CartItemImpl(
      cpsCmpId: null == cpsCmpId
          ? _value.cpsCmpId
          : cpsCmpId // ignore: cast_nullable_to_non_nullable
              as int,
      cpsTerId: null == cpsTerId
          ? _value.cpsTerId
          : cpsTerId // ignore: cast_nullable_to_non_nullable
              as int,
      cpsTerType: null == cpsTerType
          ? _value.cpsTerType
          : cpsTerType // ignore: cast_nullable_to_non_nullable
              as String,
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as int,
      commercialName: null == commercialName
          ? _value.commercialName
          : commercialName // ignore: cast_nullable_to_non_nullable
              as String,
      datePeremption: null == datePeremption
          ? _value.datePeremption
          : datePeremption // ignore: cast_nullable_to_non_nullable
              as DateTime,
      prixPpa: null == prixPpa
          ? _value.prixPpa
          : prixPpa // ignore: cast_nullable_to_non_nullable
              as double,
      qte: null == qte
          ? _value.qte
          : qte // ignore: cast_nullable_to_non_nullable
              as double,
      prixPh: null == prixPh
          ? _value.prixPh
          : prixPh // ignore: cast_nullable_to_non_nullable
              as double,
      txRistourne: freezed == txRistourne
          ? _value.txRistourne
          : txRistourne // ignore: cast_nullable_to_non_nullable
              as double?,
      montant: freezed == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemImpl implements _CartItem {
  const _$CartItemImpl(
      {@JsonKey(name: 'cpsCmpId') required this.cpsCmpId,
      @JsonKey(name: 'cpsTerId') required this.cpsTerId,
      @JsonKey(name: 'cpsTerType') required this.cpsTerType,
      @JsonKey(name: 'no') required this.no,
      @JsonKey(name: 'commercialName') required this.commercialName,
      @JsonKey(name: 'datePeremption') required this.datePeremption,
      @JsonKey(name: 'prixPpa') required this.prixPpa,
      @JsonKey(name: 'qte') required this.qte,
      @JsonKey(name: 'prixPh') required this.prixPh,
      @JsonKey(name: 'txRistourne') this.txRistourne,
      @JsonKey(name: 'montant') this.montant});

  factory _$CartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemImplFromJson(json);

  @override
  @JsonKey(name: 'cpsCmpId')
  final int cpsCmpId;
  @override
  @JsonKey(name: 'cpsTerId')
  final int cpsTerId;
  @override
  @JsonKey(name: 'cpsTerType')
  final String cpsTerType;
  @override
  @JsonKey(name: 'no')
  final int no;
  @override
  @JsonKey(name: 'commercialName')
  final String commercialName;
  @override
  @JsonKey(name: 'datePeremption')
  final DateTime datePeremption;
  @override
  @JsonKey(name: 'prixPpa')
  final double prixPpa;
  @override
  @JsonKey(name: 'qte')
  final double qte;
  @override
  @JsonKey(name: 'prixPh')
  final double prixPh;
  @override
  @JsonKey(name: 'txRistourne')
  final double? txRistourne;
  @override
  @JsonKey(name: 'montant')
  final num? montant;

  @override
  String toString() {
    return 'CartItem(cpsCmpId: $cpsCmpId, cpsTerId: $cpsTerId, cpsTerType: $cpsTerType, no: $no, commercialName: $commercialName, datePeremption: $datePeremption, prixPpa: $prixPpa, qte: $qte, prixPh: $prixPh, txRistourne: $txRistourne, montant: $montant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.cpsCmpId, cpsCmpId) ||
                other.cpsCmpId == cpsCmpId) &&
            (identical(other.cpsTerId, cpsTerId) ||
                other.cpsTerId == cpsTerId) &&
            (identical(other.cpsTerType, cpsTerType) ||
                other.cpsTerType == cpsTerType) &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.commercialName, commercialName) ||
                other.commercialName == commercialName) &&
            (identical(other.datePeremption, datePeremption) ||
                other.datePeremption == datePeremption) &&
            (identical(other.prixPpa, prixPpa) || other.prixPpa == prixPpa) &&
            (identical(other.qte, qte) || other.qte == qte) &&
            (identical(other.prixPh, prixPh) || other.prixPh == prixPh) &&
            (identical(other.txRistourne, txRistourne) ||
                other.txRistourne == txRistourne) &&
            (identical(other.montant, montant) || other.montant == montant));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      cpsCmpId,
      cpsTerId,
      cpsTerType,
      no,
      commercialName,
      datePeremption,
      prixPpa,
      qte,
      prixPh,
      txRistourne,
      montant);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemImplToJson(
      this,
    );
  }
}

abstract class _CartItem implements CartItem {
  const factory _CartItem(
      {@JsonKey(name: 'cpsCmpId') required final int cpsCmpId,
      @JsonKey(name: 'cpsTerId') required final int cpsTerId,
      @JsonKey(name: 'cpsTerType') required final String cpsTerType,
      @JsonKey(name: 'no') required final int no,
      @JsonKey(name: 'commercialName') required final String commercialName,
      @JsonKey(name: 'datePeremption') required final DateTime datePeremption,
      @JsonKey(name: 'prixPpa') required final double prixPpa,
      @JsonKey(name: 'qte') required final double qte,
      @JsonKey(name: 'prixPh') required final double prixPh,
      @JsonKey(name: 'txRistourne') final double? txRistourne,
      @JsonKey(name: 'montant') final num? montant}) = _$CartItemImpl;

  factory _CartItem.fromJson(Map<String, dynamic> json) =
      _$CartItemImpl.fromJson;

  @override
  @JsonKey(name: 'cpsCmpId')
  int get cpsCmpId;
  @override
  @JsonKey(name: 'cpsTerId')
  int get cpsTerId;
  @override
  @JsonKey(name: 'cpsTerType')
  String get cpsTerType;
  @override
  @JsonKey(name: 'no')
  int get no;
  @override
  @JsonKey(name: 'commercialName')
  String get commercialName;
  @override
  @JsonKey(name: 'datePeremption')
  DateTime get datePeremption;
  @override
  @JsonKey(name: 'prixPpa')
  double get prixPpa;
  @override
  @JsonKey(name: 'qte')
  double get qte;
  @override
  @JsonKey(name: 'prixPh')
  double get prixPh;
  @override
  @JsonKey(name: 'txRistourne')
  double? get txRistourne;
  @override
  @JsonKey(name: 'montant')
  num? get montant;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
