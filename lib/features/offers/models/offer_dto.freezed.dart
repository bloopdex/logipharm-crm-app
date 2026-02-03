// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OfferDto {
  int? get companyId => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  int? get ref => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get labCode => throw _privateConstructorUsedError;
  String? get remarque => throw _privateConstructorUsedError;
  String? get reference => throw _privateConstructorUsedError;
  String? get debut =>
      throw _privateConstructorUsedError; // ISO date (yyyy-MM-dd)
  String? get fin =>
      throw _privateConstructorUsedError; // ISO date (yyyy-MM-dd)
  num? get montant => throw _privateConstructorUsedError;
  num? get montantConsom => throw _privateConstructorUsedError;
  String? get labo => throw _privateConstructorUsedError;
  String? get tiers => throw _privateConstructorUsedError;
  String? get terType => throw _privateConstructorUsedError;
  List<ProductDto>? get products => throw _privateConstructorUsedError;

  /// Create a copy of OfferDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OfferDtoCopyWith<OfferDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferDtoCopyWith<$Res> {
  factory $OfferDtoCopyWith(OfferDto value, $Res Function(OfferDto) then) =
      _$OfferDtoCopyWithImpl<$Res, OfferDto>;
  @useResult
  $Res call(
      {int? companyId,
      int? id,
      int? ref,
      String? type,
      String? labCode,
      String? remarque,
      String? reference,
      String? debut,
      String? fin,
      num? montant,
      num? montantConsom,
      String? labo,
      String? tiers,
      String? terType,
      List<ProductDto>? products});
}

/// @nodoc
class _$OfferDtoCopyWithImpl<$Res, $Val extends OfferDto>
    implements $OfferDtoCopyWith<$Res> {
  _$OfferDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OfferDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = freezed,
    Object? id = freezed,
    Object? ref = freezed,
    Object? type = freezed,
    Object? labCode = freezed,
    Object? remarque = freezed,
    Object? reference = freezed,
    Object? debut = freezed,
    Object? fin = freezed,
    Object? montant = freezed,
    Object? montantConsom = freezed,
    Object? labo = freezed,
    Object? tiers = freezed,
    Object? terType = freezed,
    Object? products = freezed,
  }) {
    return _then(_value.copyWith(
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      labCode: freezed == labCode
          ? _value.labCode
          : labCode // ignore: cast_nullable_to_non_nullable
              as String?,
      remarque: freezed == remarque
          ? _value.remarque
          : remarque // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      debut: freezed == debut
          ? _value.debut
          : debut // ignore: cast_nullable_to_non_nullable
              as String?,
      fin: freezed == fin
          ? _value.fin
          : fin // ignore: cast_nullable_to_non_nullable
              as String?,
      montant: freezed == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as num?,
      montantConsom: freezed == montantConsom
          ? _value.montantConsom
          : montantConsom // ignore: cast_nullable_to_non_nullable
              as num?,
      labo: freezed == labo
          ? _value.labo
          : labo // ignore: cast_nullable_to_non_nullable
              as String?,
      tiers: freezed == tiers
          ? _value.tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as String?,
      terType: freezed == terType
          ? _value.terType
          : terType // ignore: cast_nullable_to_non_nullable
              as String?,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDto>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfferDtoImplCopyWith<$Res>
    implements $OfferDtoCopyWith<$Res> {
  factory _$$OfferDtoImplCopyWith(
          _$OfferDtoImpl value, $Res Function(_$OfferDtoImpl) then) =
      __$$OfferDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? companyId,
      int? id,
      int? ref,
      String? type,
      String? labCode,
      String? remarque,
      String? reference,
      String? debut,
      String? fin,
      num? montant,
      num? montantConsom,
      String? labo,
      String? tiers,
      String? terType,
      List<ProductDto>? products});
}

/// @nodoc
class __$$OfferDtoImplCopyWithImpl<$Res>
    extends _$OfferDtoCopyWithImpl<$Res, _$OfferDtoImpl>
    implements _$$OfferDtoImplCopyWith<$Res> {
  __$$OfferDtoImplCopyWithImpl(
      _$OfferDtoImpl _value, $Res Function(_$OfferDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of OfferDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = freezed,
    Object? id = freezed,
    Object? ref = freezed,
    Object? type = freezed,
    Object? labCode = freezed,
    Object? remarque = freezed,
    Object? reference = freezed,
    Object? debut = freezed,
    Object? fin = freezed,
    Object? montant = freezed,
    Object? montantConsom = freezed,
    Object? labo = freezed,
    Object? tiers = freezed,
    Object? terType = freezed,
    Object? products = freezed,
  }) {
    return _then(_$OfferDtoImpl(
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      labCode: freezed == labCode
          ? _value.labCode
          : labCode // ignore: cast_nullable_to_non_nullable
              as String?,
      remarque: freezed == remarque
          ? _value.remarque
          : remarque // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      debut: freezed == debut
          ? _value.debut
          : debut // ignore: cast_nullable_to_non_nullable
              as String?,
      fin: freezed == fin
          ? _value.fin
          : fin // ignore: cast_nullable_to_non_nullable
              as String?,
      montant: freezed == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as num?,
      montantConsom: freezed == montantConsom
          ? _value.montantConsom
          : montantConsom // ignore: cast_nullable_to_non_nullable
              as num?,
      labo: freezed == labo
          ? _value.labo
          : labo // ignore: cast_nullable_to_non_nullable
              as String?,
      tiers: freezed == tiers
          ? _value.tiers
          : tiers // ignore: cast_nullable_to_non_nullable
              as String?,
      terType: freezed == terType
          ? _value.terType
          : terType // ignore: cast_nullable_to_non_nullable
              as String?,
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDto>?,
    ));
  }
}

/// @nodoc

class _$OfferDtoImpl implements _OfferDto {
  const _$OfferDtoImpl(
      {this.companyId,
      this.id,
      this.ref,
      this.type,
      this.labCode,
      this.remarque,
      this.reference,
      this.debut,
      this.fin,
      this.montant,
      this.montantConsom,
      this.labo,
      this.tiers,
      this.terType,
      final List<ProductDto>? products})
      : _products = products;

  @override
  final int? companyId;
  @override
  final int? id;
  @override
  final int? ref;
  @override
  final String? type;
  @override
  final String? labCode;
  @override
  final String? remarque;
  @override
  final String? reference;
  @override
  final String? debut;
// ISO date (yyyy-MM-dd)
  @override
  final String? fin;
// ISO date (yyyy-MM-dd)
  @override
  final num? montant;
  @override
  final num? montantConsom;
  @override
  final String? labo;
  @override
  final String? tiers;
  @override
  final String? terType;
  final List<ProductDto>? _products;
  @override
  List<ProductDto>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OfferDto(companyId: $companyId, id: $id, ref: $ref, type: $type, labCode: $labCode, remarque: $remarque, reference: $reference, debut: $debut, fin: $fin, montant: $montant, montantConsom: $montantConsom, labo: $labo, tiers: $tiers, terType: $terType, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferDtoImpl &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ref, ref) || other.ref == ref) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.labCode, labCode) || other.labCode == labCode) &&
            (identical(other.remarque, remarque) ||
                other.remarque == remarque) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.debut, debut) || other.debut == debut) &&
            (identical(other.fin, fin) || other.fin == fin) &&
            (identical(other.montant, montant) || other.montant == montant) &&
            (identical(other.montantConsom, montantConsom) ||
                other.montantConsom == montantConsom) &&
            (identical(other.labo, labo) || other.labo == labo) &&
            (identical(other.tiers, tiers) || other.tiers == tiers) &&
            (identical(other.terType, terType) || other.terType == terType) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      companyId,
      id,
      ref,
      type,
      labCode,
      remarque,
      reference,
      debut,
      fin,
      montant,
      montantConsom,
      labo,
      tiers,
      terType,
      const DeepCollectionEquality().hash(_products));

  /// Create a copy of OfferDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferDtoImplCopyWith<_$OfferDtoImpl> get copyWith =>
      __$$OfferDtoImplCopyWithImpl<_$OfferDtoImpl>(this, _$identity);
}

abstract class _OfferDto implements OfferDto {
  const factory _OfferDto(
      {final int? companyId,
      final int? id,
      final int? ref,
      final String? type,
      final String? labCode,
      final String? remarque,
      final String? reference,
      final String? debut,
      final String? fin,
      final num? montant,
      final num? montantConsom,
      final String? labo,
      final String? tiers,
      final String? terType,
      final List<ProductDto>? products}) = _$OfferDtoImpl;

  @override
  int? get companyId;
  @override
  int? get id;
  @override
  int? get ref;
  @override
  String? get type;
  @override
  String? get labCode;
  @override
  String? get remarque;
  @override
  String? get reference;
  @override
  String? get debut; // ISO date (yyyy-MM-dd)
  @override
  String? get fin; // ISO date (yyyy-MM-dd)
  @override
  num? get montant;
  @override
  num? get montantConsom;
  @override
  String? get labo;
  @override
  String? get tiers;
  @override
  String? get terType;
  @override
  List<ProductDto>? get products;

  /// Create a copy of OfferDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OfferDtoImplCopyWith<_$OfferDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
