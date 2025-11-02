// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'realization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DelegateRealization _$DelegateRealizationFromJson(Map<String, dynamic> json) {
  return _DelegateRealization.fromJson(json);
}

/// @nodoc
mixin _$DelegateRealization {
  @JsonKey(name: 'companyId')
  int get companyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'year')
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'month')
  int get month => throw _privateConstructorUsedError;
  @JsonKey(name: 'delegateId')
  int get delegateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'delegateType')
  String get delegateType => throw _privateConstructorUsedError;
  @JsonKey(name: 'delegue')
  String get delegue => throw _privateConstructorUsedError;
  @JsonKey(name: 'medId')
  int get medId => throw _privateConstructorUsedError;
  @JsonKey(name: 'medAmm')
  String get medAmm => throw _privateConstructorUsedError;
  @JsonKey(name: 'medCommercialName')
  String get medCommercialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'qteObj')
  int? get qteObj => throw _privateConstructorUsedError;
  @JsonKey(name: 'qteVendue')
  int get qteVendue => throw _privateConstructorUsedError;
  @JsonKey(name: 'nbrCde')
  int get nbrCde => throw _privateConstructorUsedError;
  @JsonKey(name: 'txReal')
  int get txReal => throw _privateConstructorUsedError;

  /// Serializes this DelegateRealization to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DelegateRealization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DelegateRealizationCopyWith<DelegateRealization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DelegateRealizationCopyWith<$Res> {
  factory $DelegateRealizationCopyWith(
          DelegateRealization value, $Res Function(DelegateRealization) then) =
      _$DelegateRealizationCopyWithImpl<$Res, DelegateRealization>;
  @useResult
  $Res call(
      {@JsonKey(name: 'companyId') int companyId,
      @JsonKey(name: 'year') int year,
      @JsonKey(name: 'month') int month,
      @JsonKey(name: 'delegateId') int delegateId,
      @JsonKey(name: 'delegateType') String delegateType,
      @JsonKey(name: 'delegue') String delegue,
      @JsonKey(name: 'medId') int medId,
      @JsonKey(name: 'medAmm') String medAmm,
      @JsonKey(name: 'medCommercialName') String medCommercialName,
      @JsonKey(name: 'qteObj') int? qteObj,
      @JsonKey(name: 'qteVendue') int qteVendue,
      @JsonKey(name: 'nbrCde') int nbrCde,
      @JsonKey(name: 'txReal') int txReal});
}

/// @nodoc
class _$DelegateRealizationCopyWithImpl<$Res, $Val extends DelegateRealization>
    implements $DelegateRealizationCopyWith<$Res> {
  _$DelegateRealizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DelegateRealization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = null,
    Object? year = null,
    Object? month = null,
    Object? delegateId = null,
    Object? delegateType = null,
    Object? delegue = null,
    Object? medId = null,
    Object? medAmm = null,
    Object? medCommercialName = null,
    Object? qteObj = freezed,
    Object? qteVendue = null,
    Object? nbrCde = null,
    Object? txReal = null,
  }) {
    return _then(_value.copyWith(
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      delegateId: null == delegateId
          ? _value.delegateId
          : delegateId // ignore: cast_nullable_to_non_nullable
              as int,
      delegateType: null == delegateType
          ? _value.delegateType
          : delegateType // ignore: cast_nullable_to_non_nullable
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
      qteObj: freezed == qteObj
          ? _value.qteObj
          : qteObj // ignore: cast_nullable_to_non_nullable
              as int?,
      qteVendue: null == qteVendue
          ? _value.qteVendue
          : qteVendue // ignore: cast_nullable_to_non_nullable
              as int,
      nbrCde: null == nbrCde
          ? _value.nbrCde
          : nbrCde // ignore: cast_nullable_to_non_nullable
              as int,
      txReal: null == txReal
          ? _value.txReal
          : txReal // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DelegateRealizationImplCopyWith<$Res>
    implements $DelegateRealizationCopyWith<$Res> {
  factory _$$DelegateRealizationImplCopyWith(_$DelegateRealizationImpl value,
          $Res Function(_$DelegateRealizationImpl) then) =
      __$$DelegateRealizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'companyId') int companyId,
      @JsonKey(name: 'year') int year,
      @JsonKey(name: 'month') int month,
      @JsonKey(name: 'delegateId') int delegateId,
      @JsonKey(name: 'delegateType') String delegateType,
      @JsonKey(name: 'delegue') String delegue,
      @JsonKey(name: 'medId') int medId,
      @JsonKey(name: 'medAmm') String medAmm,
      @JsonKey(name: 'medCommercialName') String medCommercialName,
      @JsonKey(name: 'qteObj') int? qteObj,
      @JsonKey(name: 'qteVendue') int qteVendue,
      @JsonKey(name: 'nbrCde') int nbrCde,
      @JsonKey(name: 'txReal') int txReal});
}

/// @nodoc
class __$$DelegateRealizationImplCopyWithImpl<$Res>
    extends _$DelegateRealizationCopyWithImpl<$Res, _$DelegateRealizationImpl>
    implements _$$DelegateRealizationImplCopyWith<$Res> {
  __$$DelegateRealizationImplCopyWithImpl(_$DelegateRealizationImpl _value,
      $Res Function(_$DelegateRealizationImpl) _then)
      : super(_value, _then);

  /// Create a copy of DelegateRealization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = null,
    Object? year = null,
    Object? month = null,
    Object? delegateId = null,
    Object? delegateType = null,
    Object? delegue = null,
    Object? medId = null,
    Object? medAmm = null,
    Object? medCommercialName = null,
    Object? qteObj = freezed,
    Object? qteVendue = null,
    Object? nbrCde = null,
    Object? txReal = null,
  }) {
    return _then(_$DelegateRealizationImpl(
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      delegateId: null == delegateId
          ? _value.delegateId
          : delegateId // ignore: cast_nullable_to_non_nullable
              as int,
      delegateType: null == delegateType
          ? _value.delegateType
          : delegateType // ignore: cast_nullable_to_non_nullable
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
      qteObj: freezed == qteObj
          ? _value.qteObj
          : qteObj // ignore: cast_nullable_to_non_nullable
              as int?,
      qteVendue: null == qteVendue
          ? _value.qteVendue
          : qteVendue // ignore: cast_nullable_to_non_nullable
              as int,
      nbrCde: null == nbrCde
          ? _value.nbrCde
          : nbrCde // ignore: cast_nullable_to_non_nullable
              as int,
      txReal: null == txReal
          ? _value.txReal
          : txReal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DelegateRealizationImpl implements _DelegateRealization {
  const _$DelegateRealizationImpl(
      {@JsonKey(name: 'companyId') required this.companyId,
      @JsonKey(name: 'year') required this.year,
      @JsonKey(name: 'month') required this.month,
      @JsonKey(name: 'delegateId') required this.delegateId,
      @JsonKey(name: 'delegateType') required this.delegateType,
      @JsonKey(name: 'delegue') required this.delegue,
      @JsonKey(name: 'medId') required this.medId,
      @JsonKey(name: 'medAmm') required this.medAmm,
      @JsonKey(name: 'medCommercialName') required this.medCommercialName,
      @JsonKey(name: 'qteObj') this.qteObj,
      @JsonKey(name: 'qteVendue') required this.qteVendue,
      @JsonKey(name: 'nbrCde') required this.nbrCde,
      @JsonKey(name: 'txReal') required this.txReal});

  factory _$DelegateRealizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$DelegateRealizationImplFromJson(json);

  @override
  @JsonKey(name: 'companyId')
  final int companyId;
  @override
  @JsonKey(name: 'year')
  final int year;
  @override
  @JsonKey(name: 'month')
  final int month;
  @override
  @JsonKey(name: 'delegateId')
  final int delegateId;
  @override
  @JsonKey(name: 'delegateType')
  final String delegateType;
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
  @JsonKey(name: 'qteObj')
  final int? qteObj;
  @override
  @JsonKey(name: 'qteVendue')
  final int qteVendue;
  @override
  @JsonKey(name: 'nbrCde')
  final int nbrCde;
  @override
  @JsonKey(name: 'txReal')
  final int txReal;

  @override
  String toString() {
    return 'DelegateRealization(companyId: $companyId, year: $year, month: $month, delegateId: $delegateId, delegateType: $delegateType, delegue: $delegue, medId: $medId, medAmm: $medAmm, medCommercialName: $medCommercialName, qteObj: $qteObj, qteVendue: $qteVendue, nbrCde: $nbrCde, txReal: $txReal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DelegateRealizationImpl &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.delegateId, delegateId) ||
                other.delegateId == delegateId) &&
            (identical(other.delegateType, delegateType) ||
                other.delegateType == delegateType) &&
            (identical(other.delegue, delegue) || other.delegue == delegue) &&
            (identical(other.medId, medId) || other.medId == medId) &&
            (identical(other.medAmm, medAmm) || other.medAmm == medAmm) &&
            (identical(other.medCommercialName, medCommercialName) ||
                other.medCommercialName == medCommercialName) &&
            (identical(other.qteObj, qteObj) || other.qteObj == qteObj) &&
            (identical(other.qteVendue, qteVendue) ||
                other.qteVendue == qteVendue) &&
            (identical(other.nbrCde, nbrCde) || other.nbrCde == nbrCde) &&
            (identical(other.txReal, txReal) || other.txReal == txReal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      companyId,
      year,
      month,
      delegateId,
      delegateType,
      delegue,
      medId,
      medAmm,
      medCommercialName,
      qteObj,
      qteVendue,
      nbrCde,
      txReal);

  /// Create a copy of DelegateRealization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DelegateRealizationImplCopyWith<_$DelegateRealizationImpl> get copyWith =>
      __$$DelegateRealizationImplCopyWithImpl<_$DelegateRealizationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DelegateRealizationImplToJson(
      this,
    );
  }
}

abstract class _DelegateRealization implements DelegateRealization {
  const factory _DelegateRealization(
          {@JsonKey(name: 'companyId') required final int companyId,
          @JsonKey(name: 'year') required final int year,
          @JsonKey(name: 'month') required final int month,
          @JsonKey(name: 'delegateId') required final int delegateId,
          @JsonKey(name: 'delegateType') required final String delegateType,
          @JsonKey(name: 'delegue') required final String delegue,
          @JsonKey(name: 'medId') required final int medId,
          @JsonKey(name: 'medAmm') required final String medAmm,
          @JsonKey(name: 'medCommercialName')
          required final String medCommercialName,
          @JsonKey(name: 'qteObj') final int? qteObj,
          @JsonKey(name: 'qteVendue') required final int qteVendue,
          @JsonKey(name: 'nbrCde') required final int nbrCde,
          @JsonKey(name: 'txReal') required final int txReal}) =
      _$DelegateRealizationImpl;

  factory _DelegateRealization.fromJson(Map<String, dynamic> json) =
      _$DelegateRealizationImpl.fromJson;

  @override
  @JsonKey(name: 'companyId')
  int get companyId;
  @override
  @JsonKey(name: 'year')
  int get year;
  @override
  @JsonKey(name: 'month')
  int get month;
  @override
  @JsonKey(name: 'delegateId')
  int get delegateId;
  @override
  @JsonKey(name: 'delegateType')
  String get delegateType;
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
  @JsonKey(name: 'qteObj')
  int? get qteObj;
  @override
  @JsonKey(name: 'qteVendue')
  int get qteVendue;
  @override
  @JsonKey(name: 'nbrCde')
  int get nbrCde;
  @override
  @JsonKey(name: 'txReal')
  int get txReal;

  /// Create a copy of DelegateRealization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DelegateRealizationImplCopyWith<_$DelegateRealizationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
