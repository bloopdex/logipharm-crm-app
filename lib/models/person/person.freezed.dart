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
  @JsonKey(name: 'activeFlag')
  int get activeFlag => throw _privateConstructorUsedError;
  @JsonKey(name: 'regionId')
  String? get regionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ville')
  String? get ville => throw _privateConstructorUsedError;
  @JsonKey(name: 'adresse')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitude')
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude')
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'superviseur')
  int? get supervisor => throw _privateConstructorUsedError; // Supervisor ID
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
  @JsonKey(name: 'prospect')
  bool? get prospect => throw _privateConstructorUsedError;
  @JsonKey(name: 'solvabilite')
  Solvabilite? get solvabilite =>
      throw _privateConstructorUsedError; // Added solvabilite
  @JsonKey(name: 'modePaie')
  ModePaie? get modePaie =>
      throw _privateConstructorUsedError; // Added modePaie
  @JsonKey(name: 'categorieId')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'categorieLibelle')
  String? get categoryLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'categorieId2')
  int? get categorieId2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'categorieLibelle2')
  String? get categoryLabel2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'ficheClient')
  ClientStatistics? get clientStatistics => throw _privateConstructorUsedError;
  @JsonKey(name: 'laboratoireCode')
  String? get laboratoireCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'delegueType')
  num? get delegueType => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastVisitDate')
  String? get lastVisitDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'visitCount')
  int? get visitCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'inactifFlag')
  bool? get inactifFlag => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'phase')
  String? get phase => throw _privateConstructorUsedError;

  /// Serializes this Person to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      @JsonKey(name: 'activeFlag') int activeFlag,
      @JsonKey(name: 'regionId') String? regionId,
      @JsonKey(name: 'ville') String? ville,
      @JsonKey(name: 'adresse') String? address,
      @JsonKey(name: 'latitude') double? latitude,
      @JsonKey(name: 'longitude') double? longitude,
      @JsonKey(name: 'superviseur') int? supervisor,
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
      @JsonKey(name: 'fullName') String fullName,
      @JsonKey(name: 'prospect') bool? prospect,
      @JsonKey(name: 'solvabilite') Solvabilite? solvabilite,
      @JsonKey(name: 'modePaie') ModePaie? modePaie,
      @JsonKey(name: 'categorieId') int? categoryId,
      @JsonKey(name: 'categorieLibelle') String? categoryLabel,
      @JsonKey(name: 'categorieId2') int? categorieId2,
      @JsonKey(name: 'categorieLibelle2') String? categoryLabel2,
      @JsonKey(name: 'ficheClient') ClientStatistics? clientStatistics,
      @JsonKey(name: 'laboratoireCode') String? laboratoireCode,
      @JsonKey(name: 'delegueType') num? delegueType,
      @JsonKey(name: 'lastVisitDate') String? lastVisitDate,
      @JsonKey(name: 'visitCount') int? visitCount,
      @JsonKey(name: 'inactifFlag') bool? inactifFlag,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'phase') String? phase});

  $SolvabiliteCopyWith<$Res>? get solvabilite;
  $ModePaieCopyWith<$Res>? get modePaie;
  $ClientStatisticsCopyWith<$Res>? get clientStatistics;
}

/// @nodoc
class _$PersonCopyWithImpl<$Res, $Val extends Person>
    implements $PersonCopyWith<$Res> {
  _$PersonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyId = null,
    Object? typeTier = null,
    Object? lastName = null,
    Object? firstName = freezed,
    Object? loginCode = null,
    Object? activeFlag = null,
    Object? regionId = freezed,
    Object? ville = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? supervisor = freezed,
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
    Object? prospect = freezed,
    Object? solvabilite = freezed,
    Object? modePaie = freezed,
    Object? categoryId = freezed,
    Object? categoryLabel = freezed,
    Object? categorieId2 = freezed,
    Object? categoryLabel2 = freezed,
    Object? clientStatistics = freezed,
    Object? laboratoireCode = freezed,
    Object? delegueType = freezed,
    Object? lastVisitDate = freezed,
    Object? visitCount = freezed,
    Object? inactifFlag = freezed,
    Object? status = freezed,
    Object? phase = freezed,
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
      activeFlag: null == activeFlag
          ? _value.activeFlag
          : activeFlag // ignore: cast_nullable_to_non_nullable
              as int,
      regionId: freezed == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as String?,
      ville: freezed == ville
          ? _value.ville
          : ville // ignore: cast_nullable_to_non_nullable
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
      prospect: freezed == prospect
          ? _value.prospect
          : prospect // ignore: cast_nullable_to_non_nullable
              as bool?,
      solvabilite: freezed == solvabilite
          ? _value.solvabilite
          : solvabilite // ignore: cast_nullable_to_non_nullable
              as Solvabilite?,
      modePaie: freezed == modePaie
          ? _value.modePaie
          : modePaie // ignore: cast_nullable_to_non_nullable
              as ModePaie?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryLabel: freezed == categoryLabel
          ? _value.categoryLabel
          : categoryLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      categorieId2: freezed == categorieId2
          ? _value.categorieId2
          : categorieId2 // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryLabel2: freezed == categoryLabel2
          ? _value.categoryLabel2
          : categoryLabel2 // ignore: cast_nullable_to_non_nullable
              as String?,
      clientStatistics: freezed == clientStatistics
          ? _value.clientStatistics
          : clientStatistics // ignore: cast_nullable_to_non_nullable
              as ClientStatistics?,
      laboratoireCode: freezed == laboratoireCode
          ? _value.laboratoireCode
          : laboratoireCode // ignore: cast_nullable_to_non_nullable
              as String?,
      delegueType: freezed == delegueType
          ? _value.delegueType
          : delegueType // ignore: cast_nullable_to_non_nullable
              as num?,
      lastVisitDate: freezed == lastVisitDate
          ? _value.lastVisitDate
          : lastVisitDate // ignore: cast_nullable_to_non_nullable
              as String?,
      visitCount: freezed == visitCount
          ? _value.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as int?,
      inactifFlag: freezed == inactifFlag
          ? _value.inactifFlag
          : inactifFlag // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      phase: freezed == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SolvabiliteCopyWith<$Res>? get solvabilite {
    if (_value.solvabilite == null) {
      return null;
    }

    return $SolvabiliteCopyWith<$Res>(_value.solvabilite!, (value) {
      return _then(_value.copyWith(solvabilite: value) as $Val);
    });
  }

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ModePaieCopyWith<$Res>? get modePaie {
    if (_value.modePaie == null) {
      return null;
    }

    return $ModePaieCopyWith<$Res>(_value.modePaie!, (value) {
      return _then(_value.copyWith(modePaie: value) as $Val);
    });
  }

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientStatisticsCopyWith<$Res>? get clientStatistics {
    if (_value.clientStatistics == null) {
      return null;
    }

    return $ClientStatisticsCopyWith<$Res>(_value.clientStatistics!, (value) {
      return _then(_value.copyWith(clientStatistics: value) as $Val);
    });
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
      @JsonKey(name: 'activeFlag') int activeFlag,
      @JsonKey(name: 'regionId') String? regionId,
      @JsonKey(name: 'ville') String? ville,
      @JsonKey(name: 'adresse') String? address,
      @JsonKey(name: 'latitude') double? latitude,
      @JsonKey(name: 'longitude') double? longitude,
      @JsonKey(name: 'superviseur') int? supervisor,
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
      @JsonKey(name: 'fullName') String fullName,
      @JsonKey(name: 'prospect') bool? prospect,
      @JsonKey(name: 'solvabilite') Solvabilite? solvabilite,
      @JsonKey(name: 'modePaie') ModePaie? modePaie,
      @JsonKey(name: 'categorieId') int? categoryId,
      @JsonKey(name: 'categorieLibelle') String? categoryLabel,
      @JsonKey(name: 'categorieId2') int? categorieId2,
      @JsonKey(name: 'categorieLibelle2') String? categoryLabel2,
      @JsonKey(name: 'ficheClient') ClientStatistics? clientStatistics,
      @JsonKey(name: 'laboratoireCode') String? laboratoireCode,
      @JsonKey(name: 'delegueType') num? delegueType,
      @JsonKey(name: 'lastVisitDate') String? lastVisitDate,
      @JsonKey(name: 'visitCount') int? visitCount,
      @JsonKey(name: 'inactifFlag') bool? inactifFlag,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'phase') String? phase});

  @override
  $SolvabiliteCopyWith<$Res>? get solvabilite;
  @override
  $ModePaieCopyWith<$Res>? get modePaie;
  @override
  $ClientStatisticsCopyWith<$Res>? get clientStatistics;
}

/// @nodoc
class __$$PersonImplCopyWithImpl<$Res>
    extends _$PersonCopyWithImpl<$Res, _$PersonImpl>
    implements _$$PersonImplCopyWith<$Res> {
  __$$PersonImplCopyWithImpl(
      _$PersonImpl _value, $Res Function(_$PersonImpl) _then)
      : super(_value, _then);

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyId = null,
    Object? typeTier = null,
    Object? lastName = null,
    Object? firstName = freezed,
    Object? loginCode = null,
    Object? activeFlag = null,
    Object? regionId = freezed,
    Object? ville = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? supervisor = freezed,
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
    Object? prospect = freezed,
    Object? solvabilite = freezed,
    Object? modePaie = freezed,
    Object? categoryId = freezed,
    Object? categoryLabel = freezed,
    Object? categorieId2 = freezed,
    Object? categoryLabel2 = freezed,
    Object? clientStatistics = freezed,
    Object? laboratoireCode = freezed,
    Object? delegueType = freezed,
    Object? lastVisitDate = freezed,
    Object? visitCount = freezed,
    Object? inactifFlag = freezed,
    Object? status = freezed,
    Object? phase = freezed,
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
      activeFlag: null == activeFlag
          ? _value.activeFlag
          : activeFlag // ignore: cast_nullable_to_non_nullable
              as int,
      regionId: freezed == regionId
          ? _value.regionId
          : regionId // ignore: cast_nullable_to_non_nullable
              as String?,
      ville: freezed == ville
          ? _value.ville
          : ville // ignore: cast_nullable_to_non_nullable
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
      prospect: freezed == prospect
          ? _value.prospect
          : prospect // ignore: cast_nullable_to_non_nullable
              as bool?,
      solvabilite: freezed == solvabilite
          ? _value.solvabilite
          : solvabilite // ignore: cast_nullable_to_non_nullable
              as Solvabilite?,
      modePaie: freezed == modePaie
          ? _value.modePaie
          : modePaie // ignore: cast_nullable_to_non_nullable
              as ModePaie?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryLabel: freezed == categoryLabel
          ? _value.categoryLabel
          : categoryLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      categorieId2: freezed == categorieId2
          ? _value.categorieId2
          : categorieId2 // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryLabel2: freezed == categoryLabel2
          ? _value.categoryLabel2
          : categoryLabel2 // ignore: cast_nullable_to_non_nullable
              as String?,
      clientStatistics: freezed == clientStatistics
          ? _value.clientStatistics
          : clientStatistics // ignore: cast_nullable_to_non_nullable
              as ClientStatistics?,
      laboratoireCode: freezed == laboratoireCode
          ? _value.laboratoireCode
          : laboratoireCode // ignore: cast_nullable_to_non_nullable
              as String?,
      delegueType: freezed == delegueType
          ? _value.delegueType
          : delegueType // ignore: cast_nullable_to_non_nullable
              as num?,
      lastVisitDate: freezed == lastVisitDate
          ? _value.lastVisitDate
          : lastVisitDate // ignore: cast_nullable_to_non_nullable
              as String?,
      visitCount: freezed == visitCount
          ? _value.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as int?,
      inactifFlag: freezed == inactifFlag
          ? _value.inactifFlag
          : inactifFlag // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      phase: freezed == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as String?,
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
      @JsonKey(name: 'activeFlag') required this.activeFlag,
      @JsonKey(name: 'regionId') this.regionId,
      @JsonKey(name: 'ville') this.ville,
      @JsonKey(name: 'adresse') this.address,
      @JsonKey(name: 'latitude') this.latitude,
      @JsonKey(name: 'longitude') this.longitude,
      @JsonKey(name: 'superviseur') this.supervisor,
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
      @JsonKey(name: 'fullName') required this.fullName,
      @JsonKey(name: 'prospect') this.prospect,
      @JsonKey(name: 'solvabilite') this.solvabilite,
      @JsonKey(name: 'modePaie') this.modePaie,
      @JsonKey(name: 'categorieId') this.categoryId,
      @JsonKey(name: 'categorieLibelle') this.categoryLabel,
      @JsonKey(name: 'categorieId2') this.categorieId2,
      @JsonKey(name: 'categorieLibelle2') this.categoryLabel2,
      @JsonKey(name: 'ficheClient') this.clientStatistics,
      @JsonKey(name: 'laboratoireCode') this.laboratoireCode,
      @JsonKey(name: 'delegueType') this.delegueType,
      @JsonKey(name: 'lastVisitDate') this.lastVisitDate,
      @JsonKey(name: 'visitCount') this.visitCount,
      @JsonKey(name: 'inactifFlag') this.inactifFlag,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'phase') this.phase});

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
  @JsonKey(name: 'activeFlag')
  final int activeFlag;
  @override
  @JsonKey(name: 'regionId')
  final String? regionId;
  @override
  @JsonKey(name: 'ville')
  final String? ville;
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
// Supervisor ID
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
  @JsonKey(name: 'prospect')
  final bool? prospect;
  @override
  @JsonKey(name: 'solvabilite')
  final Solvabilite? solvabilite;
// Added solvabilite
  @override
  @JsonKey(name: 'modePaie')
  final ModePaie? modePaie;
// Added modePaie
  @override
  @JsonKey(name: 'categorieId')
  final int? categoryId;
  @override
  @JsonKey(name: 'categorieLibelle')
  final String? categoryLabel;
  @override
  @JsonKey(name: 'categorieId2')
  final int? categorieId2;
  @override
  @JsonKey(name: 'categorieLibelle2')
  final String? categoryLabel2;
  @override
  @JsonKey(name: 'ficheClient')
  final ClientStatistics? clientStatistics;
  @override
  @JsonKey(name: 'laboratoireCode')
  final String? laboratoireCode;
  @override
  @JsonKey(name: 'delegueType')
  final num? delegueType;
  @override
  @JsonKey(name: 'lastVisitDate')
  final String? lastVisitDate;
  @override
  @JsonKey(name: 'visitCount')
  final int? visitCount;
  @override
  @JsonKey(name: 'inactifFlag')
  final bool? inactifFlag;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'phase')
  final String? phase;

  @override
  String toString() {
    return 'Person(id: $id, companyId: $companyId, typeTier: $typeTier, lastName: $lastName, firstName: $firstName, loginCode: $loginCode, activeFlag: $activeFlag, regionId: $regionId, ville: $ville, address: $address, latitude: $latitude, longitude: $longitude, supervisor: $supervisor, postalCode: $postalCode, postBox: $postBox, email: $email, website: $website, nisCode: $nisCode, nssCode: $nssCode, tel1Fixe: $tel1Fixe, tel2Fixe: $tel2Fixe, telMobile: $telMobile, fax: $fax, fullName: $fullName, prospect: $prospect, solvabilite: $solvabilite, modePaie: $modePaie, categoryId: $categoryId, categoryLabel: $categoryLabel, categorieId2: $categorieId2, categoryLabel2: $categoryLabel2, clientStatistics: $clientStatistics, laboratoireCode: $laboratoireCode, delegueType: $delegueType, lastVisitDate: $lastVisitDate, visitCount: $visitCount, inactifFlag: $inactifFlag, status: $status, phase: $phase)';
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
            (identical(other.activeFlag, activeFlag) ||
                other.activeFlag == activeFlag) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.ville, ville) || other.ville == ville) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.supervisor, supervisor) ||
                other.supervisor == supervisor) &&
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
                other.fullName == fullName) &&
            (identical(other.prospect, prospect) ||
                other.prospect == prospect) &&
            (identical(other.solvabilite, solvabilite) ||
                other.solvabilite == solvabilite) &&
            (identical(other.modePaie, modePaie) ||
                other.modePaie == modePaie) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryLabel, categoryLabel) ||
                other.categoryLabel == categoryLabel) &&
            (identical(other.categorieId2, categorieId2) ||
                other.categorieId2 == categorieId2) &&
            (identical(other.categoryLabel2, categoryLabel2) ||
                other.categoryLabel2 == categoryLabel2) &&
            (identical(other.clientStatistics, clientStatistics) ||
                other.clientStatistics == clientStatistics) &&
            (identical(other.laboratoireCode, laboratoireCode) ||
                other.laboratoireCode == laboratoireCode) &&
            (identical(other.delegueType, delegueType) ||
                other.delegueType == delegueType) &&
            (identical(other.lastVisitDate, lastVisitDate) ||
                other.lastVisitDate == lastVisitDate) &&
            (identical(other.visitCount, visitCount) ||
                other.visitCount == visitCount) &&
            (identical(other.inactifFlag, inactifFlag) ||
                other.inactifFlag == inactifFlag) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.phase, phase) || other.phase == phase));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        companyId,
        typeTier,
        lastName,
        firstName,
        loginCode,
        activeFlag,
        regionId,
        ville,
        address,
        latitude,
        longitude,
        supervisor,
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
        fullName,
        prospect,
        solvabilite,
        modePaie,
        categoryId,
        categoryLabel,
        categorieId2,
        categoryLabel2,
        clientStatistics,
        laboratoireCode,
        delegueType,
        lastVisitDate,
        visitCount,
        inactifFlag,
        status,
        phase
      ]);

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      @JsonKey(name: 'activeFlag') required final int activeFlag,
      @JsonKey(name: 'regionId') final String? regionId,
      @JsonKey(name: 'ville') final String? ville,
      @JsonKey(name: 'adresse') final String? address,
      @JsonKey(name: 'latitude') final double? latitude,
      @JsonKey(name: 'longitude') final double? longitude,
      @JsonKey(name: 'superviseur') final int? supervisor,
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
      @JsonKey(name: 'fullName') required final String fullName,
      @JsonKey(name: 'prospect') final bool? prospect,
      @JsonKey(name: 'solvabilite') final Solvabilite? solvabilite,
      @JsonKey(name: 'modePaie') final ModePaie? modePaie,
      @JsonKey(name: 'categorieId') final int? categoryId,
      @JsonKey(name: 'categorieLibelle') final String? categoryLabel,
      @JsonKey(name: 'categorieId2') final int? categorieId2,
      @JsonKey(name: 'categorieLibelle2') final String? categoryLabel2,
      @JsonKey(name: 'ficheClient') final ClientStatistics? clientStatistics,
      @JsonKey(name: 'laboratoireCode') final String? laboratoireCode,
      @JsonKey(name: 'delegueType') final num? delegueType,
      @JsonKey(name: 'lastVisitDate') final String? lastVisitDate,
      @JsonKey(name: 'visitCount') final int? visitCount,
      @JsonKey(name: 'inactifFlag') final bool? inactifFlag,
      @JsonKey(name: 'status') final String? status,
      @JsonKey(name: 'phase') final String? phase}) = _$PersonImpl;

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
  @JsonKey(name: 'activeFlag')
  int get activeFlag;
  @override
  @JsonKey(name: 'regionId')
  String? get regionId;
  @override
  @JsonKey(name: 'ville')
  String? get ville;
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
  int? get supervisor; // Supervisor ID
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
  @JsonKey(name: 'prospect')
  bool? get prospect;
  @override
  @JsonKey(name: 'solvabilite')
  Solvabilite? get solvabilite; // Added solvabilite
  @override
  @JsonKey(name: 'modePaie')
  ModePaie? get modePaie; // Added modePaie
  @override
  @JsonKey(name: 'categorieId')
  int? get categoryId;
  @override
  @JsonKey(name: 'categorieLibelle')
  String? get categoryLabel;
  @override
  @JsonKey(name: 'categorieId2')
  int? get categorieId2;
  @override
  @JsonKey(name: 'categorieLibelle2')
  String? get categoryLabel2;
  @override
  @JsonKey(name: 'ficheClient')
  ClientStatistics? get clientStatistics;
  @override
  @JsonKey(name: 'laboratoireCode')
  String? get laboratoireCode;
  @override
  @JsonKey(name: 'delegueType')
  num? get delegueType;
  @override
  @JsonKey(name: 'lastVisitDate')
  String? get lastVisitDate;
  @override
  @JsonKey(name: 'visitCount')
  int? get visitCount;
  @override
  @JsonKey(name: 'inactifFlag')
  bool? get inactifFlag;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'phase')
  String? get phase;

  /// Create a copy of Person
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Solvabilite _$SolvabiliteFromJson(Map<String, dynamic> json) {
  return _Solvabilite.fromJson(json);
}

/// @nodoc
mixin _$Solvabilite {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'label')
  String get label => throw _privateConstructorUsedError;

  /// Serializes this Solvabilite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Solvabilite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SolvabiliteCopyWith<Solvabilite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolvabiliteCopyWith<$Res> {
  factory $SolvabiliteCopyWith(
          Solvabilite value, $Res Function(Solvabilite) then) =
      _$SolvabiliteCopyWithImpl<$Res, Solvabilite>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id, @JsonKey(name: 'label') String label});
}

/// @nodoc
class _$SolvabiliteCopyWithImpl<$Res, $Val extends Solvabilite>
    implements $SolvabiliteCopyWith<$Res> {
  _$SolvabiliteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Solvabilite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SolvabiliteImplCopyWith<$Res>
    implements $SolvabiliteCopyWith<$Res> {
  factory _$$SolvabiliteImplCopyWith(
          _$SolvabiliteImpl value, $Res Function(_$SolvabiliteImpl) then) =
      __$$SolvabiliteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id, @JsonKey(name: 'label') String label});
}

/// @nodoc
class __$$SolvabiliteImplCopyWithImpl<$Res>
    extends _$SolvabiliteCopyWithImpl<$Res, _$SolvabiliteImpl>
    implements _$$SolvabiliteImplCopyWith<$Res> {
  __$$SolvabiliteImplCopyWithImpl(
      _$SolvabiliteImpl _value, $Res Function(_$SolvabiliteImpl) _then)
      : super(_value, _then);

  /// Create a copy of Solvabilite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_$SolvabiliteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SolvabiliteImpl implements _Solvabilite {
  const _$SolvabiliteImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'label') required this.label});

  factory _$SolvabiliteImpl.fromJson(Map<String, dynamic> json) =>
      _$$SolvabiliteImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'label')
  final String label;

  @override
  String toString() {
    return 'Solvabilite(id: $id, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SolvabiliteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label);

  /// Create a copy of Solvabilite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SolvabiliteImplCopyWith<_$SolvabiliteImpl> get copyWith =>
      __$$SolvabiliteImplCopyWithImpl<_$SolvabiliteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SolvabiliteImplToJson(
      this,
    );
  }
}

abstract class _Solvabilite implements Solvabilite {
  const factory _Solvabilite(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'label') required final String label}) = _$SolvabiliteImpl;

  factory _Solvabilite.fromJson(Map<String, dynamic> json) =
      _$SolvabiliteImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'label')
  String get label;

  /// Create a copy of Solvabilite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SolvabiliteImplCopyWith<_$SolvabiliteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ModePaie _$ModePaieFromJson(Map<String, dynamic> json) {
  return _ModePaie.fromJson(json);
}

/// @nodoc
mixin _$ModePaie {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'label')
  String get label => throw _privateConstructorUsedError;

  /// Serializes this ModePaie to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ModePaie
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModePaieCopyWith<ModePaie> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModePaieCopyWith<$Res> {
  factory $ModePaieCopyWith(ModePaie value, $Res Function(ModePaie) then) =
      _$ModePaieCopyWithImpl<$Res, ModePaie>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id, @JsonKey(name: 'label') String label});
}

/// @nodoc
class _$ModePaieCopyWithImpl<$Res, $Val extends ModePaie>
    implements $ModePaieCopyWith<$Res> {
  _$ModePaieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ModePaie
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModePaieImplCopyWith<$Res>
    implements $ModePaieCopyWith<$Res> {
  factory _$$ModePaieImplCopyWith(
          _$ModePaieImpl value, $Res Function(_$ModePaieImpl) then) =
      __$$ModePaieImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id, @JsonKey(name: 'label') String label});
}

/// @nodoc
class __$$ModePaieImplCopyWithImpl<$Res>
    extends _$ModePaieCopyWithImpl<$Res, _$ModePaieImpl>
    implements _$$ModePaieImplCopyWith<$Res> {
  __$$ModePaieImplCopyWithImpl(
      _$ModePaieImpl _value, $Res Function(_$ModePaieImpl) _then)
      : super(_value, _then);

  /// Create a copy of ModePaie
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_$ModePaieImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModePaieImpl implements _ModePaie {
  const _$ModePaieImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'label') required this.label});

  factory _$ModePaieImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModePaieImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'label')
  final String label;

  @override
  String toString() {
    return 'ModePaie(id: $id, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModePaieImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label);

  /// Create a copy of ModePaie
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModePaieImplCopyWith<_$ModePaieImpl> get copyWith =>
      __$$ModePaieImplCopyWithImpl<_$ModePaieImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModePaieImplToJson(
      this,
    );
  }
}

abstract class _ModePaie implements ModePaie {
  const factory _ModePaie(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'label') required final String label}) = _$ModePaieImpl;

  factory _ModePaie.fromJson(Map<String, dynamic> json) =
      _$ModePaieImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'label')
  String get label;

  /// Create a copy of ModePaie
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModePaieImplCopyWith<_$ModePaieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
