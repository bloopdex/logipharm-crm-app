// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'cmpId')
  int? get companyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cmpType', defaultValue: 0)
  int? get companyType => throw _privateConstructorUsedError;
  @JsonKey(name: 'typeTier')
  String? get typeTier => throw _privateConstructorUsedError;
  @JsonKey(name: 'nom')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'prenom')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'loginCode')
  String? get loginCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'actionFlag')
  int? get actionFlag => throw _privateConstructorUsedError;
  @JsonKey(name: 'regionId')
  String? get regionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'adresse')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitude')
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude')
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'superviseur')
  int? get supervisor => throw _privateConstructorUsedError;
  @JsonKey(name: 'addViseHorsPlan')
  bool? get addVisitOutPlanPrivilege => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'authorizedRadius')
  num? get authorizedRadius => throw _privateConstructorUsedError;
  @JsonKey(name: 'roleChangeLocationClient')
  bool? get roleChangeLocationClient => throw _privateConstructorUsedError;
  @JsonKey(name: 'delegueType')
  num? get delegueType => throw _privateConstructorUsedError;
  @JsonKey(name: 'crmNbrLettres')
  int? get minReportChar => throw _privateConstructorUsedError;
  @JsonKey(name: 'terVentePrixAchat')
  int? get terVentePrixAchat => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'cmpId') int? companyId,
      @JsonKey(name: 'cmpType', defaultValue: 0) int? companyType,
      @JsonKey(name: 'typeTier') String? typeTier,
      @JsonKey(name: 'nom') String? lastName,
      @JsonKey(name: 'prenom') String? firstName,
      @JsonKey(name: 'loginCode') String? loginCode,
      @JsonKey(name: 'actionFlag') int? actionFlag,
      @JsonKey(name: 'regionId') String? regionId,
      @JsonKey(name: 'adresse') String? address,
      @JsonKey(name: 'latitude') double? latitude,
      @JsonKey(name: 'longitude') double? longitude,
      @JsonKey(name: 'superviseur') int? supervisor,
      @JsonKey(name: 'addViseHorsPlan') bool? addVisitOutPlanPrivilege,
      @JsonKey(name: 'fullName') String? fullName,
      @JsonKey(name: 'authorizedRadius') num? authorizedRadius,
      @JsonKey(name: 'roleChangeLocationClient') bool? roleChangeLocationClient,
      @JsonKey(name: 'delegueType') num? delegueType,
      @JsonKey(name: 'crmNbrLettres') int? minReportChar,
      @JsonKey(name: 'terVentePrixAchat') int? terVentePrixAchat});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? companyId = freezed,
    Object? companyType = freezed,
    Object? typeTier = freezed,
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? loginCode = freezed,
    Object? actionFlag = freezed,
    Object? regionId = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? supervisor = freezed,
    Object? addVisitOutPlanPrivilege = freezed,
    Object? fullName = freezed,
    Object? authorizedRadius = freezed,
    Object? roleChangeLocationClient = freezed,
    Object? delegueType = freezed,
    Object? minReportChar = freezed,
    Object? terVentePrixAchat = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
      companyType: freezed == companyType
          ? _value.companyType
          : companyType // ignore: cast_nullable_to_non_nullable
              as int?,
      typeTier: freezed == typeTier
          ? _value.typeTier
          : typeTier // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      loginCode: freezed == loginCode
          ? _value.loginCode
          : loginCode // ignore: cast_nullable_to_non_nullable
              as String?,
      actionFlag: freezed == actionFlag
          ? _value.actionFlag
          : actionFlag // ignore: cast_nullable_to_non_nullable
              as int?,
      regionId: freezed == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      supervisor: freezed == supervisor
          ? _value.supervisor
          : supervisor // ignore: cast_nullable_to_non_nullable
              as int?,
      addVisitOutPlanPrivilege: freezed == addVisitOutPlanPrivilege
          ? _value.addVisitOutPlanPrivilege
          : addVisitOutPlanPrivilege // ignore: cast_nullable_to_non_nullable
              as bool?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizedRadius: freezed == authorizedRadius
          ? _value.authorizedRadius
          : authorizedRadius // ignore: cast_nullable_to_non_nullable
              as num?,
      roleChangeLocationClient: freezed == roleChangeLocationClient
          ? _value.roleChangeLocationClient
          : roleChangeLocationClient // ignore: cast_nullable_to_non_nullable
              as bool?,
      delegueType: freezed == delegueType
          ? _value.delegueType
          : delegueType // ignore: cast_nullable_to_non_nullable
              as num?,
      minReportChar: freezed == minReportChar
          ? _value.minReportChar
          : minReportChar // ignore: cast_nullable_to_non_nullable
              as int?,
      terVentePrixAchat: freezed == terVentePrixAchat
          ? _value.terVentePrixAchat
          : terVentePrixAchat // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'cmpId') int? companyId,
      @JsonKey(name: 'cmpType', defaultValue: 0) int? companyType,
      @JsonKey(name: 'typeTier') String? typeTier,
      @JsonKey(name: 'nom') String? lastName,
      @JsonKey(name: 'prenom') String? firstName,
      @JsonKey(name: 'loginCode') String? loginCode,
      @JsonKey(name: 'actionFlag') int? actionFlag,
      @JsonKey(name: 'regionId') String? regionId,
      @JsonKey(name: 'adresse') String? address,
      @JsonKey(name: 'latitude') double? latitude,
      @JsonKey(name: 'longitude') double? longitude,
      @JsonKey(name: 'superviseur') int? supervisor,
      @JsonKey(name: 'addViseHorsPlan') bool? addVisitOutPlanPrivilege,
      @JsonKey(name: 'fullName') String? fullName,
      @JsonKey(name: 'authorizedRadius') num? authorizedRadius,
      @JsonKey(name: 'roleChangeLocationClient') bool? roleChangeLocationClient,
      @JsonKey(name: 'delegueType') num? delegueType,
      @JsonKey(name: 'crmNbrLettres') int? minReportChar,
      @JsonKey(name: 'terVentePrixAchat') int? terVentePrixAchat});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? companyId = freezed,
    Object? companyType = freezed,
    Object? typeTier = freezed,
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? loginCode = freezed,
    Object? actionFlag = freezed,
    Object? regionId = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? supervisor = freezed,
    Object? addVisitOutPlanPrivilege = freezed,
    Object? fullName = freezed,
    Object? authorizedRadius = freezed,
    Object? roleChangeLocationClient = freezed,
    Object? delegueType = freezed,
    Object? minReportChar = freezed,
    Object? terVentePrixAchat = freezed,
  }) {
    return _then(_$UserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
      companyType: freezed == companyType
          ? _value.companyType
          : companyType // ignore: cast_nullable_to_non_nullable
              as int?,
      typeTier: freezed == typeTier
          ? _value.typeTier
          : typeTier // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      loginCode: freezed == loginCode
          ? _value.loginCode
          : loginCode // ignore: cast_nullable_to_non_nullable
              as String?,
      actionFlag: freezed == actionFlag
          ? _value.actionFlag
          : actionFlag // ignore: cast_nullable_to_non_nullable
              as int?,
      regionId: freezed == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      supervisor: freezed == supervisor
          ? _value.supervisor
          : supervisor // ignore: cast_nullable_to_non_nullable
              as int?,
      addVisitOutPlanPrivilege: freezed == addVisitOutPlanPrivilege
          ? _value.addVisitOutPlanPrivilege
          : addVisitOutPlanPrivilege // ignore: cast_nullable_to_non_nullable
              as bool?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizedRadius: freezed == authorizedRadius
          ? _value.authorizedRadius
          : authorizedRadius // ignore: cast_nullable_to_non_nullable
              as num?,
      roleChangeLocationClient: freezed == roleChangeLocationClient
          ? _value.roleChangeLocationClient
          : roleChangeLocationClient // ignore: cast_nullable_to_non_nullable
              as bool?,
      delegueType: freezed == delegueType
          ? _value.delegueType
          : delegueType // ignore: cast_nullable_to_non_nullable
              as num?,
      minReportChar: freezed == minReportChar
          ? _value.minReportChar
          : minReportChar // ignore: cast_nullable_to_non_nullable
              as int?,
      terVentePrixAchat: freezed == terVentePrixAchat
          ? _value.terVentePrixAchat
          : terVentePrixAchat // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'cmpId') this.companyId,
      @JsonKey(name: 'cmpType', defaultValue: 0) this.companyType,
      @JsonKey(name: 'typeTier') this.typeTier,
      @JsonKey(name: 'nom') this.lastName,
      @JsonKey(name: 'prenom') this.firstName,
      @JsonKey(name: 'loginCode') this.loginCode,
      @JsonKey(name: 'actionFlag') this.actionFlag,
      @JsonKey(name: 'regionId') this.regionId,
      @JsonKey(name: 'adresse') this.address,
      @JsonKey(name: 'latitude') this.latitude,
      @JsonKey(name: 'longitude') this.longitude,
      @JsonKey(name: 'superviseur') this.supervisor,
      @JsonKey(name: 'addViseHorsPlan') this.addVisitOutPlanPrivilege,
      @JsonKey(name: 'fullName') this.fullName,
      @JsonKey(name: 'authorizedRadius') this.authorizedRadius,
      @JsonKey(name: 'roleChangeLocationClient') this.roleChangeLocationClient,
      @JsonKey(name: 'delegueType') this.delegueType,
      @JsonKey(name: 'crmNbrLettres') this.minReportChar,
      @JsonKey(name: 'terVentePrixAchat') this.terVentePrixAchat});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'cmpId')
  final int? companyId;
  @override
  @JsonKey(name: 'cmpType', defaultValue: 0)
  final int? companyType;
  @override
  @JsonKey(name: 'typeTier')
  final String? typeTier;
  @override
  @JsonKey(name: 'nom')
  final String? lastName;
  @override
  @JsonKey(name: 'prenom')
  final String? firstName;
  @override
  @JsonKey(name: 'loginCode')
  final String? loginCode;
  @override
  @JsonKey(name: 'actionFlag')
  final int? actionFlag;
  @override
  @JsonKey(name: 'regionId')
  final String? regionId;
  @override
  @JsonKey(name: 'adresse')
  final String? address;
  @override
  @JsonKey(name: 'latitude')
  final double? latitude;
  @override
  @JsonKey(name: 'longitude')
  final double? longitude;
  @override
  @JsonKey(name: 'superviseur')
  final int? supervisor;
  @override
  @JsonKey(name: 'addViseHorsPlan')
  final bool? addVisitOutPlanPrivilege;
  @override
  @JsonKey(name: 'fullName')
  final String? fullName;
  @override
  @JsonKey(name: 'authorizedRadius')
  final num? authorizedRadius;
  @override
  @JsonKey(name: 'roleChangeLocationClient')
  final bool? roleChangeLocationClient;
  @override
  @JsonKey(name: 'delegueType')
  final num? delegueType;
  @override
  @JsonKey(name: 'crmNbrLettres')
  final int? minReportChar;
  @override
  @JsonKey(name: 'terVentePrixAchat')
  final int? terVentePrixAchat;

  @override
  String toString() {
    return 'User(id: $id, companyId: $companyId, companyType: $companyType, typeTier: $typeTier, lastName: $lastName, firstName: $firstName, loginCode: $loginCode, actionFlag: $actionFlag, regionId: $regionId, address: $address, latitude: $latitude, longitude: $longitude, supervisor: $supervisor, addVisitOutPlanPrivilege: $addVisitOutPlanPrivilege, fullName: $fullName, authorizedRadius: $authorizedRadius, roleChangeLocationClient: $roleChangeLocationClient, delegueType: $delegueType, minReportChar: $minReportChar, terVentePrixAchat: $terVentePrixAchat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.companyType, companyType) ||
                other.companyType == companyType) &&
            (identical(other.typeTier, typeTier) ||
                other.typeTier == typeTier) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.loginCode, loginCode) ||
                other.loginCode == loginCode) &&
            (identical(other.actionFlag, actionFlag) ||
                other.actionFlag == actionFlag) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.supervisor, supervisor) ||
                other.supervisor == supervisor) &&
            (identical(
                    other.addVisitOutPlanPrivilege, addVisitOutPlanPrivilege) ||
                other.addVisitOutPlanPrivilege == addVisitOutPlanPrivilege) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.authorizedRadius, authorizedRadius) ||
                other.authorizedRadius == authorizedRadius) &&
            (identical(
                    other.roleChangeLocationClient, roleChangeLocationClient) ||
                other.roleChangeLocationClient == roleChangeLocationClient) &&
            (identical(other.delegueType, delegueType) ||
                other.delegueType == delegueType) &&
            (identical(other.minReportChar, minReportChar) ||
                other.minReportChar == minReportChar) &&
            (identical(other.terVentePrixAchat, terVentePrixAchat) ||
                other.terVentePrixAchat == terVentePrixAchat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        companyId,
        companyType,
        typeTier,
        lastName,
        firstName,
        loginCode,
        actionFlag,
        regionId,
        address,
        latitude,
        longitude,
        supervisor,
        addVisitOutPlanPrivilege,
        fullName,
        authorizedRadius,
        roleChangeLocationClient,
        delegueType,
        minReportChar,
        terVentePrixAchat
      ]);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'cmpId') final int? companyId,
      @JsonKey(name: 'cmpType', defaultValue: 0) final int? companyType,
      @JsonKey(name: 'typeTier') final String? typeTier,
      @JsonKey(name: 'nom') final String? lastName,
      @JsonKey(name: 'prenom') final String? firstName,
      @JsonKey(name: 'loginCode') final String? loginCode,
      @JsonKey(name: 'actionFlag') final int? actionFlag,
      @JsonKey(name: 'regionId') final String? regionId,
      @JsonKey(name: 'adresse') final String? address,
      @JsonKey(name: 'latitude') final double? latitude,
      @JsonKey(name: 'longitude') final double? longitude,
      @JsonKey(name: 'superviseur') final int? supervisor,
      @JsonKey(name: 'addViseHorsPlan') final bool? addVisitOutPlanPrivilege,
      @JsonKey(name: 'fullName') final String? fullName,
      @JsonKey(name: 'authorizedRadius') final num? authorizedRadius,
      @JsonKey(name: 'roleChangeLocationClient')
      final bool? roleChangeLocationClient,
      @JsonKey(name: 'delegueType') final num? delegueType,
      @JsonKey(name: 'crmNbrLettres') final int? minReportChar,
      @JsonKey(name: 'terVentePrixAchat')
      final int? terVentePrixAchat}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'cmpId')
  int? get companyId;
  @override
  @JsonKey(name: 'cmpType', defaultValue: 0)
  int? get companyType;
  @override
  @JsonKey(name: 'typeTier')
  String? get typeTier;
  @override
  @JsonKey(name: 'nom')
  String? get lastName;
  @override
  @JsonKey(name: 'prenom')
  String? get firstName;
  @override
  @JsonKey(name: 'loginCode')
  String? get loginCode;
  @override
  @JsonKey(name: 'actionFlag')
  int? get actionFlag;
  @override
  @JsonKey(name: 'regionId')
  String? get regionId;
  @override
  @JsonKey(name: 'adresse')
  String? get address;
  @override
  @JsonKey(name: 'latitude')
  double? get latitude;
  @override
  @JsonKey(name: 'longitude')
  double? get longitude;
  @override
  @JsonKey(name: 'superviseur')
  int? get supervisor;
  @override
  @JsonKey(name: 'addViseHorsPlan')
  bool? get addVisitOutPlanPrivilege;
  @override
  @JsonKey(name: 'fullName')
  String? get fullName;
  @override
  @JsonKey(name: 'authorizedRadius')
  num? get authorizedRadius;
  @override
  @JsonKey(name: 'roleChangeLocationClient')
  bool? get roleChangeLocationClient;
  @override
  @JsonKey(name: 'delegueType')
  num? get delegueType;
  @override
  @JsonKey(name: 'crmNbrLettres')
  int? get minReportChar;
  @override
  @JsonKey(name: 'terVentePrixAchat')
  int? get terVentePrixAchat;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
