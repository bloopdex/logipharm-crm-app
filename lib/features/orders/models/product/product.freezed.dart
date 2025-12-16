// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @JsonKey(name: 'cmpId')
  int get cmpId => throw _privateConstructorUsedError;
  @JsonKey(name: 'prdId')
  int get prdId => throw _privateConstructorUsedError;
  @JsonKey(name: 'medId')
  int get medId => throw _privateConstructorUsedError;
  @JsonKey(name: 'stkCode')
  String get stkCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'commercialName')
  String get commercialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'attribut2')
  String? get attribut2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'nlot')
  String get nlot => throw _privateConstructorUsedError;
  @JsonKey(name: 'datePeremption')
  DateTime get datePeremption => throw _privateConstructorUsedError;
  @JsonKey(name: 'prixPpa')
  double get prixPpa => throw _privateConstructorUsedError;
  @JsonKey(name: 'qte')
  double get qte => throw _privateConstructorUsedError;
  @JsonKey(name: 'prixPh')
  double get prixPh => throw _privateConstructorUsedError;
  @JsonKey(name: 'prixGr')
  int? get prixGr => throw _privateConstructorUsedError;
  @JsonKey(name: 'prixShp')
  double get prixShp => throw _privateConstructorUsedError;
  @JsonKey(name: 'ugVnete')
  double? get ugVnete => throw _privateConstructorUsedError;
  @JsonKey(name: 'etatFlag')
  bool? get etatFlag => throw _privateConstructorUsedError;
  @JsonKey(name: 'creerDate')
  DateTime get creerDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'colis')
  double? get colis => throw _privateConstructorUsedError;
  @JsonKey(name: 'objectif')
  double? get objectif => throw _privateConstructorUsedError;
  @JsonKey(name: 'laboratoire')
  String? get laboratoire => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cmpId') int cmpId,
      @JsonKey(name: 'prdId') int prdId,
      @JsonKey(name: 'medId') int medId,
      @JsonKey(name: 'stkCode') String stkCode,
      @JsonKey(name: 'commercialName') String commercialName,
      @JsonKey(name: 'attribut2') String? attribut2,
      @JsonKey(name: 'nlot') String nlot,
      @JsonKey(name: 'datePeremption') DateTime datePeremption,
      @JsonKey(name: 'prixPpa') double prixPpa,
      @JsonKey(name: 'qte') double qte,
      @JsonKey(name: 'prixPh') double prixPh,
      @JsonKey(name: 'prixGr') int? prixGr,
      @JsonKey(name: 'prixShp') double prixShp,
      @JsonKey(name: 'ugVnete') double? ugVnete,
      @JsonKey(name: 'etatFlag') bool? etatFlag,
      @JsonKey(name: 'creerDate') DateTime creerDate,
      @JsonKey(name: 'colis') double? colis,
      @JsonKey(name: 'objectif') double? objectif,
      @JsonKey(name: 'laboratoire') String? laboratoire});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cmpId = null,
    Object? prdId = null,
    Object? medId = null,
    Object? stkCode = null,
    Object? commercialName = null,
    Object? attribut2 = freezed,
    Object? nlot = null,
    Object? datePeremption = null,
    Object? prixPpa = null,
    Object? qte = null,
    Object? prixPh = null,
    Object? prixGr = freezed,
    Object? prixShp = null,
    Object? ugVnete = freezed,
    Object? etatFlag = freezed,
    Object? creerDate = null,
    Object? colis = freezed,
    Object? objectif = freezed,
    Object? laboratoire = freezed,
  }) {
    return _then(_value.copyWith(
      cmpId: null == cmpId
          ? _value.cmpId
          : cmpId // ignore: cast_nullable_to_non_nullable
              as int,
      prdId: null == prdId
          ? _value.prdId
          : prdId // ignore: cast_nullable_to_non_nullable
              as int,
      medId: null == medId
          ? _value.medId
          : medId // ignore: cast_nullable_to_non_nullable
              as int,
      stkCode: null == stkCode
          ? _value.stkCode
          : stkCode // ignore: cast_nullable_to_non_nullable
              as String,
      commercialName: null == commercialName
          ? _value.commercialName
          : commercialName // ignore: cast_nullable_to_non_nullable
              as String,
      attribut2: freezed == attribut2
          ? _value.attribut2
          : attribut2 // ignore: cast_nullable_to_non_nullable
              as String?,
      nlot: null == nlot
          ? _value.nlot
          : nlot // ignore: cast_nullable_to_non_nullable
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
      prixGr: freezed == prixGr
          ? _value.prixGr
          : prixGr // ignore: cast_nullable_to_non_nullable
              as int?,
      prixShp: null == prixShp
          ? _value.prixShp
          : prixShp // ignore: cast_nullable_to_non_nullable
              as double,
      ugVnete: freezed == ugVnete
          ? _value.ugVnete
          : ugVnete // ignore: cast_nullable_to_non_nullable
              as double?,
      etatFlag: freezed == etatFlag
          ? _value.etatFlag
          : etatFlag // ignore: cast_nullable_to_non_nullable
              as bool?,
      creerDate: null == creerDate
          ? _value.creerDate
          : creerDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      colis: freezed == colis
          ? _value.colis
          : colis // ignore: cast_nullable_to_non_nullable
              as double?,
      objectif: freezed == objectif
          ? _value.objectif
          : objectif // ignore: cast_nullable_to_non_nullable
              as double?,
      laboratoire: freezed == laboratoire
          ? _value.laboratoire
          : laboratoire // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cmpId') int cmpId,
      @JsonKey(name: 'prdId') int prdId,
      @JsonKey(name: 'medId') int medId,
      @JsonKey(name: 'stkCode') String stkCode,
      @JsonKey(name: 'commercialName') String commercialName,
      @JsonKey(name: 'attribut2') String? attribut2,
      @JsonKey(name: 'nlot') String nlot,
      @JsonKey(name: 'datePeremption') DateTime datePeremption,
      @JsonKey(name: 'prixPpa') double prixPpa,
      @JsonKey(name: 'qte') double qte,
      @JsonKey(name: 'prixPh') double prixPh,
      @JsonKey(name: 'prixGr') int? prixGr,
      @JsonKey(name: 'prixShp') double prixShp,
      @JsonKey(name: 'ugVnete') double? ugVnete,
      @JsonKey(name: 'etatFlag') bool? etatFlag,
      @JsonKey(name: 'creerDate') DateTime creerDate,
      @JsonKey(name: 'colis') double? colis,
      @JsonKey(name: 'objectif') double? objectif,
      @JsonKey(name: 'laboratoire') String? laboratoire});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cmpId = null,
    Object? prdId = null,
    Object? medId = null,
    Object? stkCode = null,
    Object? commercialName = null,
    Object? attribut2 = freezed,
    Object? nlot = null,
    Object? datePeremption = null,
    Object? prixPpa = null,
    Object? qte = null,
    Object? prixPh = null,
    Object? prixGr = freezed,
    Object? prixShp = null,
    Object? ugVnete = freezed,
    Object? etatFlag = freezed,
    Object? creerDate = null,
    Object? colis = freezed,
    Object? objectif = freezed,
    Object? laboratoire = freezed,
  }) {
    return _then(_$ProductImpl(
      cmpId: null == cmpId
          ? _value.cmpId
          : cmpId // ignore: cast_nullable_to_non_nullable
              as int,
      prdId: null == prdId
          ? _value.prdId
          : prdId // ignore: cast_nullable_to_non_nullable
              as int,
      medId: null == medId
          ? _value.medId
          : medId // ignore: cast_nullable_to_non_nullable
              as int,
      stkCode: null == stkCode
          ? _value.stkCode
          : stkCode // ignore: cast_nullable_to_non_nullable
              as String,
      commercialName: null == commercialName
          ? _value.commercialName
          : commercialName // ignore: cast_nullable_to_non_nullable
              as String,
      attribut2: freezed == attribut2
          ? _value.attribut2
          : attribut2 // ignore: cast_nullable_to_non_nullable
              as String?,
      nlot: null == nlot
          ? _value.nlot
          : nlot // ignore: cast_nullable_to_non_nullable
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
      prixGr: freezed == prixGr
          ? _value.prixGr
          : prixGr // ignore: cast_nullable_to_non_nullable
              as int?,
      prixShp: null == prixShp
          ? _value.prixShp
          : prixShp // ignore: cast_nullable_to_non_nullable
              as double,
      ugVnete: freezed == ugVnete
          ? _value.ugVnete
          : ugVnete // ignore: cast_nullable_to_non_nullable
              as double?,
      etatFlag: freezed == etatFlag
          ? _value.etatFlag
          : etatFlag // ignore: cast_nullable_to_non_nullable
              as bool?,
      creerDate: null == creerDate
          ? _value.creerDate
          : creerDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      colis: freezed == colis
          ? _value.colis
          : colis // ignore: cast_nullable_to_non_nullable
              as double?,
      objectif: freezed == objectif
          ? _value.objectif
          : objectif // ignore: cast_nullable_to_non_nullable
              as double?,
      laboratoire: freezed == laboratoire
          ? _value.laboratoire
          : laboratoire // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {@JsonKey(name: 'cmpId') required this.cmpId,
      @JsonKey(name: 'prdId') required this.prdId,
      @JsonKey(name: 'medId') required this.medId,
      @JsonKey(name: 'stkCode') required this.stkCode,
      @JsonKey(name: 'commercialName') required this.commercialName,
      @JsonKey(name: 'attribut2') this.attribut2,
      @JsonKey(name: 'nlot') required this.nlot,
      @JsonKey(name: 'datePeremption') required this.datePeremption,
      @JsonKey(name: 'prixPpa') required this.prixPpa,
      @JsonKey(name: 'qte') required this.qte,
      @JsonKey(name: 'prixPh') required this.prixPh,
      @JsonKey(name: 'prixGr') this.prixGr,
      @JsonKey(name: 'prixShp') required this.prixShp,
      @JsonKey(name: 'ugVnete') this.ugVnete,
      @JsonKey(name: 'etatFlag') this.etatFlag,
      @JsonKey(name: 'creerDate') required this.creerDate,
      @JsonKey(name: 'colis') this.colis,
      @JsonKey(name: 'objectif') this.objectif,
      @JsonKey(name: 'laboratoire') this.laboratoire});

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey(name: 'cmpId')
  final int cmpId;
  @override
  @JsonKey(name: 'prdId')
  final int prdId;
  @override
  @JsonKey(name: 'medId')
  final int medId;
  @override
  @JsonKey(name: 'stkCode')
  final String stkCode;
  @override
  @JsonKey(name: 'commercialName')
  final String commercialName;
  @override
  @JsonKey(name: 'attribut2')
  final String? attribut2;
  @override
  @JsonKey(name: 'nlot')
  final String nlot;
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
  @JsonKey(name: 'prixGr')
  final int? prixGr;
  @override
  @JsonKey(name: 'prixShp')
  final double prixShp;
  @override
  @JsonKey(name: 'ugVnete')
  final double? ugVnete;
  @override
  @JsonKey(name: 'etatFlag')
  final bool? etatFlag;
  @override
  @JsonKey(name: 'creerDate')
  final DateTime creerDate;
  @override
  @JsonKey(name: 'colis')
  final double? colis;
  @override
  @JsonKey(name: 'objectif')
  final double? objectif;
  @override
  @JsonKey(name: 'laboratoire')
  final String? laboratoire;

  @override
  String toString() {
    return 'Product(cmpId: $cmpId, prdId: $prdId, medId: $medId, stkCode: $stkCode, commercialName: $commercialName, attribut2: $attribut2, nlot: $nlot, datePeremption: $datePeremption, prixPpa: $prixPpa, qte: $qte, prixPh: $prixPh, prixGr: $prixGr, prixShp: $prixShp, ugVnete: $ugVnete, etatFlag: $etatFlag, creerDate: $creerDate, colis: $colis, objectif: $objectif, laboratoire: $laboratoire)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.cmpId, cmpId) || other.cmpId == cmpId) &&
            (identical(other.prdId, prdId) || other.prdId == prdId) &&
            (identical(other.medId, medId) || other.medId == medId) &&
            (identical(other.stkCode, stkCode) || other.stkCode == stkCode) &&
            (identical(other.commercialName, commercialName) ||
                other.commercialName == commercialName) &&
            (identical(other.attribut2, attribut2) ||
                other.attribut2 == attribut2) &&
            (identical(other.nlot, nlot) || other.nlot == nlot) &&
            (identical(other.datePeremption, datePeremption) ||
                other.datePeremption == datePeremption) &&
            (identical(other.prixPpa, prixPpa) || other.prixPpa == prixPpa) &&
            (identical(other.qte, qte) || other.qte == qte) &&
            (identical(other.prixPh, prixPh) || other.prixPh == prixPh) &&
            (identical(other.prixGr, prixGr) || other.prixGr == prixGr) &&
            (identical(other.prixShp, prixShp) || other.prixShp == prixShp) &&
            (identical(other.ugVnete, ugVnete) || other.ugVnete == ugVnete) &&
            (identical(other.etatFlag, etatFlag) ||
                other.etatFlag == etatFlag) &&
            (identical(other.creerDate, creerDate) ||
                other.creerDate == creerDate) &&
            (identical(other.colis, colis) || other.colis == colis) &&
            (identical(other.objectif, objectif) ||
                other.objectif == objectif) &&
            (identical(other.laboratoire, laboratoire) ||
                other.laboratoire == laboratoire));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        cmpId,
        prdId,
        medId,
        stkCode,
        commercialName,
        attribut2,
        nlot,
        datePeremption,
        prixPpa,
        qte,
        prixPh,
        prixGr,
        prixShp,
        ugVnete,
        etatFlag,
        creerDate,
        colis,
        objectif,
        laboratoire
      ]);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {@JsonKey(name: 'cmpId') required final int cmpId,
      @JsonKey(name: 'prdId') required final int prdId,
      @JsonKey(name: 'medId') required final int medId,
      @JsonKey(name: 'stkCode') required final String stkCode,
      @JsonKey(name: 'commercialName') required final String commercialName,
      @JsonKey(name: 'attribut2') final String? attribut2,
      @JsonKey(name: 'nlot') required final String nlot,
      @JsonKey(name: 'datePeremption') required final DateTime datePeremption,
      @JsonKey(name: 'prixPpa') required final double prixPpa,
      @JsonKey(name: 'qte') required final double qte,
      @JsonKey(name: 'prixPh') required final double prixPh,
      @JsonKey(name: 'prixGr') final int? prixGr,
      @JsonKey(name: 'prixShp') required final double prixShp,
      @JsonKey(name: 'ugVnete') final double? ugVnete,
      @JsonKey(name: 'etatFlag') final bool? etatFlag,
      @JsonKey(name: 'creerDate') required final DateTime creerDate,
      @JsonKey(name: 'colis') final double? colis,
      @JsonKey(name: 'objectif') final double? objectif,
      @JsonKey(name: 'laboratoire') final String? laboratoire}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  @JsonKey(name: 'cmpId')
  int get cmpId;
  @override
  @JsonKey(name: 'prdId')
  int get prdId;
  @override
  @JsonKey(name: 'medId')
  int get medId;
  @override
  @JsonKey(name: 'stkCode')
  String get stkCode;
  @override
  @JsonKey(name: 'commercialName')
  String get commercialName;
  @override
  @JsonKey(name: 'attribut2')
  String? get attribut2;
  @override
  @JsonKey(name: 'nlot')
  String get nlot;
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
  @JsonKey(name: 'prixGr')
  int? get prixGr;
  @override
  @JsonKey(name: 'prixShp')
  double get prixShp;
  @override
  @JsonKey(name: 'ugVnete')
  double? get ugVnete;
  @override
  @JsonKey(name: 'etatFlag')
  bool? get etatFlag;
  @override
  @JsonKey(name: 'creerDate')
  DateTime get creerDate;
  @override
  @JsonKey(name: 'colis')
  double? get colis;
  @override
  @JsonKey(name: 'objectif')
  double? get objectif;
  @override
  @JsonKey(name: 'laboratoire')
  String? get laboratoire;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
