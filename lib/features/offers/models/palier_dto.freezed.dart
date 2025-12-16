// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'palier_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PalierDto _$PalierDtoFromJson(Map<String, dynamic> json) {
  return _PalierDto.fromJson(json);
}

/// @nodoc
mixin _$PalierDto {
  int? get companyId => throw _privateConstructorUsedError;
  int? get offerId => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  num? get valMin => throw _privateConstructorUsedError;
  num? get valMax => throw _privateConstructorUsedError;
  num? get valeur => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this PalierDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PalierDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PalierDtoCopyWith<PalierDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PalierDtoCopyWith<$Res> {
  factory $PalierDtoCopyWith(PalierDto value, $Res Function(PalierDto) then) =
      _$PalierDtoCopyWithImpl<$Res, PalierDto>;
  @useResult
  $Res call(
      {int? companyId,
      int? offerId,
      int? id,
      num? valMin,
      num? valMax,
      num? valeur,
      String? type});
}

/// @nodoc
class _$PalierDtoCopyWithImpl<$Res, $Val extends PalierDto>
    implements $PalierDtoCopyWith<$Res> {
  _$PalierDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PalierDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = freezed,
    Object? offerId = freezed,
    Object? id = freezed,
    Object? valMin = freezed,
    Object? valMax = freezed,
    Object? valeur = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
      offerId: freezed == offerId
          ? _value.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      valMin: freezed == valMin
          ? _value.valMin
          : valMin // ignore: cast_nullable_to_non_nullable
              as num?,
      valMax: freezed == valMax
          ? _value.valMax
          : valMax // ignore: cast_nullable_to_non_nullable
              as num?,
      valeur: freezed == valeur
          ? _value.valeur
          : valeur // ignore: cast_nullable_to_non_nullable
              as num?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PalierDtoImplCopyWith<$Res>
    implements $PalierDtoCopyWith<$Res> {
  factory _$$PalierDtoImplCopyWith(
          _$PalierDtoImpl value, $Res Function(_$PalierDtoImpl) then) =
      __$$PalierDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? companyId,
      int? offerId,
      int? id,
      num? valMin,
      num? valMax,
      num? valeur,
      String? type});
}

/// @nodoc
class __$$PalierDtoImplCopyWithImpl<$Res>
    extends _$PalierDtoCopyWithImpl<$Res, _$PalierDtoImpl>
    implements _$$PalierDtoImplCopyWith<$Res> {
  __$$PalierDtoImplCopyWithImpl(
      _$PalierDtoImpl _value, $Res Function(_$PalierDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PalierDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = freezed,
    Object? offerId = freezed,
    Object? id = freezed,
    Object? valMin = freezed,
    Object? valMax = freezed,
    Object? valeur = freezed,
    Object? type = freezed,
  }) {
    return _then(_$PalierDtoImpl(
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
      offerId: freezed == offerId
          ? _value.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      valMin: freezed == valMin
          ? _value.valMin
          : valMin // ignore: cast_nullable_to_non_nullable
              as num?,
      valMax: freezed == valMax
          ? _value.valMax
          : valMax // ignore: cast_nullable_to_non_nullable
              as num?,
      valeur: freezed == valeur
          ? _value.valeur
          : valeur // ignore: cast_nullable_to_non_nullable
              as num?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PalierDtoImpl implements _PalierDto {
  const _$PalierDtoImpl(
      {this.companyId,
      this.offerId,
      this.id,
      this.valMin,
      this.valMax,
      this.valeur,
      this.type});

  factory _$PalierDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PalierDtoImplFromJson(json);

  @override
  final int? companyId;
  @override
  final int? offerId;
  @override
  final int? id;
  @override
  final num? valMin;
  @override
  final num? valMax;
  @override
  final num? valeur;
  @override
  final String? type;

  @override
  String toString() {
    return 'PalierDto(companyId: $companyId, offerId: $offerId, id: $id, valMin: $valMin, valMax: $valMax, valeur: $valeur, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PalierDtoImpl &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.offerId, offerId) || other.offerId == offerId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.valMin, valMin) || other.valMin == valMin) &&
            (identical(other.valMax, valMax) || other.valMax == valMax) &&
            (identical(other.valeur, valeur) || other.valeur == valeur) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, companyId, offerId, id, valMin, valMax, valeur, type);

  /// Create a copy of PalierDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PalierDtoImplCopyWith<_$PalierDtoImpl> get copyWith =>
      __$$PalierDtoImplCopyWithImpl<_$PalierDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PalierDtoImplToJson(
      this,
    );
  }
}

abstract class _PalierDto implements PalierDto {
  const factory _PalierDto(
      {final int? companyId,
      final int? offerId,
      final int? id,
      final num? valMin,
      final num? valMax,
      final num? valeur,
      final String? type}) = _$PalierDtoImpl;

  factory _PalierDto.fromJson(Map<String, dynamic> json) =
      _$PalierDtoImpl.fromJson;

  @override
  int? get companyId;
  @override
  int? get offerId;
  @override
  int? get id;
  @override
  num? get valMin;
  @override
  num? get valMax;
  @override
  num? get valeur;
  @override
  String? get type;

  /// Create a copy of PalierDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PalierDtoImplCopyWith<_$PalierDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
