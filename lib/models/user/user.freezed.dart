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
  Id get id => throw _privateConstructorUsedError;
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
  int get addVisitOutPlanPrivilege => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullName')
  String? get fullName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') Id id,
      @JsonKey(name: 'nom') String? lastName,
      @JsonKey(name: 'prenom') String? firstName,
      @JsonKey(name: 'loginCode') String? loginCode,
      @JsonKey(name: 'actionFlag') int? actionFlag,
      @JsonKey(name: 'regionId') String? regionId,
      @JsonKey(name: 'adresse') String? address,
      @JsonKey(name: 'latitude') double? latitude,
      @JsonKey(name: 'longitude') double? longitude,
      @JsonKey(name: 'superviseur') int? supervisor,
      @JsonKey(name: 'addViseHorsPlan') int addVisitOutPlanPrivilege,
      @JsonKey(name: 'fullName') String? fullName});

  $IdCopyWith<$Res> get id;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? loginCode = freezed,
    Object? actionFlag = freezed,
    Object? regionId = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? supervisor = freezed,
    Object? addVisitOutPlanPrivilege = null,
    Object? fullName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Id,
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
      addVisitOutPlanPrivilege: null == addVisitOutPlanPrivilege
          ? _value.addVisitOutPlanPrivilege
          : addVisitOutPlanPrivilege // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IdCopyWith<$Res> get id {
    return $IdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
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
      {@JsonKey(name: 'id') Id id,
      @JsonKey(name: 'nom') String? lastName,
      @JsonKey(name: 'prenom') String? firstName,
      @JsonKey(name: 'loginCode') String? loginCode,
      @JsonKey(name: 'actionFlag') int? actionFlag,
      @JsonKey(name: 'regionId') String? regionId,
      @JsonKey(name: 'adresse') String? address,
      @JsonKey(name: 'latitude') double? latitude,
      @JsonKey(name: 'longitude') double? longitude,
      @JsonKey(name: 'superviseur') int? supervisor,
      @JsonKey(name: 'addViseHorsPlan') int addVisitOutPlanPrivilege,
      @JsonKey(name: 'fullName') String? fullName});

  @override
  $IdCopyWith<$Res> get id;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? loginCode = freezed,
    Object? actionFlag = freezed,
    Object? regionId = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? supervisor = freezed,
    Object? addVisitOutPlanPrivilege = null,
    Object? fullName = freezed,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Id,
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
      addVisitOutPlanPrivilege: null == addVisitOutPlanPrivilege
          ? _value.addVisitOutPlanPrivilege
          : addVisitOutPlanPrivilege // ignore: cast_nullable_to_non_nullable
              as int,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'nom') required this.lastName,
      @JsonKey(name: 'prenom') this.firstName,
      @JsonKey(name: 'loginCode') required this.loginCode,
      @JsonKey(name: 'actionFlag') required this.actionFlag,
      @JsonKey(name: 'regionId') required this.regionId,
      @JsonKey(name: 'adresse') this.address,
      @JsonKey(name: 'latitude') this.latitude,
      @JsonKey(name: 'longitude') this.longitude,
      @JsonKey(name: 'superviseur') this.supervisor,
      @JsonKey(name: 'addViseHorsPlan') required this.addVisitOutPlanPrivilege,
      @JsonKey(name: 'fullName') required this.fullName});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final Id id;
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
  final int addVisitOutPlanPrivilege;
  @override
  @JsonKey(name: 'fullName')
  final String? fullName;

  @override
  String toString() {
    return 'User(id: $id, lastName: $lastName, firstName: $firstName, loginCode: $loginCode, actionFlag: $actionFlag, regionId: $regionId, address: $address, latitude: $latitude, longitude: $longitude, supervisor: $supervisor, addVisitOutPlanPrivilege: $addVisitOutPlanPrivilege, fullName: $fullName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
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
                other.fullName == fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
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
      fullName);

  @JsonKey(ignore: true)
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
      {@JsonKey(name: 'id') required final Id id,
      @JsonKey(name: 'nom') required final String? lastName,
      @JsonKey(name: 'prenom') final String? firstName,
      @JsonKey(name: 'loginCode') required final String? loginCode,
      @JsonKey(name: 'actionFlag') required final int? actionFlag,
      @JsonKey(name: 'regionId') required final String? regionId,
      @JsonKey(name: 'adresse') final String? address,
      @JsonKey(name: 'latitude') final double? latitude,
      @JsonKey(name: 'longitude') final double? longitude,
      @JsonKey(name: 'superviseur') final int? supervisor,
      @JsonKey(name: 'addViseHorsPlan')
      required final int addVisitOutPlanPrivilege,
      @JsonKey(name: 'fullName') required final String? fullName}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  Id get id;
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
  int get addVisitOutPlanPrivilege;
  @override
  @JsonKey(name: 'fullName')
  String? get fullName;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Id _$IdFromJson(Map<String, dynamic> json) {
  return _Id.fromJson(json);
}

/// @nodoc
mixin _$Id {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'cmpId')
  int get companyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'typeTier')
  String get typeTier => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdCopyWith<Id> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdCopyWith<$Res> {
  factory $IdCopyWith(Id value, $Res Function(Id) then) =
      _$IdCopyWithImpl<$Res, Id>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'cmpId') int companyId,
      @JsonKey(name: 'typeTier') String typeTier});
}

/// @nodoc
class _$IdCopyWithImpl<$Res, $Val extends Id> implements $IdCopyWith<$Res> {
  _$IdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyId = null,
    Object? typeTier = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      typeTier: null == typeTier
          ? _value.typeTier
          : typeTier // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdImplCopyWith<$Res> implements $IdCopyWith<$Res> {
  factory _$$IdImplCopyWith(_$IdImpl value, $Res Function(_$IdImpl) then) =
      __$$IdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'cmpId') int companyId,
      @JsonKey(name: 'typeTier') String typeTier});
}

/// @nodoc
class __$$IdImplCopyWithImpl<$Res> extends _$IdCopyWithImpl<$Res, _$IdImpl>
    implements _$$IdImplCopyWith<$Res> {
  __$$IdImplCopyWithImpl(_$IdImpl _value, $Res Function(_$IdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyId = null,
    Object? typeTier = null,
  }) {
    return _then(_$IdImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      typeTier: null == typeTier
          ? _value.typeTier
          : typeTier // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdImpl implements _Id {
  const _$IdImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'cmpId') required this.companyId,
      @JsonKey(name: 'typeTier') required this.typeTier});

  factory _$IdImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'cmpId')
  final int companyId;
  @override
  @JsonKey(name: 'typeTier')
  final String typeTier;

  @override
  String toString() {
    return 'Id(id: $id, companyId: $companyId, typeTier: $typeTier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.typeTier, typeTier) ||
                other.typeTier == typeTier));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, companyId, typeTier);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdImplCopyWith<_$IdImpl> get copyWith =>
      __$$IdImplCopyWithImpl<_$IdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdImplToJson(
      this,
    );
  }
}

abstract class _Id implements Id {
  const factory _Id(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'cmpId') required final int companyId,
      @JsonKey(name: 'typeTier') required final String typeTier}) = _$IdImpl;

  factory _Id.fromJson(Map<String, dynamic> json) = _$IdImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'cmpId')
  int get companyId;
  @override
  @JsonKey(name: 'typeTier')
  String get typeTier;
  @override
  @JsonKey(ignore: true)
  _$$IdImplCopyWith<_$IdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
