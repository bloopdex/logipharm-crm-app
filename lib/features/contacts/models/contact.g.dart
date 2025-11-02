// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactImpl _$$ContactImplFromJson(Map<String, dynamic> json) =>
    _$ContactImpl(
      id: (json['id'] as num?)?.toInt(),
      categorie: json['categorie'] as String?,
      nom: json['nom'] as String?,
      prenom: json['prenom'] as String?,
      wilayaId: json['wilayaId'] as String?,
      regionLib: json['regionLib'] as String?,
      vilId: json['vilId'] as String?,
      delegueId: (json['delegueId'] as num?)?.toInt(),
      ville: json['ville'] as String?,
      adresse: json['adresse'] as String?,
      email: json['email'] as String?,
      tel1: json['tel1'] as String?,
      tel2: json['tel2'] as String?,
      rcCode: json['rcCode'] as String?,
      fiscalCode: json['fiscalCode'] as String?,
      nis: json['nis'] as String?,
      articleCode: json['articleCode'] as String?,
      specialite: json['specialite'] as String?,
      potentiel: json['potentiel'] as String?,
      connaissanceProduit: json['connaissanceProduit'] as String?,
      prescripteur: json['prescripteur'] as String?,
      objections: json['objections'] as String?,
    );

Map<String, dynamic> _$$ContactImplToJson(_$ContactImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categorie': instance.categorie,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'wilayaId': instance.wilayaId,
      'regionLib': instance.regionLib,
      'vilId': instance.vilId,
      'delegueId': instance.delegueId,
      'ville': instance.ville,
      'adresse': instance.adresse,
      'email': instance.email,
      'tel1': instance.tel1,
      'tel2': instance.tel2,
      'rcCode': instance.rcCode,
      'fiscalCode': instance.fiscalCode,
      'nis': instance.nis,
      'articleCode': instance.articleCode,
      'specialite': instance.specialite,
      'potentiel': instance.potentiel,
      'connaissanceProduit': instance.connaissanceProduit,
      'prescripteur': instance.prescripteur,
      'objections': instance.objections,
    };

_$ContactCreateUpdateImpl _$$ContactCreateUpdateImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactCreateUpdateImpl(
      categorie: json['categorie'] as String,
      nom: json['nom'] as String,
      prenom: json['prenom'] as String?,
      wilayaId: json['wilayaId'] as String,
      regionLib: json['regionLib'] as String?,
      vilId: json['vilId'] as String?,
      delegueId: (json['delegueId'] as num?)?.toInt(),
      ville: json['ville'] as String?,
      adresse: json['adresse'] as String?,
      email: json['email'] as String?,
      tel1: json['tel1'] as String?,
      tel2: json['tel2'] as String?,
      rcCode: json['rcCode'] as String?,
      fiscalCode: json['fiscalCode'] as String?,
      nis: json['nis'] as String?,
      articleCode: json['articleCode'] as String?,
      specialite: json['specialite'] as String?,
      potentiel: json['potentiel'] as String?,
      connaissanceProduit: json['connaissanceProduit'] as String?,
      prescripteur: json['prescripteur'] as String?,
      objections: json['objections'] as String?,
    );

Map<String, dynamic> _$$ContactCreateUpdateImplToJson(
        _$ContactCreateUpdateImpl instance) =>
    <String, dynamic>{
      'categorie': instance.categorie,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'wilayaId': instance.wilayaId,
      'regionLib': instance.regionLib,
      'vilId': instance.vilId,
      'delegueId': instance.delegueId,
      'ville': instance.ville,
      'adresse': instance.adresse,
      'email': instance.email,
      'tel1': instance.tel1,
      'tel2': instance.tel2,
      'rcCode': instance.rcCode,
      'fiscalCode': instance.fiscalCode,
      'nis': instance.nis,
      'articleCode': instance.articleCode,
      'specialite': instance.specialite,
      'potentiel': instance.potentiel,
      'connaissanceProduit': instance.connaissanceProduit,
      'prescripteur': instance.prescripteur,
      'objections': instance.objections,
    };
