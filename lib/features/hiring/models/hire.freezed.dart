// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hire.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Hire _$HireFromJson(Map<String, dynamic> json) {
  return _Hire.fromJson(json);
}

/// @nodoc
mixin _$Hire {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'companyId')
  int get companyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'delegueId')
  int get delegateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'delegueType')
  String get delegateType => throw _privateConstructorUsedError;
  @JsonKey(name: 'nom')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'prenom')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'regionId')
  String get regionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'regionName')
  String get regionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'telephone')
  String? get telephone => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusFlag')
  int get statusFlag => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusName')
  String get statusName => throw _privateConstructorUsedError;
  @JsonKey(name: 'remarque')
  String? get remark => throw _privateConstructorUsedError;

  /// Serializes this Hire to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Hire
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HireCopyWith<Hire> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HireCopyWith<$Res> {
  factory $HireCopyWith(Hire value, $Res Function(Hire) then) =
      _$HireCopyWithImpl<$Res, Hire>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'companyId') int companyId,
      @JsonKey(name: 'delegueId') int delegateId,
      @JsonKey(name: 'delegueType') String delegateType,
      @JsonKey(name: 'nom') String? lastName,
      @JsonKey(name: 'prenom') String? firstName,
      @JsonKey(name: 'regionId') String regionId,
      @JsonKey(name: 'regionName') String regionName,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'telephone') String? telephone,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'statusFlag') int statusFlag,
      @JsonKey(name: 'statusName') String statusName,
      @JsonKey(name: 'remarque') String? remark});
}

/// @nodoc
class _$HireCopyWithImpl<$Res, $Val extends Hire>
    implements $HireCopyWith<$Res> {
  _$HireCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Hire
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyId = null,
    Object? delegateId = null,
    Object? delegateType = null,
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? regionId = null,
    Object? regionName = null,
    Object? address = freezed,
    Object? telephone = freezed,
    Object? email = freezed,
    Object? statusFlag = null,
    Object? statusName = null,
    Object? remark = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      delegateId: null == delegateId
          ? _value.delegateId
          : delegateId // ignore: cast_nullable_to_non_nullable
              as int,
      delegateType: null == delegateType
          ? _value.delegateType
          : delegateType // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      regionId: null == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as String,
      regionName: null == regionName
          ? _value.regionName
          : regionName // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      statusFlag: null == statusFlag
          ? _value.statusFlag
          : statusFlag // ignore: cast_nullable_to_non_nullable
              as int,
      statusName: null == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HireImplCopyWith<$Res> implements $HireCopyWith<$Res> {
  factory _$$HireImplCopyWith(
          _$HireImpl value, $Res Function(_$HireImpl) then) =
      __$$HireImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'companyId') int companyId,
      @JsonKey(name: 'delegueId') int delegateId,
      @JsonKey(name: 'delegueType') String delegateType,
      @JsonKey(name: 'nom') String? lastName,
      @JsonKey(name: 'prenom') String? firstName,
      @JsonKey(name: 'regionId') String regionId,
      @JsonKey(name: 'regionName') String regionName,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'telephone') String? telephone,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'statusFlag') int statusFlag,
      @JsonKey(name: 'statusName') String statusName,
      @JsonKey(name: 'remarque') String? remark});
}

/// @nodoc
class __$$HireImplCopyWithImpl<$Res>
    extends _$HireCopyWithImpl<$Res, _$HireImpl>
    implements _$$HireImplCopyWith<$Res> {
  __$$HireImplCopyWithImpl(_$HireImpl _value, $Res Function(_$HireImpl) _then)
      : super(_value, _then);

  /// Create a copy of Hire
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyId = null,
    Object? delegateId = null,
    Object? delegateType = null,
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? regionId = null,
    Object? regionName = null,
    Object? address = freezed,
    Object? telephone = freezed,
    Object? email = freezed,
    Object? statusFlag = null,
    Object? statusName = null,
    Object? remark = freezed,
  }) {
    return _then(_$HireImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      delegateId: null == delegateId
          ? _value.delegateId
          : delegateId // ignore: cast_nullable_to_non_nullable
              as int,
      delegateType: null == delegateType
          ? _value.delegateType
          : delegateType // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      regionId: null == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as String,
      regionName: null == regionName
          ? _value.regionName
          : regionName // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      statusFlag: null == statusFlag
          ? _value.statusFlag
          : statusFlag // ignore: cast_nullable_to_non_nullable
              as int,
      statusName: null == statusName
          ? _value.statusName
          : statusName // ignore: cast_nullable_to_non_nullable
              as String,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HireImpl implements _Hire {
  const _$HireImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'companyId') required this.companyId,
      @JsonKey(name: 'delegueId') required this.delegateId,
      @JsonKey(name: 'delegueType') required this.delegateType,
      @JsonKey(name: 'nom') this.lastName,
      @JsonKey(name: 'prenom') this.firstName,
      @JsonKey(name: 'regionId') required this.regionId,
      @JsonKey(name: 'regionName') required this.regionName,
      @JsonKey(name: 'address') this.address,
      @JsonKey(name: 'telephone') this.telephone,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'statusFlag') required this.statusFlag,
      @JsonKey(name: 'statusName') required this.statusName,
      @JsonKey(name: 'remarque') this.remark});

  factory _$HireImpl.fromJson(Map<String, dynamic> json) =>
      _$$HireImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'companyId')
  final int companyId;
  @override
  @JsonKey(name: 'delegueId')
  final int delegateId;
  @override
  @JsonKey(name: 'delegueType')
  final String delegateType;
  @override
  @JsonKey(name: 'nom')
  final String? lastName;
  @override
  @JsonKey(name: 'prenom')
  final String? firstName;
  @override
  @JsonKey(name: 'regionId')
  final String regionId;
  @override
  @JsonKey(name: 'regionName')
  final String regionName;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'telephone')
  final String? telephone;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'statusFlag')
  final int statusFlag;
  @override
  @JsonKey(name: 'statusName')
  final String statusName;
  @override
  @JsonKey(name: 'remarque')
  final String? remark;

  @override
  String toString() {
    return 'Hire(id: $id, companyId: $companyId, delegateId: $delegateId, delegateType: $delegateType, lastName: $lastName, firstName: $firstName, regionId: $regionId, regionName: $regionName, address: $address, telephone: $telephone, email: $email, statusFlag: $statusFlag, statusName: $statusName, remark: $remark)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HireImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.delegateId, delegateId) ||
                other.delegateId == delegateId) &&
            (identical(other.delegateType, delegateType) ||
                other.delegateType == delegateType) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.regionName, regionName) ||
                other.regionName == regionName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.statusFlag, statusFlag) ||
                other.statusFlag == statusFlag) &&
            (identical(other.statusName, statusName) ||
                other.statusName == statusName) &&
            (identical(other.remark, remark) || other.remark == remark));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      companyId,
      delegateId,
      delegateType,
      lastName,
      firstName,
      regionId,
      regionName,
      address,
      telephone,
      email,
      statusFlag,
      statusName,
      remark);

  /// Create a copy of Hire
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HireImplCopyWith<_$HireImpl> get copyWith =>
      __$$HireImplCopyWithImpl<_$HireImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HireImplToJson(
      this,
    );
  }
}

abstract class _Hire implements Hire {
  const factory _Hire(
      {@JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'companyId') required final int companyId,
      @JsonKey(name: 'delegueId') required final int delegateId,
      @JsonKey(name: 'delegueType') required final String delegateType,
      @JsonKey(name: 'nom') final String? lastName,
      @JsonKey(name: 'prenom') final String? firstName,
      @JsonKey(name: 'regionId') required final String regionId,
      @JsonKey(name: 'regionName') required final String regionName,
      @JsonKey(name: 'address') final String? address,
      @JsonKey(name: 'telephone') final String? telephone,
      @JsonKey(name: 'email') final String? email,
      @JsonKey(name: 'statusFlag') required final int statusFlag,
      @JsonKey(name: 'statusName') required final String statusName,
      @JsonKey(name: 'remarque') final String? remark}) = _$HireImpl;

  factory _Hire.fromJson(Map<String, dynamic> json) = _$HireImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'companyId')
  int get companyId;
  @override
  @JsonKey(name: 'delegueId')
  int get delegateId;
  @override
  @JsonKey(name: 'delegueType')
  String get delegateType;
  @override
  @JsonKey(name: 'nom')
  String? get lastName;
  @override
  @JsonKey(name: 'prenom')
  String? get firstName;
  @override
  @JsonKey(name: 'regionId')
  String get regionId;
  @override
  @JsonKey(name: 'regionName')
  String get regionName;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(name: 'telephone')
  String? get telephone;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'statusFlag')
  int get statusFlag;
  @override
  @JsonKey(name: 'statusName')
  String get statusName;
  @override
  @JsonKey(name: 'remarque')
  String? get remark;

  /// Create a copy of Hire
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HireImplCopyWith<_$HireImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
