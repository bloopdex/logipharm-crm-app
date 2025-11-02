// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      cmpId: (json['cmpId'] as num).toInt(),
      prdId: (json['prdId'] as num).toInt(),
      medId: (json['medId'] as num).toInt(),
      stkCode: json['stkCode'] as String,
      commercialName: json['commercialName'] as String,
      attribut2: json['attribut2'] as String?,
      nlot: json['nlot'] as String,
      datePeremption: DateTime.parse(json['datePeremption'] as String),
      prixPpa: (json['prixPpa'] as num).toDouble(),
      qte: (json['qte'] as num).toDouble(),
      prixPh: (json['prixPh'] as num).toDouble(),
      prixGr: (json['prixGr'] as num?)?.toInt(),
      prixShp: (json['prixShp'] as num).toDouble(),
      ugVnete: (json['ugVnete'] as num?)?.toDouble(),
      etatFlag: json['etatFlag'] as bool?,
      creerDate: DateTime.parse(json['creerDate'] as String),
      colis: (json['colis'] as num?)?.toDouble(),
      objectif: (json['objectif'] as num?)?.toDouble(),
      laboratoire: json['laboratoire'] as String?,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'cmpId': instance.cmpId,
      'prdId': instance.prdId,
      'medId': instance.medId,
      'stkCode': instance.stkCode,
      'commercialName': instance.commercialName,
      'attribut2': instance.attribut2,
      'nlot': instance.nlot,
      'datePeremption': instance.datePeremption.toIso8601String(),
      'prixPpa': instance.prixPpa,
      'qte': instance.qte,
      'prixPh': instance.prixPh,
      'prixGr': instance.prixGr,
      'prixShp': instance.prixShp,
      'ugVnete': instance.ugVnete,
      'etatFlag': instance.etatFlag,
      'creerDate': instance.creerDate.toIso8601String(),
      'colis': instance.colis,
      'objectif': instance.objectif,
      'laboratoire': instance.laboratoire,
    };
