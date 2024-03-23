// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Person _$PersonFromJson(Map<String, dynamic> json) {
  return _Person.fromJson(json);
}

/// @nodoc
mixin _$Person {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'cmpId')
  int get companyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'typeTier')
  String get tierType => throw _privateConstructorUsedError;
  @JsonKey(name: 'nom')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'prenom')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'loginCode')
  String get loginCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'actionFlag')
  int get actionFlag => throw _privateConstructorUsedError;
  @JsonKey(name: 'regionId')
  String? get regionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'adresse')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitude')
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude')
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullName')
  String get fullName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonCopyWith<Person> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonCopyWith<$Res> {
  factory $PersonCopyWith(Person value, $Res Function(Person) then) =
      _$PersonCopyWithImpl<$Res, Person>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'cmpId') int companyId,
      @JsonKey(name: 'typeTier') String tierType,
      @JsonKey(name: 'nom') String lastName,
      @JsonKey(name: 'prenom') String? firstName,
      @JsonKey(name: 'loginCode') String loginCode,
      @JsonKey(name: 'actionFlag') int actionFlag,
      @JsonKey(name: 'regionId') String? regionId,
      @JsonKey(name: 'adresse') String? address,
      @JsonKey(name: 'latitude') double? latitude,
      @JsonKey(name: 'longitude') double? longitude,
      @JsonKey(name: 'fullName') String fullName});
}

/// @nodoc
class _$PersonCopyWithImpl<$Res, $Val extends Person>
    implements $PersonCopyWith<$Res> {
  _$PersonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyId = null,
    Object? tierType = null,
    Object? lastName = null,
    Object? firstName = freezed,
    Object? loginCode = null,
    Object? actionFlag = null,
    Object? regionId = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? fullName = null,
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
      tierType: null == tierType
          ? _value.tierType
          : tierType // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      loginCode: null == loginCode
          ? _value.loginCode
          : loginCode // ignore: cast_nullable_to_non_nullable
              as String,
      actionFlag: null == actionFlag
          ? _value.actionFlag
          : actionFlag // ignore: cast_nullable_to_non_nullable
              as int,
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
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonImplCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory _$$PersonImplCopyWith(
          _$PersonImpl value, $Res Function(_$PersonImpl) then) =
      __$$PersonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'cmpId') int companyId,
      @JsonKey(name: 'typeTier') String tierType,
      @JsonKey(name: 'nom') String lastName,
      @JsonKey(name: 'prenom') String? firstName,
      @JsonKey(name: 'loginCode') String loginCode,
      @JsonKey(name: 'actionFlag') int actionFlag,
      @JsonKey(name: 'regionId') String? regionId,
      @JsonKey(name: 'adresse') String? address,
      @JsonKey(name: 'latitude') double? latitude,
      @JsonKey(name: 'longitude') double? longitude,
      @JsonKey(name: 'fullName') String fullName});
}

/// @nodoc
class __$$PersonImplCopyWithImpl<$Res>
    extends _$PersonCopyWithImpl<$Res, _$PersonImpl>
    implements _$$PersonImplCopyWith<$Res> {
  __$$PersonImplCopyWithImpl(
      _$PersonImpl _value, $Res Function(_$PersonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyId = null,
    Object? tierType = null,
    Object? lastName = null,
    Object? firstName = freezed,
    Object? loginCode = null,
    Object? actionFlag = null,
    Object? regionId = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? fullName = null,
  }) {
    return _then(_$PersonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int,
      tierType: null == tierType
          ? _value.tierType
          : tierType // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      loginCode: null == loginCode
          ? _value.loginCode
          : loginCode // ignore: cast_nullable_to_non_nullable
              as String,
      actionFlag: null == actionFlag
          ? _value.actionFlag
          : actionFlag // ignore: cast_nullable_to_non_nullable
              as int,
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
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonImpl implements _Person {
  const _$PersonImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'cmpId') required this.companyId,
      @JsonKey(name: 'typeTier') required this.tierType,
      @JsonKey(name: 'nom') required this.lastName,
      @JsonKey(name: 'prenom') this.firstName,
      @JsonKey(name: 'loginCode') required this.loginCode,
      @JsonKey(name: 'actionFlag') required this.actionFlag,
      @JsonKey(name: 'regionId') this.regionId,
      @JsonKey(name: 'adresse') this.address,
      @JsonKey(name: 'latitude') this.latitude,
      @JsonKey(name: 'longitude') this.longitude,
      @JsonKey(name: 'fullName') required this.fullName});

  factory _$PersonImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'cmpId')
  final int companyId;
  @override
  @JsonKey(name: 'typeTier')
  final String tierType;
  @override
  @JsonKey(name: 'nom')
  final String lastName;
  @override
  @JsonKey(name: 'prenom')
  final String? firstName;
  @override
  @JsonKey(name: 'loginCode')
  final String loginCode;
  @override
  @JsonKey(name: 'actionFlag')
  final int actionFlag;
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
  @JsonKey(name: 'fullName')
  final String fullName;

  @override
  String toString() {
    return 'Person(id: $id, companyId: $companyId, tierType: $tierType, lastName: $lastName, firstName: $firstName, loginCode: $loginCode, actionFlag: $actionFlag, regionId: $regionId, address: $address, latitude: $latitude, longitude: $longitude, fullName: $fullName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.tierType, tierType) ||
                other.tierType == tierType) &&
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
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      companyId,
      tierType,
      lastName,
      firstName,
      loginCode,
      actionFlag,
      regionId,
      address,
      latitude,
      longitude,
      fullName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      __$$PersonImplCopyWithImpl<_$PersonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonImplToJson(
      this,
    );
  }
}

abstract class _Person implements Person {
  const factory _Person(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'cmpId') required final int companyId,
          @JsonKey(name: 'typeTier') required final String tierType,
          @JsonKey(name: 'nom') required final String lastName,
          @JsonKey(name: 'prenom') final String? firstName,
          @JsonKey(name: 'loginCode') required final String loginCode,
          @JsonKey(name: 'actionFlag') required final int actionFlag,
          @JsonKey(name: 'regionId') final String? regionId,
          @JsonKey(name: 'adresse') final String? address,
          @JsonKey(name: 'latitude') final double? latitude,
          @JsonKey(name: 'longitude') final double? longitude,
          @JsonKey(name: 'fullName') required final String fullName}) =
      _$PersonImpl;

  factory _Person.fromJson(Map<String, dynamic> json) = _$PersonImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'cmpId')
  int get companyId;
  @override
  @JsonKey(name: 'typeTier')
  String get tierType;
  @override
  @JsonKey(name: 'nom')
  String get lastName;
  @override
  @JsonKey(name: 'prenom')
  String? get firstName;
  @override
  @JsonKey(name: 'loginCode')
  String get loginCode;
  @override
  @JsonKey(name: 'actionFlag')
  int get actionFlag;
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
  @JsonKey(name: 'fullName')
  String get fullName;
  @override
  @JsonKey(ignore: true)
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
