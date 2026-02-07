// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return _Contact.fromJson(json);
}

/// @nodoc
mixin _$Contact {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'categorie')
  String? get categorie => throw _privateConstructorUsedError;
  @JsonKey(name: 'nom')
  String? get nom => throw _privateConstructorUsedError;
  @JsonKey(name: 'prenom')
  String? get prenom => throw _privateConstructorUsedError;
  @JsonKey(name: 'wilayaId')
  String? get wilayaId => throw _privateConstructorUsedError;
  @JsonKey(name: 'regionLib')
  String? get regionLib => throw _privateConstructorUsedError;
  @JsonKey(name: 'vilId')
  String? get vilId => throw _privateConstructorUsedError;
  @JsonKey(name: 'delegueId')
  int? get delegueId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ville')
  String? get ville => throw _privateConstructorUsedError;
  @JsonKey(name: 'adresse')
  String? get adresse => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'tel1')
  String? get tel1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'tel2')
  String? get tel2 => throw _privateConstructorUsedError; // Pharmacien extras
  @JsonKey(name: 'rcCode')
  String? get rcCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'fiscalCode')
  String? get fiscalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'nis')
  String? get nis => throw _privateConstructorUsedError;
  @JsonKey(name: 'articleCode')
  String? get articleCode =>
      throw _privateConstructorUsedError; // Médecin extras
  @JsonKey(name: 'specialite')
  String? get specialite => throw _privateConstructorUsedError;
  @JsonKey(name: 'potentiel')
  String? get potentiel => throw _privateConstructorUsedError;
  @JsonKey(name: 'connaissanceProduit')
  String? get connaissanceProduit => throw _privateConstructorUsedError;
  @JsonKey(name: 'prescripteur')
  String? get prescripteur => throw _privateConstructorUsedError;
  @JsonKey(name: 'objections')
  String? get objections =>
      throw _privateConstructorUsedError; // Patient extras (new)
  @JsonKey(name: 'medecinTraitant')
  String? get medecinTraitant => throw _privateConstructorUsedError;
  @JsonKey(name: 'specialiteMedecin')
  String? get specialiteMedecin => throw _privateConstructorUsedError;
  @JsonKey(name: 'typeDiabete')
  String? get typeDiabete => throw _privateConstructorUsedError;
  @JsonKey(name: 'testeProduit')
  String? get testeProduit => throw _privateConstructorUsedError;
  @JsonKey(name: 'resultatTest')
  String? get resultatTest =>
      throw _privateConstructorUsedError; // Inactive flag
  @JsonKey(name: 'inactifFlag')
  bool? get inactifFlag => throw _privateConstructorUsedError;

  /// Serializes this Contact to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactCopyWith<Contact> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCopyWith<$Res> {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) then) =
      _$ContactCopyWithImpl<$Res, Contact>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'categorie') String? categorie,
      @JsonKey(name: 'nom') String? nom,
      @JsonKey(name: 'prenom') String? prenom,
      @JsonKey(name: 'wilayaId') String? wilayaId,
      @JsonKey(name: 'regionLib') String? regionLib,
      @JsonKey(name: 'vilId') String? vilId,
      @JsonKey(name: 'delegueId') int? delegueId,
      @JsonKey(name: 'ville') String? ville,
      @JsonKey(name: 'adresse') String? adresse,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'tel1') String? tel1,
      @JsonKey(name: 'tel2') String? tel2,
      @JsonKey(name: 'rcCode') String? rcCode,
      @JsonKey(name: 'fiscalCode') String? fiscalCode,
      @JsonKey(name: 'nis') String? nis,
      @JsonKey(name: 'articleCode') String? articleCode,
      @JsonKey(name: 'specialite') String? specialite,
      @JsonKey(name: 'potentiel') String? potentiel,
      @JsonKey(name: 'connaissanceProduit') String? connaissanceProduit,
      @JsonKey(name: 'prescripteur') String? prescripteur,
      @JsonKey(name: 'objections') String? objections,
      @JsonKey(name: 'medecinTraitant') String? medecinTraitant,
      @JsonKey(name: 'specialiteMedecin') String? specialiteMedecin,
      @JsonKey(name: 'typeDiabete') String? typeDiabete,
      @JsonKey(name: 'testeProduit') String? testeProduit,
      @JsonKey(name: 'resultatTest') String? resultatTest,
      @JsonKey(name: 'inactifFlag') bool? inactifFlag});
}

/// @nodoc
class _$ContactCopyWithImpl<$Res, $Val extends Contact>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categorie = freezed,
    Object? nom = freezed,
    Object? prenom = freezed,
    Object? wilayaId = freezed,
    Object? regionLib = freezed,
    Object? vilId = freezed,
    Object? delegueId = freezed,
    Object? ville = freezed,
    Object? adresse = freezed,
    Object? email = freezed,
    Object? tel1 = freezed,
    Object? tel2 = freezed,
    Object? rcCode = freezed,
    Object? fiscalCode = freezed,
    Object? nis = freezed,
    Object? articleCode = freezed,
    Object? specialite = freezed,
    Object? potentiel = freezed,
    Object? connaissanceProduit = freezed,
    Object? prescripteur = freezed,
    Object? objections = freezed,
    Object? medecinTraitant = freezed,
    Object? specialiteMedecin = freezed,
    Object? typeDiabete = freezed,
    Object? testeProduit = freezed,
    Object? resultatTest = freezed,
    Object? inactifFlag = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categorie: freezed == categorie
          ? _value.categorie
          : categorie // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: freezed == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String?,
      prenom: freezed == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String?,
      wilayaId: freezed == wilayaId
          ? _value.wilayaId
          : wilayaId // ignore: cast_nullable_to_non_nullable
              as String?,
      regionLib: freezed == regionLib
          ? _value.regionLib
          : regionLib // ignore: cast_nullable_to_non_nullable
              as String?,
      vilId: freezed == vilId
          ? _value.vilId
          : vilId // ignore: cast_nullable_to_non_nullable
              as String?,
      delegueId: freezed == delegueId
          ? _value.delegueId
          : delegueId // ignore: cast_nullable_to_non_nullable
              as int?,
      ville: freezed == ville
          ? _value.ville
          : ville // ignore: cast_nullable_to_non_nullable
              as String?,
      adresse: freezed == adresse
          ? _value.adresse
          : adresse // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      tel1: freezed == tel1
          ? _value.tel1
          : tel1 // ignore: cast_nullable_to_non_nullable
              as String?,
      tel2: freezed == tel2
          ? _value.tel2
          : tel2 // ignore: cast_nullable_to_non_nullable
              as String?,
      rcCode: freezed == rcCode
          ? _value.rcCode
          : rcCode // ignore: cast_nullable_to_non_nullable
              as String?,
      fiscalCode: freezed == fiscalCode
          ? _value.fiscalCode
          : fiscalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      nis: freezed == nis
          ? _value.nis
          : nis // ignore: cast_nullable_to_non_nullable
              as String?,
      articleCode: freezed == articleCode
          ? _value.articleCode
          : articleCode // ignore: cast_nullable_to_non_nullable
              as String?,
      specialite: freezed == specialite
          ? _value.specialite
          : specialite // ignore: cast_nullable_to_non_nullable
              as String?,
      potentiel: freezed == potentiel
          ? _value.potentiel
          : potentiel // ignore: cast_nullable_to_non_nullable
              as String?,
      connaissanceProduit: freezed == connaissanceProduit
          ? _value.connaissanceProduit
          : connaissanceProduit // ignore: cast_nullable_to_non_nullable
              as String?,
      prescripteur: freezed == prescripteur
          ? _value.prescripteur
          : prescripteur // ignore: cast_nullable_to_non_nullable
              as String?,
      objections: freezed == objections
          ? _value.objections
          : objections // ignore: cast_nullable_to_non_nullable
              as String?,
      medecinTraitant: freezed == medecinTraitant
          ? _value.medecinTraitant
          : medecinTraitant // ignore: cast_nullable_to_non_nullable
              as String?,
      specialiteMedecin: freezed == specialiteMedecin
          ? _value.specialiteMedecin
          : specialiteMedecin // ignore: cast_nullable_to_non_nullable
              as String?,
      typeDiabete: freezed == typeDiabete
          ? _value.typeDiabete
          : typeDiabete // ignore: cast_nullable_to_non_nullable
              as String?,
      testeProduit: freezed == testeProduit
          ? _value.testeProduit
          : testeProduit // ignore: cast_nullable_to_non_nullable
              as String?,
      resultatTest: freezed == resultatTest
          ? _value.resultatTest
          : resultatTest // ignore: cast_nullable_to_non_nullable
              as String?,
      inactifFlag: freezed == inactifFlag
          ? _value.inactifFlag
          : inactifFlag // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactImplCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$$ContactImplCopyWith(
          _$ContactImpl value, $Res Function(_$ContactImpl) then) =
      __$$ContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'categorie') String? categorie,
      @JsonKey(name: 'nom') String? nom,
      @JsonKey(name: 'prenom') String? prenom,
      @JsonKey(name: 'wilayaId') String? wilayaId,
      @JsonKey(name: 'regionLib') String? regionLib,
      @JsonKey(name: 'vilId') String? vilId,
      @JsonKey(name: 'delegueId') int? delegueId,
      @JsonKey(name: 'ville') String? ville,
      @JsonKey(name: 'adresse') String? adresse,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'tel1') String? tel1,
      @JsonKey(name: 'tel2') String? tel2,
      @JsonKey(name: 'rcCode') String? rcCode,
      @JsonKey(name: 'fiscalCode') String? fiscalCode,
      @JsonKey(name: 'nis') String? nis,
      @JsonKey(name: 'articleCode') String? articleCode,
      @JsonKey(name: 'specialite') String? specialite,
      @JsonKey(name: 'potentiel') String? potentiel,
      @JsonKey(name: 'connaissanceProduit') String? connaissanceProduit,
      @JsonKey(name: 'prescripteur') String? prescripteur,
      @JsonKey(name: 'objections') String? objections,
      @JsonKey(name: 'medecinTraitant') String? medecinTraitant,
      @JsonKey(name: 'specialiteMedecin') String? specialiteMedecin,
      @JsonKey(name: 'typeDiabete') String? typeDiabete,
      @JsonKey(name: 'testeProduit') String? testeProduit,
      @JsonKey(name: 'resultatTest') String? resultatTest,
      @JsonKey(name: 'inactifFlag') bool? inactifFlag});
}

/// @nodoc
class __$$ContactImplCopyWithImpl<$Res>
    extends _$ContactCopyWithImpl<$Res, _$ContactImpl>
    implements _$$ContactImplCopyWith<$Res> {
  __$$ContactImplCopyWithImpl(
      _$ContactImpl _value, $Res Function(_$ContactImpl) _then)
      : super(_value, _then);

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categorie = freezed,
    Object? nom = freezed,
    Object? prenom = freezed,
    Object? wilayaId = freezed,
    Object? regionLib = freezed,
    Object? vilId = freezed,
    Object? delegueId = freezed,
    Object? ville = freezed,
    Object? adresse = freezed,
    Object? email = freezed,
    Object? tel1 = freezed,
    Object? tel2 = freezed,
    Object? rcCode = freezed,
    Object? fiscalCode = freezed,
    Object? nis = freezed,
    Object? articleCode = freezed,
    Object? specialite = freezed,
    Object? potentiel = freezed,
    Object? connaissanceProduit = freezed,
    Object? prescripteur = freezed,
    Object? objections = freezed,
    Object? medecinTraitant = freezed,
    Object? specialiteMedecin = freezed,
    Object? typeDiabete = freezed,
    Object? testeProduit = freezed,
    Object? resultatTest = freezed,
    Object? inactifFlag = freezed,
  }) {
    return _then(_$ContactImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categorie: freezed == categorie
          ? _value.categorie
          : categorie // ignore: cast_nullable_to_non_nullable
              as String?,
      nom: freezed == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String?,
      prenom: freezed == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String?,
      wilayaId: freezed == wilayaId
          ? _value.wilayaId
          : wilayaId // ignore: cast_nullable_to_non_nullable
              as String?,
      regionLib: freezed == regionLib
          ? _value.regionLib
          : regionLib // ignore: cast_nullable_to_non_nullable
              as String?,
      vilId: freezed == vilId
          ? _value.vilId
          : vilId // ignore: cast_nullable_to_non_nullable
              as String?,
      delegueId: freezed == delegueId
          ? _value.delegueId
          : delegueId // ignore: cast_nullable_to_non_nullable
              as int?,
      ville: freezed == ville
          ? _value.ville
          : ville // ignore: cast_nullable_to_non_nullable
              as String?,
      adresse: freezed == adresse
          ? _value.adresse
          : adresse // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      tel1: freezed == tel1
          ? _value.tel1
          : tel1 // ignore: cast_nullable_to_non_nullable
              as String?,
      tel2: freezed == tel2
          ? _value.tel2
          : tel2 // ignore: cast_nullable_to_non_nullable
              as String?,
      rcCode: freezed == rcCode
          ? _value.rcCode
          : rcCode // ignore: cast_nullable_to_non_nullable
              as String?,
      fiscalCode: freezed == fiscalCode
          ? _value.fiscalCode
          : fiscalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      nis: freezed == nis
          ? _value.nis
          : nis // ignore: cast_nullable_to_non_nullable
              as String?,
      articleCode: freezed == articleCode
          ? _value.articleCode
          : articleCode // ignore: cast_nullable_to_non_nullable
              as String?,
      specialite: freezed == specialite
          ? _value.specialite
          : specialite // ignore: cast_nullable_to_non_nullable
              as String?,
      potentiel: freezed == potentiel
          ? _value.potentiel
          : potentiel // ignore: cast_nullable_to_non_nullable
              as String?,
      connaissanceProduit: freezed == connaissanceProduit
          ? _value.connaissanceProduit
          : connaissanceProduit // ignore: cast_nullable_to_non_nullable
              as String?,
      prescripteur: freezed == prescripteur
          ? _value.prescripteur
          : prescripteur // ignore: cast_nullable_to_non_nullable
              as String?,
      objections: freezed == objections
          ? _value.objections
          : objections // ignore: cast_nullable_to_non_nullable
              as String?,
      medecinTraitant: freezed == medecinTraitant
          ? _value.medecinTraitant
          : medecinTraitant // ignore: cast_nullable_to_non_nullable
              as String?,
      specialiteMedecin: freezed == specialiteMedecin
          ? _value.specialiteMedecin
          : specialiteMedecin // ignore: cast_nullable_to_non_nullable
              as String?,
      typeDiabete: freezed == typeDiabete
          ? _value.typeDiabete
          : typeDiabete // ignore: cast_nullable_to_non_nullable
              as String?,
      testeProduit: freezed == testeProduit
          ? _value.testeProduit
          : testeProduit // ignore: cast_nullable_to_non_nullable
              as String?,
      resultatTest: freezed == resultatTest
          ? _value.resultatTest
          : resultatTest // ignore: cast_nullable_to_non_nullable
              as String?,
      inactifFlag: freezed == inactifFlag
          ? _value.inactifFlag
          : inactifFlag // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactImpl implements _Contact {
  const _$ContactImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'categorie') this.categorie,
      @JsonKey(name: 'nom') this.nom,
      @JsonKey(name: 'prenom') this.prenom,
      @JsonKey(name: 'wilayaId') this.wilayaId,
      @JsonKey(name: 'regionLib') this.regionLib,
      @JsonKey(name: 'vilId') this.vilId,
      @JsonKey(name: 'delegueId') this.delegueId,
      @JsonKey(name: 'ville') this.ville,
      @JsonKey(name: 'adresse') this.adresse,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'tel1') this.tel1,
      @JsonKey(name: 'tel2') this.tel2,
      @JsonKey(name: 'rcCode') this.rcCode,
      @JsonKey(name: 'fiscalCode') this.fiscalCode,
      @JsonKey(name: 'nis') this.nis,
      @JsonKey(name: 'articleCode') this.articleCode,
      @JsonKey(name: 'specialite') this.specialite,
      @JsonKey(name: 'potentiel') this.potentiel,
      @JsonKey(name: 'connaissanceProduit') this.connaissanceProduit,
      @JsonKey(name: 'prescripteur') this.prescripteur,
      @JsonKey(name: 'objections') this.objections,
      @JsonKey(name: 'medecinTraitant') this.medecinTraitant,
      @JsonKey(name: 'specialiteMedecin') this.specialiteMedecin,
      @JsonKey(name: 'typeDiabete') this.typeDiabete,
      @JsonKey(name: 'testeProduit') this.testeProduit,
      @JsonKey(name: 'resultatTest') this.resultatTest,
      @JsonKey(name: 'inactifFlag') this.inactifFlag});

  factory _$ContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'categorie')
  final String? categorie;
  @override
  @JsonKey(name: 'nom')
  final String? nom;
  @override
  @JsonKey(name: 'prenom')
  final String? prenom;
  @override
  @JsonKey(name: 'wilayaId')
  final String? wilayaId;
  @override
  @JsonKey(name: 'regionLib')
  final String? regionLib;
  @override
  @JsonKey(name: 'vilId')
  final String? vilId;
  @override
  @JsonKey(name: 'delegueId')
  final int? delegueId;
  @override
  @JsonKey(name: 'ville')
  final String? ville;
  @override
  @JsonKey(name: 'adresse')
  final String? adresse;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'tel1')
  final String? tel1;
  @override
  @JsonKey(name: 'tel2')
  final String? tel2;
// Pharmacien extras
  @override
  @JsonKey(name: 'rcCode')
  final String? rcCode;
  @override
  @JsonKey(name: 'fiscalCode')
  final String? fiscalCode;
  @override
  @JsonKey(name: 'nis')
  final String? nis;
  @override
  @JsonKey(name: 'articleCode')
  final String? articleCode;
// Médecin extras
  @override
  @JsonKey(name: 'specialite')
  final String? specialite;
  @override
  @JsonKey(name: 'potentiel')
  final String? potentiel;
  @override
  @JsonKey(name: 'connaissanceProduit')
  final String? connaissanceProduit;
  @override
  @JsonKey(name: 'prescripteur')
  final String? prescripteur;
  @override
  @JsonKey(name: 'objections')
  final String? objections;
// Patient extras (new)
  @override
  @JsonKey(name: 'medecinTraitant')
  final String? medecinTraitant;
  @override
  @JsonKey(name: 'specialiteMedecin')
  final String? specialiteMedecin;
  @override
  @JsonKey(name: 'typeDiabete')
  final String? typeDiabete;
  @override
  @JsonKey(name: 'testeProduit')
  final String? testeProduit;
  @override
  @JsonKey(name: 'resultatTest')
  final String? resultatTest;
// Inactive flag
  @override
  @JsonKey(name: 'inactifFlag')
  final bool? inactifFlag;

  @override
  String toString() {
    return 'Contact(id: $id, categorie: $categorie, nom: $nom, prenom: $prenom, wilayaId: $wilayaId, regionLib: $regionLib, vilId: $vilId, delegueId: $delegueId, ville: $ville, adresse: $adresse, email: $email, tel1: $tel1, tel2: $tel2, rcCode: $rcCode, fiscalCode: $fiscalCode, nis: $nis, articleCode: $articleCode, specialite: $specialite, potentiel: $potentiel, connaissanceProduit: $connaissanceProduit, prescripteur: $prescripteur, objections: $objections, medecinTraitant: $medecinTraitant, specialiteMedecin: $specialiteMedecin, typeDiabete: $typeDiabete, testeProduit: $testeProduit, resultatTest: $resultatTest, inactifFlag: $inactifFlag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categorie, categorie) ||
                other.categorie == categorie) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.wilayaId, wilayaId) ||
                other.wilayaId == wilayaId) &&
            (identical(other.regionLib, regionLib) ||
                other.regionLib == regionLib) &&
            (identical(other.vilId, vilId) || other.vilId == vilId) &&
            (identical(other.delegueId, delegueId) ||
                other.delegueId == delegueId) &&
            (identical(other.ville, ville) || other.ville == ville) &&
            (identical(other.adresse, adresse) || other.adresse == adresse) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.tel1, tel1) || other.tel1 == tel1) &&
            (identical(other.tel2, tel2) || other.tel2 == tel2) &&
            (identical(other.rcCode, rcCode) || other.rcCode == rcCode) &&
            (identical(other.fiscalCode, fiscalCode) ||
                other.fiscalCode == fiscalCode) &&
            (identical(other.nis, nis) || other.nis == nis) &&
            (identical(other.articleCode, articleCode) ||
                other.articleCode == articleCode) &&
            (identical(other.specialite, specialite) ||
                other.specialite == specialite) &&
            (identical(other.potentiel, potentiel) ||
                other.potentiel == potentiel) &&
            (identical(other.connaissanceProduit, connaissanceProduit) ||
                other.connaissanceProduit == connaissanceProduit) &&
            (identical(other.prescripteur, prescripteur) ||
                other.prescripteur == prescripteur) &&
            (identical(other.objections, objections) ||
                other.objections == objections) &&
            (identical(other.medecinTraitant, medecinTraitant) ||
                other.medecinTraitant == medecinTraitant) &&
            (identical(other.specialiteMedecin, specialiteMedecin) ||
                other.specialiteMedecin == specialiteMedecin) &&
            (identical(other.typeDiabete, typeDiabete) ||
                other.typeDiabete == typeDiabete) &&
            (identical(other.testeProduit, testeProduit) ||
                other.testeProduit == testeProduit) &&
            (identical(other.resultatTest, resultatTest) ||
                other.resultatTest == resultatTest) &&
            (identical(other.inactifFlag, inactifFlag) ||
                other.inactifFlag == inactifFlag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        categorie,
        nom,
        prenom,
        wilayaId,
        regionLib,
        vilId,
        delegueId,
        ville,
        adresse,
        email,
        tel1,
        tel2,
        rcCode,
        fiscalCode,
        nis,
        articleCode,
        specialite,
        potentiel,
        connaissanceProduit,
        prescripteur,
        objections,
        medecinTraitant,
        specialiteMedecin,
        typeDiabete,
        testeProduit,
        resultatTest,
        inactifFlag
      ]);

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactImplCopyWith<_$ContactImpl> get copyWith =>
      __$$ContactImplCopyWithImpl<_$ContactImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactImplToJson(
      this,
    );
  }
}

abstract class _Contact implements Contact {
  const factory _Contact(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'categorie') final String? categorie,
      @JsonKey(name: 'nom') final String? nom,
      @JsonKey(name: 'prenom') final String? prenom,
      @JsonKey(name: 'wilayaId') final String? wilayaId,
      @JsonKey(name: 'regionLib') final String? regionLib,
      @JsonKey(name: 'vilId') final String? vilId,
      @JsonKey(name: 'delegueId') final int? delegueId,
      @JsonKey(name: 'ville') final String? ville,
      @JsonKey(name: 'adresse') final String? adresse,
      @JsonKey(name: 'email') final String? email,
      @JsonKey(name: 'tel1') final String? tel1,
      @JsonKey(name: 'tel2') final String? tel2,
      @JsonKey(name: 'rcCode') final String? rcCode,
      @JsonKey(name: 'fiscalCode') final String? fiscalCode,
      @JsonKey(name: 'nis') final String? nis,
      @JsonKey(name: 'articleCode') final String? articleCode,
      @JsonKey(name: 'specialite') final String? specialite,
      @JsonKey(name: 'potentiel') final String? potentiel,
      @JsonKey(name: 'connaissanceProduit') final String? connaissanceProduit,
      @JsonKey(name: 'prescripteur') final String? prescripteur,
      @JsonKey(name: 'objections') final String? objections,
      @JsonKey(name: 'medecinTraitant') final String? medecinTraitant,
      @JsonKey(name: 'specialiteMedecin') final String? specialiteMedecin,
      @JsonKey(name: 'typeDiabete') final String? typeDiabete,
      @JsonKey(name: 'testeProduit') final String? testeProduit,
      @JsonKey(name: 'resultatTest') final String? resultatTest,
      @JsonKey(name: 'inactifFlag') final bool? inactifFlag}) = _$ContactImpl;

  factory _Contact.fromJson(Map<String, dynamic> json) = _$ContactImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'categorie')
  String? get categorie;
  @override
  @JsonKey(name: 'nom')
  String? get nom;
  @override
  @JsonKey(name: 'prenom')
  String? get prenom;
  @override
  @JsonKey(name: 'wilayaId')
  String? get wilayaId;
  @override
  @JsonKey(name: 'regionLib')
  String? get regionLib;
  @override
  @JsonKey(name: 'vilId')
  String? get vilId;
  @override
  @JsonKey(name: 'delegueId')
  int? get delegueId;
  @override
  @JsonKey(name: 'ville')
  String? get ville;
  @override
  @JsonKey(name: 'adresse')
  String? get adresse;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'tel1')
  String? get tel1;
  @override
  @JsonKey(name: 'tel2')
  String? get tel2; // Pharmacien extras
  @override
  @JsonKey(name: 'rcCode')
  String? get rcCode;
  @override
  @JsonKey(name: 'fiscalCode')
  String? get fiscalCode;
  @override
  @JsonKey(name: 'nis')
  String? get nis;
  @override
  @JsonKey(name: 'articleCode')
  String? get articleCode; // Médecin extras
  @override
  @JsonKey(name: 'specialite')
  String? get specialite;
  @override
  @JsonKey(name: 'potentiel')
  String? get potentiel;
  @override
  @JsonKey(name: 'connaissanceProduit')
  String? get connaissanceProduit;
  @override
  @JsonKey(name: 'prescripteur')
  String? get prescripteur;
  @override
  @JsonKey(name: 'objections')
  String? get objections; // Patient extras (new)
  @override
  @JsonKey(name: 'medecinTraitant')
  String? get medecinTraitant;
  @override
  @JsonKey(name: 'specialiteMedecin')
  String? get specialiteMedecin;
  @override
  @JsonKey(name: 'typeDiabete')
  String? get typeDiabete;
  @override
  @JsonKey(name: 'testeProduit')
  String? get testeProduit;
  @override
  @JsonKey(name: 'resultatTest')
  String? get resultatTest; // Inactive flag
  @override
  @JsonKey(name: 'inactifFlag')
  bool? get inactifFlag;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactImplCopyWith<_$ContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContactCreateUpdate _$ContactCreateUpdateFromJson(Map<String, dynamic> json) {
  return _ContactCreateUpdate.fromJson(json);
}

/// @nodoc
mixin _$ContactCreateUpdate {
  @JsonKey(name: 'categorie')
  String get categorie => throw _privateConstructorUsedError;
  @JsonKey(name: 'nom')
  String get nom => throw _privateConstructorUsedError;
  @JsonKey(name: 'prenom')
  String? get prenom => throw _privateConstructorUsedError;
  @JsonKey(name: 'wilayaId')
  String get wilayaId => throw _privateConstructorUsedError;
  @JsonKey(name: 'regionLib')
  String? get regionLib => throw _privateConstructorUsedError;
  @JsonKey(name: 'vilId')
  String? get vilId => throw _privateConstructorUsedError;
  @JsonKey(name: 'delegueId')
  int? get delegueId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ville')
  String? get ville => throw _privateConstructorUsedError;
  @JsonKey(name: 'adresse')
  String? get adresse => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'tel1')
  String? get tel1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'tel2')
  String? get tel2 => throw _privateConstructorUsedError; // Pharmacien extras
  @JsonKey(name: 'rcCode')
  String? get rcCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'fiscalCode')
  String? get fiscalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'nis')
  String? get nis => throw _privateConstructorUsedError;
  @JsonKey(name: 'articleCode')
  String? get articleCode =>
      throw _privateConstructorUsedError; // Médecin extras
  @JsonKey(name: 'specialite')
  String? get specialite => throw _privateConstructorUsedError;
  @JsonKey(name: 'potentiel')
  String? get potentiel => throw _privateConstructorUsedError;
  @JsonKey(name: 'connaissanceProduit')
  String? get connaissanceProduit => throw _privateConstructorUsedError;
  @JsonKey(name: 'prescripteur')
  String? get prescripteur => throw _privateConstructorUsedError;
  @JsonKey(name: 'objections')
  String? get objections =>
      throw _privateConstructorUsedError; // Patient extras (new)
  @JsonKey(name: 'medecinTraitant')
  String? get medecinTraitant => throw _privateConstructorUsedError;
  @JsonKey(name: 'specialiteMedecin')
  String? get specialiteMedecin => throw _privateConstructorUsedError;
  @JsonKey(name: 'typeDiabete')
  String? get typeDiabete => throw _privateConstructorUsedError;
  @JsonKey(name: 'testeProduit')
  String? get testeProduit => throw _privateConstructorUsedError;
  @JsonKey(name: 'resultatTest')
  String? get resultatTest => throw _privateConstructorUsedError;

  /// Serializes this ContactCreateUpdate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContactCreateUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactCreateUpdateCopyWith<ContactCreateUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCreateUpdateCopyWith<$Res> {
  factory $ContactCreateUpdateCopyWith(
          ContactCreateUpdate value, $Res Function(ContactCreateUpdate) then) =
      _$ContactCreateUpdateCopyWithImpl<$Res, ContactCreateUpdate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'categorie') String categorie,
      @JsonKey(name: 'nom') String nom,
      @JsonKey(name: 'prenom') String? prenom,
      @JsonKey(name: 'wilayaId') String wilayaId,
      @JsonKey(name: 'regionLib') String? regionLib,
      @JsonKey(name: 'vilId') String? vilId,
      @JsonKey(name: 'delegueId') int? delegueId,
      @JsonKey(name: 'ville') String? ville,
      @JsonKey(name: 'adresse') String? adresse,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'tel1') String? tel1,
      @JsonKey(name: 'tel2') String? tel2,
      @JsonKey(name: 'rcCode') String? rcCode,
      @JsonKey(name: 'fiscalCode') String? fiscalCode,
      @JsonKey(name: 'nis') String? nis,
      @JsonKey(name: 'articleCode') String? articleCode,
      @JsonKey(name: 'specialite') String? specialite,
      @JsonKey(name: 'potentiel') String? potentiel,
      @JsonKey(name: 'connaissanceProduit') String? connaissanceProduit,
      @JsonKey(name: 'prescripteur') String? prescripteur,
      @JsonKey(name: 'objections') String? objections,
      @JsonKey(name: 'medecinTraitant') String? medecinTraitant,
      @JsonKey(name: 'specialiteMedecin') String? specialiteMedecin,
      @JsonKey(name: 'typeDiabete') String? typeDiabete,
      @JsonKey(name: 'testeProduit') String? testeProduit,
      @JsonKey(name: 'resultatTest') String? resultatTest});
}

/// @nodoc
class _$ContactCreateUpdateCopyWithImpl<$Res, $Val extends ContactCreateUpdate>
    implements $ContactCreateUpdateCopyWith<$Res> {
  _$ContactCreateUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactCreateUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categorie = null,
    Object? nom = null,
    Object? prenom = freezed,
    Object? wilayaId = null,
    Object? regionLib = freezed,
    Object? vilId = freezed,
    Object? delegueId = freezed,
    Object? ville = freezed,
    Object? adresse = freezed,
    Object? email = freezed,
    Object? tel1 = freezed,
    Object? tel2 = freezed,
    Object? rcCode = freezed,
    Object? fiscalCode = freezed,
    Object? nis = freezed,
    Object? articleCode = freezed,
    Object? specialite = freezed,
    Object? potentiel = freezed,
    Object? connaissanceProduit = freezed,
    Object? prescripteur = freezed,
    Object? objections = freezed,
    Object? medecinTraitant = freezed,
    Object? specialiteMedecin = freezed,
    Object? typeDiabete = freezed,
    Object? testeProduit = freezed,
    Object? resultatTest = freezed,
  }) {
    return _then(_value.copyWith(
      categorie: null == categorie
          ? _value.categorie
          : categorie // ignore: cast_nullable_to_non_nullable
              as String,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      prenom: freezed == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String?,
      wilayaId: null == wilayaId
          ? _value.wilayaId
          : wilayaId // ignore: cast_nullable_to_non_nullable
              as String,
      regionLib: freezed == regionLib
          ? _value.regionLib
          : regionLib // ignore: cast_nullable_to_non_nullable
              as String?,
      vilId: freezed == vilId
          ? _value.vilId
          : vilId // ignore: cast_nullable_to_non_nullable
              as String?,
      delegueId: freezed == delegueId
          ? _value.delegueId
          : delegueId // ignore: cast_nullable_to_non_nullable
              as int?,
      ville: freezed == ville
          ? _value.ville
          : ville // ignore: cast_nullable_to_non_nullable
              as String?,
      adresse: freezed == adresse
          ? _value.adresse
          : adresse // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      tel1: freezed == tel1
          ? _value.tel1
          : tel1 // ignore: cast_nullable_to_non_nullable
              as String?,
      tel2: freezed == tel2
          ? _value.tel2
          : tel2 // ignore: cast_nullable_to_non_nullable
              as String?,
      rcCode: freezed == rcCode
          ? _value.rcCode
          : rcCode // ignore: cast_nullable_to_non_nullable
              as String?,
      fiscalCode: freezed == fiscalCode
          ? _value.fiscalCode
          : fiscalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      nis: freezed == nis
          ? _value.nis
          : nis // ignore: cast_nullable_to_non_nullable
              as String?,
      articleCode: freezed == articleCode
          ? _value.articleCode
          : articleCode // ignore: cast_nullable_to_non_nullable
              as String?,
      specialite: freezed == specialite
          ? _value.specialite
          : specialite // ignore: cast_nullable_to_non_nullable
              as String?,
      potentiel: freezed == potentiel
          ? _value.potentiel
          : potentiel // ignore: cast_nullable_to_non_nullable
              as String?,
      connaissanceProduit: freezed == connaissanceProduit
          ? _value.connaissanceProduit
          : connaissanceProduit // ignore: cast_nullable_to_non_nullable
              as String?,
      prescripteur: freezed == prescripteur
          ? _value.prescripteur
          : prescripteur // ignore: cast_nullable_to_non_nullable
              as String?,
      objections: freezed == objections
          ? _value.objections
          : objections // ignore: cast_nullable_to_non_nullable
              as String?,
      medecinTraitant: freezed == medecinTraitant
          ? _value.medecinTraitant
          : medecinTraitant // ignore: cast_nullable_to_non_nullable
              as String?,
      specialiteMedecin: freezed == specialiteMedecin
          ? _value.specialiteMedecin
          : specialiteMedecin // ignore: cast_nullable_to_non_nullable
              as String?,
      typeDiabete: freezed == typeDiabete
          ? _value.typeDiabete
          : typeDiabete // ignore: cast_nullable_to_non_nullable
              as String?,
      testeProduit: freezed == testeProduit
          ? _value.testeProduit
          : testeProduit // ignore: cast_nullable_to_non_nullable
              as String?,
      resultatTest: freezed == resultatTest
          ? _value.resultatTest
          : resultatTest // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactCreateUpdateImplCopyWith<$Res>
    implements $ContactCreateUpdateCopyWith<$Res> {
  factory _$$ContactCreateUpdateImplCopyWith(_$ContactCreateUpdateImpl value,
          $Res Function(_$ContactCreateUpdateImpl) then) =
      __$$ContactCreateUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'categorie') String categorie,
      @JsonKey(name: 'nom') String nom,
      @JsonKey(name: 'prenom') String? prenom,
      @JsonKey(name: 'wilayaId') String wilayaId,
      @JsonKey(name: 'regionLib') String? regionLib,
      @JsonKey(name: 'vilId') String? vilId,
      @JsonKey(name: 'delegueId') int? delegueId,
      @JsonKey(name: 'ville') String? ville,
      @JsonKey(name: 'adresse') String? adresse,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'tel1') String? tel1,
      @JsonKey(name: 'tel2') String? tel2,
      @JsonKey(name: 'rcCode') String? rcCode,
      @JsonKey(name: 'fiscalCode') String? fiscalCode,
      @JsonKey(name: 'nis') String? nis,
      @JsonKey(name: 'articleCode') String? articleCode,
      @JsonKey(name: 'specialite') String? specialite,
      @JsonKey(name: 'potentiel') String? potentiel,
      @JsonKey(name: 'connaissanceProduit') String? connaissanceProduit,
      @JsonKey(name: 'prescripteur') String? prescripteur,
      @JsonKey(name: 'objections') String? objections,
      @JsonKey(name: 'medecinTraitant') String? medecinTraitant,
      @JsonKey(name: 'specialiteMedecin') String? specialiteMedecin,
      @JsonKey(name: 'typeDiabete') String? typeDiabete,
      @JsonKey(name: 'testeProduit') String? testeProduit,
      @JsonKey(name: 'resultatTest') String? resultatTest});
}

/// @nodoc
class __$$ContactCreateUpdateImplCopyWithImpl<$Res>
    extends _$ContactCreateUpdateCopyWithImpl<$Res, _$ContactCreateUpdateImpl>
    implements _$$ContactCreateUpdateImplCopyWith<$Res> {
  __$$ContactCreateUpdateImplCopyWithImpl(_$ContactCreateUpdateImpl _value,
      $Res Function(_$ContactCreateUpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactCreateUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categorie = null,
    Object? nom = null,
    Object? prenom = freezed,
    Object? wilayaId = null,
    Object? regionLib = freezed,
    Object? vilId = freezed,
    Object? delegueId = freezed,
    Object? ville = freezed,
    Object? adresse = freezed,
    Object? email = freezed,
    Object? tel1 = freezed,
    Object? tel2 = freezed,
    Object? rcCode = freezed,
    Object? fiscalCode = freezed,
    Object? nis = freezed,
    Object? articleCode = freezed,
    Object? specialite = freezed,
    Object? potentiel = freezed,
    Object? connaissanceProduit = freezed,
    Object? prescripteur = freezed,
    Object? objections = freezed,
    Object? medecinTraitant = freezed,
    Object? specialiteMedecin = freezed,
    Object? typeDiabete = freezed,
    Object? testeProduit = freezed,
    Object? resultatTest = freezed,
  }) {
    return _then(_$ContactCreateUpdateImpl(
      categorie: null == categorie
          ? _value.categorie
          : categorie // ignore: cast_nullable_to_non_nullable
              as String,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      prenom: freezed == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String?,
      wilayaId: null == wilayaId
          ? _value.wilayaId
          : wilayaId // ignore: cast_nullable_to_non_nullable
              as String,
      regionLib: freezed == regionLib
          ? _value.regionLib
          : regionLib // ignore: cast_nullable_to_non_nullable
              as String?,
      vilId: freezed == vilId
          ? _value.vilId
          : vilId // ignore: cast_nullable_to_non_nullable
              as String?,
      delegueId: freezed == delegueId
          ? _value.delegueId
          : delegueId // ignore: cast_nullable_to_non_nullable
              as int?,
      ville: freezed == ville
          ? _value.ville
          : ville // ignore: cast_nullable_to_non_nullable
              as String?,
      adresse: freezed == adresse
          ? _value.adresse
          : adresse // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      tel1: freezed == tel1
          ? _value.tel1
          : tel1 // ignore: cast_nullable_to_non_nullable
              as String?,
      tel2: freezed == tel2
          ? _value.tel2
          : tel2 // ignore: cast_nullable_to_non_nullable
              as String?,
      rcCode: freezed == rcCode
          ? _value.rcCode
          : rcCode // ignore: cast_nullable_to_non_nullable
              as String?,
      fiscalCode: freezed == fiscalCode
          ? _value.fiscalCode
          : fiscalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      nis: freezed == nis
          ? _value.nis
          : nis // ignore: cast_nullable_to_non_nullable
              as String?,
      articleCode: freezed == articleCode
          ? _value.articleCode
          : articleCode // ignore: cast_nullable_to_non_nullable
              as String?,
      specialite: freezed == specialite
          ? _value.specialite
          : specialite // ignore: cast_nullable_to_non_nullable
              as String?,
      potentiel: freezed == potentiel
          ? _value.potentiel
          : potentiel // ignore: cast_nullable_to_non_nullable
              as String?,
      connaissanceProduit: freezed == connaissanceProduit
          ? _value.connaissanceProduit
          : connaissanceProduit // ignore: cast_nullable_to_non_nullable
              as String?,
      prescripteur: freezed == prescripteur
          ? _value.prescripteur
          : prescripteur // ignore: cast_nullable_to_non_nullable
              as String?,
      objections: freezed == objections
          ? _value.objections
          : objections // ignore: cast_nullable_to_non_nullable
              as String?,
      medecinTraitant: freezed == medecinTraitant
          ? _value.medecinTraitant
          : medecinTraitant // ignore: cast_nullable_to_non_nullable
              as String?,
      specialiteMedecin: freezed == specialiteMedecin
          ? _value.specialiteMedecin
          : specialiteMedecin // ignore: cast_nullable_to_non_nullable
              as String?,
      typeDiabete: freezed == typeDiabete
          ? _value.typeDiabete
          : typeDiabete // ignore: cast_nullable_to_non_nullable
              as String?,
      testeProduit: freezed == testeProduit
          ? _value.testeProduit
          : testeProduit // ignore: cast_nullable_to_non_nullable
              as String?,
      resultatTest: freezed == resultatTest
          ? _value.resultatTest
          : resultatTest // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactCreateUpdateImpl implements _ContactCreateUpdate {
  const _$ContactCreateUpdateImpl(
      {@JsonKey(name: 'categorie') required this.categorie,
      @JsonKey(name: 'nom') required this.nom,
      @JsonKey(name: 'prenom') this.prenom,
      @JsonKey(name: 'wilayaId') required this.wilayaId,
      @JsonKey(name: 'regionLib') this.regionLib,
      @JsonKey(name: 'vilId') this.vilId,
      @JsonKey(name: 'delegueId') this.delegueId,
      @JsonKey(name: 'ville') this.ville,
      @JsonKey(name: 'adresse') this.adresse,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'tel1') this.tel1,
      @JsonKey(name: 'tel2') this.tel2,
      @JsonKey(name: 'rcCode') this.rcCode,
      @JsonKey(name: 'fiscalCode') this.fiscalCode,
      @JsonKey(name: 'nis') this.nis,
      @JsonKey(name: 'articleCode') this.articleCode,
      @JsonKey(name: 'specialite') this.specialite,
      @JsonKey(name: 'potentiel') this.potentiel,
      @JsonKey(name: 'connaissanceProduit') this.connaissanceProduit,
      @JsonKey(name: 'prescripteur') this.prescripteur,
      @JsonKey(name: 'objections') this.objections,
      @JsonKey(name: 'medecinTraitant') this.medecinTraitant,
      @JsonKey(name: 'specialiteMedecin') this.specialiteMedecin,
      @JsonKey(name: 'typeDiabete') this.typeDiabete,
      @JsonKey(name: 'testeProduit') this.testeProduit,
      @JsonKey(name: 'resultatTest') this.resultatTest});

  factory _$ContactCreateUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactCreateUpdateImplFromJson(json);

  @override
  @JsonKey(name: 'categorie')
  final String categorie;
  @override
  @JsonKey(name: 'nom')
  final String nom;
  @override
  @JsonKey(name: 'prenom')
  final String? prenom;
  @override
  @JsonKey(name: 'wilayaId')
  final String wilayaId;
  @override
  @JsonKey(name: 'regionLib')
  final String? regionLib;
  @override
  @JsonKey(name: 'vilId')
  final String? vilId;
  @override
  @JsonKey(name: 'delegueId')
  final int? delegueId;
  @override
  @JsonKey(name: 'ville')
  final String? ville;
  @override
  @JsonKey(name: 'adresse')
  final String? adresse;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'tel1')
  final String? tel1;
  @override
  @JsonKey(name: 'tel2')
  final String? tel2;
// Pharmacien extras
  @override
  @JsonKey(name: 'rcCode')
  final String? rcCode;
  @override
  @JsonKey(name: 'fiscalCode')
  final String? fiscalCode;
  @override
  @JsonKey(name: 'nis')
  final String? nis;
  @override
  @JsonKey(name: 'articleCode')
  final String? articleCode;
// Médecin extras
  @override
  @JsonKey(name: 'specialite')
  final String? specialite;
  @override
  @JsonKey(name: 'potentiel')
  final String? potentiel;
  @override
  @JsonKey(name: 'connaissanceProduit')
  final String? connaissanceProduit;
  @override
  @JsonKey(name: 'prescripteur')
  final String? prescripteur;
  @override
  @JsonKey(name: 'objections')
  final String? objections;
// Patient extras (new)
  @override
  @JsonKey(name: 'medecinTraitant')
  final String? medecinTraitant;
  @override
  @JsonKey(name: 'specialiteMedecin')
  final String? specialiteMedecin;
  @override
  @JsonKey(name: 'typeDiabete')
  final String? typeDiabete;
  @override
  @JsonKey(name: 'testeProduit')
  final String? testeProduit;
  @override
  @JsonKey(name: 'resultatTest')
  final String? resultatTest;

  @override
  String toString() {
    return 'ContactCreateUpdate(categorie: $categorie, nom: $nom, prenom: $prenom, wilayaId: $wilayaId, regionLib: $regionLib, vilId: $vilId, delegueId: $delegueId, ville: $ville, adresse: $adresse, email: $email, tel1: $tel1, tel2: $tel2, rcCode: $rcCode, fiscalCode: $fiscalCode, nis: $nis, articleCode: $articleCode, specialite: $specialite, potentiel: $potentiel, connaissanceProduit: $connaissanceProduit, prescripteur: $prescripteur, objections: $objections, medecinTraitant: $medecinTraitant, specialiteMedecin: $specialiteMedecin, typeDiabete: $typeDiabete, testeProduit: $testeProduit, resultatTest: $resultatTest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactCreateUpdateImpl &&
            (identical(other.categorie, categorie) ||
                other.categorie == categorie) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.wilayaId, wilayaId) ||
                other.wilayaId == wilayaId) &&
            (identical(other.regionLib, regionLib) ||
                other.regionLib == regionLib) &&
            (identical(other.vilId, vilId) || other.vilId == vilId) &&
            (identical(other.delegueId, delegueId) ||
                other.delegueId == delegueId) &&
            (identical(other.ville, ville) || other.ville == ville) &&
            (identical(other.adresse, adresse) || other.adresse == adresse) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.tel1, tel1) || other.tel1 == tel1) &&
            (identical(other.tel2, tel2) || other.tel2 == tel2) &&
            (identical(other.rcCode, rcCode) || other.rcCode == rcCode) &&
            (identical(other.fiscalCode, fiscalCode) ||
                other.fiscalCode == fiscalCode) &&
            (identical(other.nis, nis) || other.nis == nis) &&
            (identical(other.articleCode, articleCode) ||
                other.articleCode == articleCode) &&
            (identical(other.specialite, specialite) ||
                other.specialite == specialite) &&
            (identical(other.potentiel, potentiel) ||
                other.potentiel == potentiel) &&
            (identical(other.connaissanceProduit, connaissanceProduit) ||
                other.connaissanceProduit == connaissanceProduit) &&
            (identical(other.prescripteur, prescripteur) ||
                other.prescripteur == prescripteur) &&
            (identical(other.objections, objections) ||
                other.objections == objections) &&
            (identical(other.medecinTraitant, medecinTraitant) ||
                other.medecinTraitant == medecinTraitant) &&
            (identical(other.specialiteMedecin, specialiteMedecin) ||
                other.specialiteMedecin == specialiteMedecin) &&
            (identical(other.typeDiabete, typeDiabete) ||
                other.typeDiabete == typeDiabete) &&
            (identical(other.testeProduit, testeProduit) ||
                other.testeProduit == testeProduit) &&
            (identical(other.resultatTest, resultatTest) ||
                other.resultatTest == resultatTest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        categorie,
        nom,
        prenom,
        wilayaId,
        regionLib,
        vilId,
        delegueId,
        ville,
        adresse,
        email,
        tel1,
        tel2,
        rcCode,
        fiscalCode,
        nis,
        articleCode,
        specialite,
        potentiel,
        connaissanceProduit,
        prescripteur,
        objections,
        medecinTraitant,
        specialiteMedecin,
        typeDiabete,
        testeProduit,
        resultatTest
      ]);

  /// Create a copy of ContactCreateUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactCreateUpdateImplCopyWith<_$ContactCreateUpdateImpl> get copyWith =>
      __$$ContactCreateUpdateImplCopyWithImpl<_$ContactCreateUpdateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactCreateUpdateImplToJson(
      this,
    );
  }
}

abstract class _ContactCreateUpdate implements ContactCreateUpdate {
  const factory _ContactCreateUpdate(
      {@JsonKey(name: 'categorie') required final String categorie,
      @JsonKey(name: 'nom') required final String nom,
      @JsonKey(name: 'prenom') final String? prenom,
      @JsonKey(name: 'wilayaId') required final String wilayaId,
      @JsonKey(name: 'regionLib') final String? regionLib,
      @JsonKey(name: 'vilId') final String? vilId,
      @JsonKey(name: 'delegueId') final int? delegueId,
      @JsonKey(name: 'ville') final String? ville,
      @JsonKey(name: 'adresse') final String? adresse,
      @JsonKey(name: 'email') final String? email,
      @JsonKey(name: 'tel1') final String? tel1,
      @JsonKey(name: 'tel2') final String? tel2,
      @JsonKey(name: 'rcCode') final String? rcCode,
      @JsonKey(name: 'fiscalCode') final String? fiscalCode,
      @JsonKey(name: 'nis') final String? nis,
      @JsonKey(name: 'articleCode') final String? articleCode,
      @JsonKey(name: 'specialite') final String? specialite,
      @JsonKey(name: 'potentiel') final String? potentiel,
      @JsonKey(name: 'connaissanceProduit') final String? connaissanceProduit,
      @JsonKey(name: 'prescripteur') final String? prescripteur,
      @JsonKey(name: 'objections') final String? objections,
      @JsonKey(name: 'medecinTraitant') final String? medecinTraitant,
      @JsonKey(name: 'specialiteMedecin') final String? specialiteMedecin,
      @JsonKey(name: 'typeDiabete') final String? typeDiabete,
      @JsonKey(name: 'testeProduit') final String? testeProduit,
      @JsonKey(name: 'resultatTest')
      final String? resultatTest}) = _$ContactCreateUpdateImpl;

  factory _ContactCreateUpdate.fromJson(Map<String, dynamic> json) =
      _$ContactCreateUpdateImpl.fromJson;

  @override
  @JsonKey(name: 'categorie')
  String get categorie;
  @override
  @JsonKey(name: 'nom')
  String get nom;
  @override
  @JsonKey(name: 'prenom')
  String? get prenom;
  @override
  @JsonKey(name: 'wilayaId')
  String get wilayaId;
  @override
  @JsonKey(name: 'regionLib')
  String? get regionLib;
  @override
  @JsonKey(name: 'vilId')
  String? get vilId;
  @override
  @JsonKey(name: 'delegueId')
  int? get delegueId;
  @override
  @JsonKey(name: 'ville')
  String? get ville;
  @override
  @JsonKey(name: 'adresse')
  String? get adresse;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'tel1')
  String? get tel1;
  @override
  @JsonKey(name: 'tel2')
  String? get tel2; // Pharmacien extras
  @override
  @JsonKey(name: 'rcCode')
  String? get rcCode;
  @override
  @JsonKey(name: 'fiscalCode')
  String? get fiscalCode;
  @override
  @JsonKey(name: 'nis')
  String? get nis;
  @override
  @JsonKey(name: 'articleCode')
  String? get articleCode; // Médecin extras
  @override
  @JsonKey(name: 'specialite')
  String? get specialite;
  @override
  @JsonKey(name: 'potentiel')
  String? get potentiel;
  @override
  @JsonKey(name: 'connaissanceProduit')
  String? get connaissanceProduit;
  @override
  @JsonKey(name: 'prescripteur')
  String? get prescripteur;
  @override
  @JsonKey(name: 'objections')
  String? get objections; // Patient extras (new)
  @override
  @JsonKey(name: 'medecinTraitant')
  String? get medecinTraitant;
  @override
  @JsonKey(name: 'specialiteMedecin')
  String? get specialiteMedecin;
  @override
  @JsonKey(name: 'typeDiabete')
  String? get typeDiabete;
  @override
  @JsonKey(name: 'testeProduit')
  String? get testeProduit;
  @override
  @JsonKey(name: 'resultatTest')
  String? get resultatTest;

  /// Create a copy of ContactCreateUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactCreateUpdateImplCopyWith<_$ContactCreateUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
