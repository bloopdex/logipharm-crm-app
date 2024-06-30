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
      actionFlag: (json['actionFlag'] as num).toInt(),
      regionId: json['regionId'] as String?,
      address: json['adresse'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      supervisor: (json['superviseur'] as num?)?.toInt(),
      longitude: (json['longitude'] as num?)?.toDouble(),
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
    );

Map<String, dynamic> _$$PersonImplToJson(_$PersonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cmpId': instance.companyId,
      'typeTier': instance.typeTier,
      'nom': instance.lastName,
      'prenom': instance.firstName,
      'loginCode': instance.loginCode,
      'actionFlag': instance.actionFlag,
      'regionId': instance.regionId,
      'adresse': instance.address,
      'latitude': instance.latitude,
      'superviseur': instance.supervisor,
      'longitude': instance.longitude,
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
    };
