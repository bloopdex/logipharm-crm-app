// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) {
  return _OrderDetail.fromJson(json);
}

/// @nodoc
mixin _$OrderDetail {
  @JsonKey(name: 'companyId')
  int get companyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderId')
  int get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderType')
  String get orderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'stockCode')
  String get stockCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'reference')
  String get reference => throw _privateConstructorUsedError;
  @JsonKey(name: 'codeStatut')
  int get codeStatut => throw _privateConstructorUsedError;
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
  String get delegue => throw _privateConstructorUsedError;
  @JsonKey(name: 'medId')
  int get medId => throw _privateConstructorUsedError;
  @JsonKey(name: 'medAmm')
  String get medAmm => throw _privateConstructorUsedError;
  @JsonKey(name: 'medCommercialName')
  String get medCommercialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'lot')
  String get lot => throw _privateConstructorUsedError;
  @JsonKey(name: 'datePeremption')
  DateTime get datePeremption => throw _privateConstructorUsedError;
  @JsonKey(name: 'prixPpa')
  double get prixPpa => throw _privateConstructorUsedError;
  @JsonKey(name: 'prixPh')
  double get prixPh => throw _privateConstructorUsedError;
  @JsonKey(name: 'qte')
  double get qte => throw _privateConstructorUsedError;
  @JsonKey(name: 'netHt')
  int get netHt => throw _privateConstructorUsedError;
  @JsonKey(name: 'montTva')
  int get montTva => throw _privateConstructorUsedError;
  @JsonKey(name: 'montTtc')
  double get montTtc => throw _privateConstructorUsedError;

  /// Serializes this OrderDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderDetailCopyWith<OrderDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailCopyWith<$Res> {
  factory $OrderDetailCopyWith(
          OrderDetail value, $Res Function(OrderDetail) then) =
      _$OrderDetailCopyWithImpl<$Res, OrderDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'companyId') int companyId,
      @JsonKey(name: 'orderId') int orderId,
      @JsonKey(name: 'orderType') String orderType,
      @JsonKey(name: 'stockCode') String stockCode,
      @JsonKey(name: 'date') DateTime date,
      @JsonKey(name: 'reference') String reference,
      @JsonKey(name: 'codeStatut') int codeStatut,
      @JsonKey(name: 'statut') String statut,
      @JsonKey(name: 'terId') int terId,
      @JsonKey(name: 'fournisseurId') int fournisseurId,
      @JsonKey(name: 'fournisseurType') String fournisseurType,
      @JsonKey(name: 'client') String client,
      @JsonKey(name: 'delegue') String delegue,
      @JsonKey(name: 'medId') int medId,
      @JsonKey(name: 'medAmm') String medAmm,
      @JsonKey(name: 'medCommercialName') String medCommercialName,
      @JsonKey(name: 'lot') String lot,
      @JsonKey(name: 'datePeremption') DateTime datePeremption,
      @JsonKey(name: 'prixPpa') double prixPpa,
      @JsonKey(name: 'prixPh') double prixPh,
      @JsonKey(name: 'qte') double qte,
      @JsonKey(name: 'netHt') int netHt,
      @JsonKey(name: 'montTva') int montTva,
      @JsonKey(name: 'montTtc') double montTtc});
}

/// @nodoc
class _$OrderDetailCopyWithImpl<$Res, $Val extends OrderDetail>
    implements $OrderDetailCopyWith<$Res> {
  _$OrderDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = null,
    Object? orderId = null,
    Object? orderType = null,
    Object? stockCode = null,
    Object? date = null,
    Object? reference = null,
    Object? codeStatut = null,
    Object? statut = null,
    Object? terId = null,
    Object? fournisseurId = null,
    Object? fournisseurType = null,
    Object? client = null,
    Object? delegue = null,
    Object? medId = null,
    Object? medAmm = null,
    Object? medCommercialName = null,
    Object? lot = null,
    Object? datePeremption = null,
    Object? prixPpa = null,
    Object? prixPh = null,
    Object? qte = null,
    Object? netHt = null,
    Object? montTva = null,
    Object? montTtc = null,
  }) {
    return _then(_value.copyWith(
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
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
      codeStatut: null == codeStatut
          ? _value.codeStatut
          : codeStatut // ignore: cast_nullable_to_non_nullable
              as int,
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
      delegue: null == delegue
          ? _value.delegue
          : delegue // ignore: cast_nullable_to_non_nullable
              as String,
      medId: null == medId
          ? _value.medId
          : medId // ignore: cast_nullable_to_non_nullable
              as int,
      medAmm: null == medAmm
          ? _value.medAmm
          : medAmm // ignore: cast_nullable_to_non_nullable
              as String,
      medCommercialName: null == medCommercialName
          ? _value.medCommercialName
          : medCommercialName // ignore: cast_nullable_to_non_nullable
              as String,
      lot: null == lot
          ? _value.lot
          : lot // ignore: cast_nullable_to_non_nullable
              as String,
      datePeremption: null == datePeremption
          ? _value.datePeremption
          : datePeremption // ignore: cast_nullable_to_non_nullable
              as DateTime,
      prixPpa: null == prixPpa
          ? _value.prixPpa
          : prixPpa // ignore: cast_nullable_to_non_nullable
              as double,
      prixPh: null == prixPh
          ? _value.prixPh
          : prixPh // ignore: cast_nullable_to_non_nullable
              as double,
      qte: null == qte
          ? _value.qte
          : qte // ignore: cast_nullable_to_non_nullable
              as double,
      netHt: null == netHt
          ? _value.netHt
          : netHt // ignore: cast_nullable_to_non_nullable
              as int,
      montTva: null == montTva
          ? _value.montTva
          : montTva // ignore: cast_nullable_to_non_nullable
              as int,
      montTtc: null == montTtc
          ? _value.montTtc
          : montTtc // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderDetailImplCopyWith<$Res>
    implements $OrderDetailCopyWith<$Res> {
  factory _$$OrderDetailImplCopyWith(
          _$OrderDetailImpl value, $Res Function(_$OrderDetailImpl) then) =
      __$$OrderDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'companyId') int companyId,
      @JsonKey(name: 'orderId') int orderId,
      @JsonKey(name: 'orderType') String orderType,
      @JsonKey(name: 'stockCode') String stockCode,
      @JsonKey(name: 'date') DateTime date,
      @JsonKey(name: 'reference') String reference,
      @JsonKey(name: 'codeStatut') int codeStatut,
      @JsonKey(name: 'statut') String statut,
      @JsonKey(name: 'terId') int terId,
      @JsonKey(name: 'fournisseurId') int fournisseurId,
      @JsonKey(name: 'fournisseurType') String fournisseurType,
      @JsonKey(name: 'client') String client,
      @JsonKey(name: 'delegue') String delegue,
      @JsonKey(name: 'medId') int medId,
      @JsonKey(name: 'medAmm') String medAmm,
      @JsonKey(name: 'medCommercialName') String medCommercialName,
      @JsonKey(name: 'lot') String lot,
      @JsonKey(name: 'datePeremption') DateTime datePeremption,
      @JsonKey(name: 'prixPpa') double prixPpa,
      @JsonKey(name: 'prixPh') double prixPh,
      @JsonKey(name: 'qte') double qte,
      @JsonKey(name: 'netHt') int netHt,
      @JsonKey(name: 'montTva') int montTva,
      @JsonKey(name: 'montTtc') double montTtc});
}

/// @nodoc
class __$$OrderDetailImplCopyWithImpl<$Res>
    extends _$OrderDetailCopyWithImpl<$Res, _$OrderDetailImpl>
    implements _$$OrderDetailImplCopyWith<$Res> {
  __$$OrderDetailImplCopyWithImpl(
      _$OrderDetailImpl _value, $Res Function(_$OrderDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = null,
    Object? orderId = null,
    Object? orderType = null,
    Object? stockCode = null,
    Object? date = null,
    Object? reference = null,
    Object? codeStatut = null,
    Object? statut = null,
    Object? terId = null,
    Object? fournisseurId = null,
    Object? fournisseurType = null,
    Object? client = null,
    Object? delegue = null,
    Object? medId = null,
    Object? medAmm = null,
    Object? medCommercialName = null,
    Object? lot = null,
    Object? datePeremption = null,
    Object? prixPpa = null,
    Object? prixPh = null,
    Object? qte = null,
    Object? netHt = null,
    Object? montTva = null,
    Object? montTtc = null,
  }) {
    return _then(_$OrderDetailImpl(
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
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
      codeStatut: null == codeStatut
          ? _value.codeStatut
          : codeStatut // ignore: cast_nullable_to_non_nullable
              as int,
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
      delegue: null == delegue
          ? _value.delegue
          : delegue // ignore: cast_nullable_to_non_nullable
              as String,
      medId: null == medId
          ? _value.medId
          : medId // ignore: cast_nullable_to_non_nullable
              as int,
      medAmm: null == medAmm
          ? _value.medAmm
          : medAmm // ignore: cast_nullable_to_non_nullable
              as String,
      medCommercialName: null == medCommercialName
          ? _value.medCommercialName
          : medCommercialName // ignore: cast_nullable_to_non_nullable
              as String,
      lot: null == lot
          ? _value.lot
          : lot // ignore: cast_nullable_to_non_nullable
              as String,
      datePeremption: null == datePeremption
          ? _value.datePeremption
          : datePeremption // ignore: cast_nullable_to_non_nullable
              as DateTime,
      prixPpa: null == prixPpa
          ? _value.prixPpa
          : prixPpa // ignore: cast_nullable_to_non_nullable
              as double,
      prixPh: null == prixPh
          ? _value.prixPh
          : prixPh // ignore: cast_nullable_to_non_nullable
              as double,
      qte: null == qte
          ? _value.qte
          : qte // ignore: cast_nullable_to_non_nullable
              as double,
      netHt: null == netHt
          ? _value.netHt
          : netHt // ignore: cast_nullable_to_non_nullable
              as int,
      montTva: null == montTva
          ? _value.montTva
          : montTva // ignore: cast_nullable_to_non_nullable
              as int,
      montTtc: null == montTtc
          ? _value.montTtc
          : montTtc // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderDetailImpl implements _OrderDetail {
  const _$OrderDetailImpl(
      {@JsonKey(name: 'companyId') required this.companyId,
      @JsonKey(name: 'orderId') required this.orderId,
      @JsonKey(name: 'orderType') required this.orderType,
      @JsonKey(name: 'stockCode') required this.stockCode,
      @JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'reference') required this.reference,
      @JsonKey(name: 'codeStatut') required this.codeStatut,
      @JsonKey(name: 'statut') required this.statut,
      @JsonKey(name: 'terId') required this.terId,
      @JsonKey(name: 'fournisseurId') required this.fournisseurId,
      @JsonKey(name: 'fournisseurType') required this.fournisseurType,
      @JsonKey(name: 'client') required this.client,
      @JsonKey(name: 'delegue') required this.delegue,
      @JsonKey(name: 'medId') required this.medId,
      @JsonKey(name: 'medAmm') required this.medAmm,
      @JsonKey(name: 'medCommercialName') required this.medCommercialName,
      @JsonKey(name: 'lot') required this.lot,
      @JsonKey(name: 'datePeremption') required this.datePeremption,
      @JsonKey(name: 'prixPpa') required this.prixPpa,
      @JsonKey(name: 'prixPh') required this.prixPh,
      @JsonKey(name: 'qte') required this.qte,
      @JsonKey(name: 'netHt') required this.netHt,
      @JsonKey(name: 'montTva') required this.montTva,
      @JsonKey(name: 'montTtc') required this.montTtc});

  factory _$OrderDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDetailImplFromJson(json);

  @override
  @JsonKey(name: 'companyId')
  final int companyId;
  @override
  @JsonKey(name: 'orderId')
  final int orderId;
  @override
  @JsonKey(name: 'orderType')
  final String orderType;
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
  @JsonKey(name: 'codeStatut')
  final int codeStatut;
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
  final String delegue;
  @override
  @JsonKey(name: 'medId')
  final int medId;
  @override
  @JsonKey(name: 'medAmm')
  final String medAmm;
  @override
  @JsonKey(name: 'medCommercialName')
  final String medCommercialName;
  @override
  @JsonKey(name: 'lot')
  final String lot;
  @override
  @JsonKey(name: 'datePeremption')
  final DateTime datePeremption;
  @override
  @JsonKey(name: 'prixPpa')
  final double prixPpa;
  @override
  @JsonKey(name: 'prixPh')
  final double prixPh;
  @override
  @JsonKey(name: 'qte')
  final double qte;
  @override
  @JsonKey(name: 'netHt')
  final int netHt;
  @override
  @JsonKey(name: 'montTva')
  final int montTva;
  @override
  @JsonKey(name: 'montTtc')
  final double montTtc;

  @override
  String toString() {
    return 'OrderDetail(companyId: $companyId, orderId: $orderId, orderType: $orderType, stockCode: $stockCode, date: $date, reference: $reference, codeStatut: $codeStatut, statut: $statut, terId: $terId, fournisseurId: $fournisseurId, fournisseurType: $fournisseurType, client: $client, delegue: $delegue, medId: $medId, medAmm: $medAmm, medCommercialName: $medCommercialName, lot: $lot, datePeremption: $datePeremption, prixPpa: $prixPpa, prixPh: $prixPh, qte: $qte, netHt: $netHt, montTva: $montTva, montTtc: $montTtc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailImpl &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.stockCode, stockCode) ||
                other.stockCode == stockCode) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.codeStatut, codeStatut) ||
                other.codeStatut == codeStatut) &&
            (identical(other.statut, statut) || other.statut == statut) &&
            (identical(other.terId, terId) || other.terId == terId) &&
            (identical(other.fournisseurId, fournisseurId) ||
                other.fournisseurId == fournisseurId) &&
            (identical(other.fournisseurType, fournisseurType) ||
                other.fournisseurType == fournisseurType) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.delegue, delegue) || other.delegue == delegue) &&
            (identical(other.medId, medId) || other.medId == medId) &&
            (identical(other.medAmm, medAmm) || other.medAmm == medAmm) &&
            (identical(other.medCommercialName, medCommercialName) ||
                other.medCommercialName == medCommercialName) &&
            (identical(other.lot, lot) || other.lot == lot) &&
            (identical(other.datePeremption, datePeremption) ||
                other.datePeremption == datePeremption) &&
            (identical(other.prixPpa, prixPpa) || other.prixPpa == prixPpa) &&
            (identical(other.prixPh, prixPh) || other.prixPh == prixPh) &&
            (identical(other.qte, qte) || other.qte == qte) &&
            (identical(other.netHt, netHt) || other.netHt == netHt) &&
            (identical(other.montTva, montTva) || other.montTva == montTva) &&
            (identical(other.montTtc, montTtc) || other.montTtc == montTtc));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        companyId,
        orderId,
        orderType,
        stockCode,
        date,
        reference,
        codeStatut,
        statut,
        terId,
        fournisseurId,
        fournisseurType,
        client,
        delegue,
        medId,
        medAmm,
        medCommercialName,
        lot,
        datePeremption,
        prixPpa,
        prixPh,
        qte,
        netHt,
        montTva,
        montTtc
      ]);

  /// Create a copy of OrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailImplCopyWith<_$OrderDetailImpl> get copyWith =>
      __$$OrderDetailImplCopyWithImpl<_$OrderDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDetailImplToJson(
      this,
    );
  }
}

abstract class _OrderDetail implements OrderDetail {
  const factory _OrderDetail(
      {@JsonKey(name: 'companyId') required final int companyId,
      @JsonKey(name: 'orderId') required final int orderId,
      @JsonKey(name: 'orderType') required final String orderType,
      @JsonKey(name: 'stockCode') required final String stockCode,
      @JsonKey(name: 'date') required final DateTime date,
      @JsonKey(name: 'reference') required final String reference,
      @JsonKey(name: 'codeStatut') required final int codeStatut,
      @JsonKey(name: 'statut') required final String statut,
      @JsonKey(name: 'terId') required final int terId,
      @JsonKey(name: 'fournisseurId') required final int fournisseurId,
      @JsonKey(name: 'fournisseurType') required final String fournisseurType,
      @JsonKey(name: 'client') required final String client,
      @JsonKey(name: 'delegue') required final String delegue,
      @JsonKey(name: 'medId') required final int medId,
      @JsonKey(name: 'medAmm') required final String medAmm,
      @JsonKey(name: 'medCommercialName')
      required final String medCommercialName,
      @JsonKey(name: 'lot') required final String lot,
      @JsonKey(name: 'datePeremption') required final DateTime datePeremption,
      @JsonKey(name: 'prixPpa') required final double prixPpa,
      @JsonKey(name: 'prixPh') required final double prixPh,
      @JsonKey(name: 'qte') required final double qte,
      @JsonKey(name: 'netHt') required final int netHt,
      @JsonKey(name: 'montTva') required final int montTva,
      @JsonKey(name: 'montTtc')
      required final double montTtc}) = _$OrderDetailImpl;

  factory _OrderDetail.fromJson(Map<String, dynamic> json) =
      _$OrderDetailImpl.fromJson;

  @override
  @JsonKey(name: 'companyId')
  int get companyId;
  @override
  @JsonKey(name: 'orderId')
  int get orderId;
  @override
  @JsonKey(name: 'orderType')
  String get orderType;
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
  @JsonKey(name: 'codeStatut')
  int get codeStatut;
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
  String get delegue;
  @override
  @JsonKey(name: 'medId')
  int get medId;
  @override
  @JsonKey(name: 'medAmm')
  String get medAmm;
  @override
  @JsonKey(name: 'medCommercialName')
  String get medCommercialName;
  @override
  @JsonKey(name: 'lot')
  String get lot;
  @override
  @JsonKey(name: 'datePeremption')
  DateTime get datePeremption;
  @override
  @JsonKey(name: 'prixPpa')
  double get prixPpa;
  @override
  @JsonKey(name: 'prixPh')
  double get prixPh;
  @override
  @JsonKey(name: 'qte')
  double get qte;
  @override
  @JsonKey(name: 'netHt')
  int get netHt;
  @override
  @JsonKey(name: 'montTva')
  int get montTva;
  @override
  @JsonKey(name: 'montTtc')
  double get montTtc;

  /// Create a copy of OrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderDetailImplCopyWith<_$OrderDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
