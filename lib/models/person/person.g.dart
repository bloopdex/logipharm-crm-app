// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonImpl _$$PersonImplFromJson(Map<String, dynamic> json) => _$PersonImpl(
      id: (json['id'] as num).toInt(),
      companyId: (json['cmpId'] as num).toInt(),
      typeTier: json['typeTier'] as String,
      lastName: json['nom'] as String,
      firstName: json['prenom'] as String?,
      loginCode: json['loginCode'] as String,
      activeFlag: (json['activeFlag'] as num).toInt(),
      regionId: json['regionId'] as String?,
      ville: json['ville'] as String?,
      address: json['adresse'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      supervisor: (json['superviseur'] as num?)?.toInt(),
      postalCode: json['codePostal'] as String?,
      postBox: json['boitePostale'] as String?,
      email: json['email'] as String?,
      website: json['siteWeb'] as String?,
      nisCode: json['nisCode'] as String?,
      nssCode: json['nssCode'] as String?,
      tel1Fixe: json['tel1Fixe'] as String?,
      tel2Fixe: json['tel2Fixe'] as String?,
      telMobile: json['telMobile'] as String?,
      fax: json['fax'] as String?,
      fullName: json['fullName'] as String,
      prospect: json['prospect'] as bool?,
      solvabilite: json['solvabilite'] == null
          ? null
          : Solvabilite.fromJson(json['solvabilite'] as Map<String, dynamic>),
      modePaie: json['modePaie'] == null
          ? null
          : ModePaie.fromJson(json['modePaie'] as Map<String, dynamic>),
      categoryLabel: json['categorieLibelle'] as String?,
      authorizedRadius: (json['authorizedRaduis'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PersonImplToJson(_$PersonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cmpId': instance.companyId,
      'typeTier': instance.typeTier,
      'nom': instance.lastName,
      'prenom': instance.firstName,
      'loginCode': instance.loginCode,
      'activeFlag': instance.activeFlag,
      'regionId': instance.regionId,
      'ville': instance.ville,
      'adresse': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'superviseur': instance.supervisor,
      'codePostal': instance.postalCode,
      'boitePostale': instance.postBox,
      'email': instance.email,
      'siteWeb': instance.website,
      'nisCode': instance.nisCode,
      'nssCode': instance.nssCode,
      'tel1Fixe': instance.tel1Fixe,
      'tel2Fixe': instance.tel2Fixe,
      'telMobile': instance.telMobile,
      'fax': instance.fax,
      'fullName': instance.fullName,
      'prospect': instance.prospect,
      'solvabilite': instance.solvabilite,
      'modePaie': instance.modePaie,
      'categorieLibelle': instance.categoryLabel,
      'authorizedRaduis': instance.authorizedRadius,
    };

_$SolvabiliteImpl _$$SolvabiliteImplFromJson(Map<String, dynamic> json) =>
    _$SolvabiliteImpl(
      id: (json['id'] as num).toInt(),
      label: json['label'] as String,
    );

Map<String, dynamic> _$$SolvabiliteImplToJson(_$SolvabiliteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
    };

_$ModePaieImpl _$$ModePaieImplFromJson(Map<String, dynamic> json) =>
    _$ModePaieImpl(
      id: (json['id'] as num).toInt(),
      label: json['label'] as String,
    );

Map<String, dynamic> _$$ModePaieImplToJson(_$ModePaieImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
    };
