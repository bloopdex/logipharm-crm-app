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
  String get typeTier => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'superviseur')
  int? get supervisor => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude')
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'codePostal')
  String? get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'boitePostale')
  String? get postBox => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'siteWeb')
  String? get website => throw _privateConstructorUsedError;
  @JsonKey(name: 'nisCode')
  String? get nisCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'nssCode')
  String? get nssCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'tel1Fixe')
  String? get tel1Fixe => throw _privateConstructorUsedError;
  @JsonKey(name: 'tel2Fixe')
  String? get tel2Fixe => throw _privateConstructorUsedError;
  @JsonKey(name: 'telMobile')
  String? get telMobile => throw _privateConstructorUsedError;
  @JsonKey(name: 'fax')
  String? get fax => throw _privateConstructorUsedError;
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
      @JsonKey(name: 'typeTier') String typeTier,
      @JsonKey(name: 'nom') String lastName,
      @JsonKey(name: 'prenom') String? firstName,
      @JsonKey(name: 'loginCode') String loginCode,
      @JsonKey(name: 'actionFlag') int actionFlag,
      @JsonKey(name: 'regionId') String? regionId,
      @JsonKey(name: 'adresse') String? address,
      @JsonKey(name: 'latitude') double? latitude,
      @JsonKey(name: 'superviseur') int? supervisor,
      @JsonKey(name: 'longitude') double? longitude,
      @JsonKey(name: 'codePostal') String? postalCode,
      @JsonKey(name: 'boitePostale') String? postBox,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'siteWeb') String? website,
      @JsonKey(name: 'nisCode') String? nisCode,
      @JsonKey(name: 'nssCode') String? nssCode,
      @JsonKey(name: 'tel1Fixe') String? tel1Fixe,
      @JsonKey(name: 'tel2Fixe') String? tel2Fixe,
      @JsonKey(name: 'telMobile') String? telMobile,
      @JsonKey(name: 'fax') String? fax,
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
    Object? typeTier = null,
    Object? lastName = null,
    Object? firstName = freezed,
    Object? loginCode = null,
    Object? actionFlag = null,
    Object? regionId = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? supervisor = freezed,
    Object? longitude = freezed,
    Object? postalCode = freezed,
    Object? postBox = freezed,
    Object? email = freezed,
    Object? website = freezed,
    Object? nisCode = freezed,
    Object? nssCode = freezed,
    Object? tel1Fixe = freezed,
    Object? tel2Fixe = freezed,
    Object? telMobile = freezed,
    Object? fax = freezed,
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
      typeTier: null == typeTier
          ? _value.typeTier
          : typeTier // ignore: cast_nullable_to_non_nullable
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
      supervisor: freezed == supervisor
          ? _value.supervisor
          : supervisor // ignore: cast_nullable_to_non_nullable
              as int?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      postBox: freezed == postBox
          ? _value.postBox
          : postBox // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      nisCode: freezed == nisCode
          ? _value.nisCode
          : nisCode // ignore: cast_nullable_to_non_nullable
              as String?,
      nssCode: freezed == nssCode
          ? _value.nssCode
          : nssCode // ignore: cast_nullable_to_non_nullable
              as String?,
      tel1Fixe: freezed == tel1Fixe
          ? _value.tel1Fixe
          : tel1Fixe // ignore: cast_nullable_to_non_nullable
              as String?,
      tel2Fixe: freezed == tel2Fixe
          ? _value.tel2Fixe
          : tel2Fixe // ignore: cast_nullable_to_non_nullable
              as String?,
      telMobile: freezed == telMobile
          ? _value.telMobile
          : telMobile // ignore: cast_nullable_to_non_nullable
              as String?,
      fax: freezed == fax
          ? _value.fax
          : fax // ignore: cast_nullable_to_non_nullable
              as String?,
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
      @JsonKey(name: 'typeTier') String typeTier,
      @JsonKey(name: 'nom') String lastName,
      @JsonKey(name: 'prenom') String? firstName,
      @JsonKey(name: 'loginCode') String loginCode,
      @JsonKey(name: 'actionFlag') int actionFlag,
      @JsonKey(name: 'regionId') String? regionId,
      @JsonKey(name: 'adresse') String? address,
      @JsonKey(name: 'latitude') double? latitude,
      @JsonKey(name: 'superviseur') int? supervisor,
      @JsonKey(name: 'longitude') double? longitude,
      @JsonKey(name: 'codePostal') String? postalCode,
      @JsonKey(name: 'boitePostale') String? postBox,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'siteWeb') String? website,
      @JsonKey(name: 'nisCode') String? nisCode,
      @JsonKey(name: 'nssCode') String? nssCode,
      @JsonKey(name: 'tel1Fixe') String? tel1Fixe,
      @JsonKey(name: 'tel2Fixe') String? tel2Fixe,
      @JsonKey(name: 'telMobile') String? telMobile,
      @JsonKey(name: 'fax') String? fax,
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
    Object? typeTier = null,
    Object? lastName = null,
    Object? firstName = freezed,
    Object? loginCode = null,
    Object? actionFlag = null,
    Object? regionId = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? supervisor = freezed,
    Object? longitude = freezed,
    Object? postalCode = freezed,
    Object? postBox = freezed,
    Object? email = freezed,
    Object? website = freezed,
    Object? nisCode = freezed,
    Object? nssCode = freezed,
    Object? tel1Fixe = freezed,
    Object? tel2Fixe = freezed,
    Object? telMobile = freezed,
    Object? fax = freezed,
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
      typeTier: null == typeTier
          ? _value.typeTier
          : typeTier // ignore: cast_nullable_to_non_nullable
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
      supervisor: freezed == supervisor
          ? _value.supervisor
          : supervisor // ignore: cast_nullable_to_non_nullable
              as int?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      postBox: freezed == postBox
          ? _value.postBox
          : postBox // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      nisCode: freezed == nisCode
          ? _value.nisCode
          : nisCode // ignore: cast_nullable_to_non_nullable
              as String?,
      nssCode: freezed == nssCode
          ? _value.nssCode
          : nssCode // ignore: cast_nullable_to_non_nullable
              as String?,
      tel1Fixe: freezed == tel1Fixe
          ? _value.tel1Fixe
          : tel1Fixe // ignore: cast_nullable_to_non_nullable
              as String?,
      tel2Fixe: freezed == tel2Fixe
          ? _value.tel2Fixe
          : tel2Fixe // ignore: cast_nullable_to_non_nullable
              as String?,
      telMobile: freezed == telMobile
          ? _value.telMobile
          : telMobile // ignore: cast_nullable_to_non_nullable
              as String?,
      fax: freezed == fax
          ? _value.fax
          : fax // ignore: cast_nullable_to_non_nullable
              as String?,
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
      @JsonKey(name: 'typeTier') required this.typeTier,
      @JsonKey(name: 'nom') required this.lastName,
      @JsonKey(name: 'prenom') this.firstName,
      @JsonKey(name: 'loginCode') required this.loginCode,
      @JsonKey(name: 'actionFlag') required this.actionFlag,
      @JsonKey(name: 'regionId') this.regionId,
      @JsonKey(name: 'adresse') this.address,
      @JsonKey(name: 'latitude') this.latitude,
      @JsonKey(name: 'superviseur') this.supervisor,
      @JsonKey(name: 'longitude') this.longitude,
      @JsonKey(name: 'codePostal') this.postalCode,
      @JsonKey(name: 'boitePostale') this.postBox,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'siteWeb') this.website,
      @JsonKey(name: 'nisCode') this.nisCode,
      @JsonKey(name: 'nssCode') this.nssCode,
      @JsonKey(name: 'tel1Fixe') this.tel1Fixe,
      @JsonKey(name: 'tel2Fixe') this.tel2Fixe,
      @JsonKey(name: 'telMobile') this.telMobile,
      @JsonKey(name: 'fax') this.fax,
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
  final String typeTier;
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
  @JsonKey(name: 'superviseur')
  final int? supervisor;
  @override
  @JsonKey(name: 'longitude')
  final double? longitude;
  @override
  @JsonKey(name: 'codePostal')
  final String? postalCode;
  @override
  @JsonKey(name: 'boitePostale')
  final String? postBox;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'siteWeb')
  final String? website;
  @override
  @JsonKey(name: 'nisCode')
  final String? nisCode;
  @override
  @JsonKey(name: 'nssCode')
  final String? nssCode;
  @override
  @JsonKey(name: 'tel1Fixe')
  final String? tel1Fixe;
  @override
  @JsonKey(name: 'tel2Fixe')
  final String? tel2Fixe;
  @override
  @JsonKey(name: 'telMobile')
  final String? telMobile;
  @override
  @JsonKey(name: 'fax')
  final String? fax;
  @override
  @JsonKey(name: 'fullName')
  final String fullName;

  @override
  String toString() {
    return 'Person(id: $id, companyId: $companyId, typeTier: $typeTier, lastName: $lastName, firstName: $firstName, loginCode: $loginCode, actionFlag: $actionFlag, regionId: $regionId, address: $address, latitude: $latitude, supervisor: $supervisor, longitude: $longitude, postalCode: $postalCode, postBox: $postBox, email: $email, website: $website, nisCode: $nisCode, nssCode: $nssCode, tel1Fixe: $tel1Fixe, tel2Fixe: $tel2Fixe, telMobile: $telMobile, fax: $fax, fullName: $fullName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
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
            (identical(other.supervisor, supervisor) ||
                other.supervisor == supervisor) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.postBox, postBox) || other.postBox == postBox) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.nisCode, nisCode) || other.nisCode == nisCode) &&
            (identical(other.nssCode, nssCode) || other.nssCode == nssCode) &&
            (identical(other.tel1Fixe, tel1Fixe) ||
                other.tel1Fixe == tel1Fixe) &&
            (identical(other.tel2Fixe, tel2Fixe) ||
                other.tel2Fixe == tel2Fixe) &&
            (identical(other.telMobile, telMobile) ||
                other.telMobile == telMobile) &&
            (identical(other.fax, fax) || other.fax == fax) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        companyId,
        typeTier,
        lastName,
        firstName,
        loginCode,
        actionFlag,
        regionId,
        address,
        latitude,
        supervisor,
        longitude,
        postalCode,
        postBox,
        email,
        website,
        nisCode,
        nssCode,
        tel1Fixe,
        tel2Fixe,
        telMobile,
        fax,
        fullName
      ]);

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
          @JsonKey(name: 'typeTier') required final String typeTier,
          @JsonKey(name: 'nom') required final String lastName,
          @JsonKey(name: 'prenom') final String? firstName,
          @JsonKey(name: 'loginCode') required final String loginCode,
          @JsonKey(name: 'actionFlag') required final int actionFlag,
          @JsonKey(name: 'regionId') final String? regionId,
          @JsonKey(name: 'adresse') final String? address,
          @JsonKey(name: 'latitude') final double? latitude,
          @JsonKey(name: 'superviseur') final int? supervisor,
          @JsonKey(name: 'longitude') final double? longitude,
          @JsonKey(name: 'codePostal') final String? postalCode,
          @JsonKey(name: 'boitePostale') final String? postBox,
          @JsonKey(name: 'email') final String? email,
          @JsonKey(name: 'siteWeb') final String? website,
          @JsonKey(name: 'nisCode') final String? nisCode,
          @JsonKey(name: 'nssCode') final String? nssCode,
          @JsonKey(name: 'tel1Fixe') final String? tel1Fixe,
          @JsonKey(name: 'tel2Fixe') final String? tel2Fixe,
          @JsonKey(name: 'telMobile') final String? telMobile,
          @JsonKey(name: 'fax') final String? fax,
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
  String get typeTier;
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
  @JsonKey(name: 'superviseur')
  int? get supervisor;
  @override
  @JsonKey(name: 'longitude')
  double? get longitude;
  @override
  @JsonKey(name: 'codePostal')
  String? get postalCode;
  @override
  @JsonKey(name: 'boitePostale')
  String? get postBox;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'siteWeb')
  String? get website;
  @override
  @JsonKey(name: 'nisCode')
  String? get nisCode;
  @override
  @JsonKey(name: 'nssCode')
  String? get nssCode;
  @override
  @JsonKey(name: 'tel1Fixe')
  String? get tel1Fixe;
  @override
  @JsonKey(name: 'tel2Fixe')
  String? get tel2Fixe;
  @override
  @JsonKey(name: 'telMobile')
  String? get telMobile;
  @override
  @JsonKey(name: 'fax')
  String? get fax;
  @override
  @JsonKey(name: 'fullName')
  String get fullName;
  @override
  @JsonKey(ignore: true)
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
