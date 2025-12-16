// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  @JsonKey(name: 'companyId')
  int get companyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'stockCode')
  String get stockCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'reference')
  String get reference => throw _privateConstructorUsedError;
  @JsonKey(name: 'statut')
  String get statut => throw _privateConstructorUsedError;
  @JsonKey(name: 'terId')
  int get terId => throw _privateConstructorUsedError;
  @JsonKey(name: 'fournisseurId')
  int get fournisseurId => throw _privateConstructorUsedError;
  @JsonKey(name: 'fournisseurType')
  String get fournisseurType => throw _privateConstructorUsedError;
  @JsonKey(name: 'client')
  String get client => throw _privateConstructorUsedError;
  @JsonKey(name: 'delegue')
  String? get delegue => throw _privateConstructorUsedError;
  @JsonKey(name: 'netHt')
  int get netHt => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalTva')
  int get totalTva => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalTtc')
  double get totalTtc => throw _privateConstructorUsedError;

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {@JsonKey(name: 'companyId') int companyId,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'stockCode') String stockCode,
      @JsonKey(name: 'date') DateTime date,
      @JsonKey(name: 'reference') String reference,
      @JsonKey(name: 'statut') String statut,
      @JsonKey(name: 'terId') int terId,
      @JsonKey(name: 'fournisseurId') int fournisseurId,
      @JsonKey(name: 'fournisseurType') String fournisseurType,
      @JsonKey(name: 'client') String client,
      @JsonKey(name: 'delegue') String? delegue,
      @JsonKey(name: 'netHt') int netHt,
      @JsonKey(name: 'totalTva') int totalTva,
      @JsonKey(name: 'totalTtc') double totalTtc});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = null,
    Object? id = null,
    Object? type = null,
    Object? stockCode = null,
    Object? date = null,
    Object? reference = null,
    Object? statut = null,
    Object? terId = null,
    Object? fournisseurId = null,
    Object? fournisseurType = null,
    Object? client = null,
    Object? delegue = freezed,
    Object? netHt = null,
    Object? totalTva = null,
    Object? totalTtc = null,
  }) {
    return _then(_value.copyWith(
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      stockCode: null == stockCode
          ? _value.stockCode
          : stockCode // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      statut: null == statut
          ? _value.statut
          : statut // ignore: cast_nullable_to_non_nullable
              as String,
      terId: null == terId
          ? _value.terId
          : terId // ignore: cast_nullable_to_non_nullable
              as int,
      fournisseurId: null == fournisseurId
          ? _value.fournisseurId
          : fournisseurId // ignore: cast_nullable_to_non_nullable
              as int,
      fournisseurType: null == fournisseurType
          ? _value.fournisseurType
          : fournisseurType // ignore: cast_nullable_to_non_nullable
              as String,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as String,
      delegue: freezed == delegue
          ? _value.delegue
          : delegue // ignore: cast_nullable_to_non_nullable
              as String?,
      netHt: null == netHt
          ? _value.netHt
          : netHt // ignore: cast_nullable_to_non_nullable
              as int,
      totalTva: null == totalTva
          ? _value.totalTva
          : totalTva // ignore: cast_nullable_to_non_nullable
              as int,
      totalTtc: null == totalTtc
          ? _value.totalTtc
          : totalTtc // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'companyId') int companyId,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'stockCode') String stockCode,
      @JsonKey(name: 'date') DateTime date,
      @JsonKey(name: 'reference') String reference,
      @JsonKey(name: 'statut') String statut,
      @JsonKey(name: 'terId') int terId,
      @JsonKey(name: 'fournisseurId') int fournisseurId,
      @JsonKey(name: 'fournisseurType') String fournisseurType,
      @JsonKey(name: 'client') String client,
      @JsonKey(name: 'delegue') String? delegue,
      @JsonKey(name: 'netHt') int netHt,
      @JsonKey(name: 'totalTva') int totalTva,
      @JsonKey(name: 'totalTtc') double totalTtc});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = null,
    Object? id = null,
    Object? type = null,
    Object? stockCode = null,
    Object? date = null,
    Object? reference = null,
    Object? statut = null,
    Object? terId = null,
    Object? fournisseurId = null,
    Object? fournisseurType = null,
    Object? client = null,
    Object? delegue = freezed,
    Object? netHt = null,
    Object? totalTva = null,
    Object? totalTtc = null,
  }) {
    return _then(_$OrderImpl(
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      stockCode: null == stockCode
          ? _value.stockCode
          : stockCode // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      statut: null == statut
          ? _value.statut
          : statut // ignore: cast_nullable_to_non_nullable
              as String,
      terId: null == terId
          ? _value.terId
          : terId // ignore: cast_nullable_to_non_nullable
              as int,
      fournisseurId: null == fournisseurId
          ? _value.fournisseurId
          : fournisseurId // ignore: cast_nullable_to_non_nullable
              as int,
      fournisseurType: null == fournisseurType
          ? _value.fournisseurType
          : fournisseurType // ignore: cast_nullable_to_non_nullable
              as String,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as String,
      delegue: freezed == delegue
          ? _value.delegue
          : delegue // ignore: cast_nullable_to_non_nullable
              as String?,
      netHt: null == netHt
          ? _value.netHt
          : netHt // ignore: cast_nullable_to_non_nullable
              as int,
      totalTva: null == totalTva
          ? _value.totalTva
          : totalTva // ignore: cast_nullable_to_non_nullable
              as int,
      totalTtc: null == totalTtc
          ? _value.totalTtc
          : totalTtc // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl implements _Order {
  const _$OrderImpl(
      {@JsonKey(name: 'companyId') required this.companyId,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'type') required this.type,
      @JsonKey(name: 'stockCode') required this.stockCode,
      @JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'reference') required this.reference,
      @JsonKey(name: 'statut') required this.statut,
      @JsonKey(name: 'terId') required this.terId,
      @JsonKey(name: 'fournisseurId') required this.fournisseurId,
      @JsonKey(name: 'fournisseurType') required this.fournisseurType,
      @JsonKey(name: 'client') required this.client,
      @JsonKey(name: 'delegue') this.delegue,
      @JsonKey(name: 'netHt') required this.netHt,
      @JsonKey(name: 'totalTva') required this.totalTva,
      @JsonKey(name: 'totalTtc') required this.totalTtc});

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  @JsonKey(name: 'companyId')
  final int companyId;
  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey(name: 'stockCode')
  final String stockCode;
  @override
  @JsonKey(name: 'date')
  final DateTime date;
  @override
  @JsonKey(name: 'reference')
  final String reference;
  @override
  @JsonKey(name: 'statut')
  final String statut;
  @override
  @JsonKey(name: 'terId')
  final int terId;
  @override
  @JsonKey(name: 'fournisseurId')
  final int fournisseurId;
  @override
  @JsonKey(name: 'fournisseurType')
  final String fournisseurType;
  @override
  @JsonKey(name: 'client')
  final String client;
  @override
  @JsonKey(name: 'delegue')
  final String? delegue;
  @override
  @JsonKey(name: 'netHt')
  final int netHt;
  @override
  @JsonKey(name: 'totalTva')
  final int totalTva;
  @override
  @JsonKey(name: 'totalTtc')
  final double totalTtc;

  @override
  String toString() {
    return 'Order(companyId: $companyId, id: $id, type: $type, stockCode: $stockCode, date: $date, reference: $reference, statut: $statut, terId: $terId, fournisseurId: $fournisseurId, fournisseurType: $fournisseurType, client: $client, delegue: $delegue, netHt: $netHt, totalTva: $totalTva, totalTtc: $totalTtc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.stockCode, stockCode) ||
                other.stockCode == stockCode) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.statut, statut) || other.statut == statut) &&
            (identical(other.terId, terId) || other.terId == terId) &&
            (identical(other.fournisseurId, fournisseurId) ||
                other.fournisseurId == fournisseurId) &&
            (identical(other.fournisseurType, fournisseurType) ||
                other.fournisseurType == fournisseurType) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.delegue, delegue) || other.delegue == delegue) &&
            (identical(other.netHt, netHt) || other.netHt == netHt) &&
            (identical(other.totalTva, totalTva) ||
                other.totalTva == totalTva) &&
            (identical(other.totalTtc, totalTtc) ||
                other.totalTtc == totalTtc));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      companyId,
      id,
      type,
      stockCode,
      date,
      reference,
      statut,
      terId,
      fournisseurId,
      fournisseurType,
      client,
      delegue,
      netHt,
      totalTva,
      totalTtc);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {@JsonKey(name: 'companyId') required final int companyId,
      @JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'type') required final String type,
      @JsonKey(name: 'stockCode') required final String stockCode,
      @JsonKey(name: 'date') required final DateTime date,
      @JsonKey(name: 'reference') required final String reference,
      @JsonKey(name: 'statut') required final String statut,
      @JsonKey(name: 'terId') required final int terId,
      @JsonKey(name: 'fournisseurId') required final int fournisseurId,
      @JsonKey(name: 'fournisseurType') required final String fournisseurType,
      @JsonKey(name: 'client') required final String client,
      @JsonKey(name: 'delegue') final String? delegue,
      @JsonKey(name: 'netHt') required final int netHt,
      @JsonKey(name: 'totalTva') required final int totalTva,
      @JsonKey(name: 'totalTtc') required final double totalTtc}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  @JsonKey(name: 'companyId')
  int get companyId;
  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(name: 'stockCode')
  String get stockCode;
  @override
  @JsonKey(name: 'date')
  DateTime get date;
  @override
  @JsonKey(name: 'reference')
  String get reference;
  @override
  @JsonKey(name: 'statut')
  String get statut;
  @override
  @JsonKey(name: 'terId')
  int get terId;
  @override
  @JsonKey(name: 'fournisseurId')
  int get fournisseurId;
  @override
  @JsonKey(name: 'fournisseurType')
  String get fournisseurType;
  @override
  @JsonKey(name: 'client')
  String get client;
  @override
  @JsonKey(name: 'delegue')
  String? get delegue;
  @override
  @JsonKey(name: 'netHt')
  int get netHt;
  @override
  @JsonKey(name: 'totalTva')
  int get totalTva;
  @override
  @JsonKey(name: 'totalTtc')
  double get totalTtc;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
