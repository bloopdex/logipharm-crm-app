// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      cpsCmpId: (json['cpsCmpId'] as num).toInt(),
      cpsTerId: (json['cpsTerId'] as num).toInt(),
      cpsTerType: json['cpsTerType'] as String,
      no: (json['no'] as num).toInt(),
      commercialName: json['commercialName'] as String,
      datePeremption: DateTime.parse(json['datePeremption'] as String),
      prixPpa: (json['prixPpa'] as num).toDouble(),
      qte: (json['qte'] as num).toDouble(),
      prixPh: (json['prixPh'] as num).toDouble(),
      txRistourne: (json['txRistourne'] as num?)?.toDouble(),
      montant: json['montant'] as num?,
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'cpsCmpId': instance.cpsCmpId,
      'cpsTerId': instance.cpsTerId,
      'cpsTerType': instance.cpsTerType,
      'no': instance.no,
      'commercialName': instance.commercialName,
      'datePeremption': instance.datePeremption.toIso8601String(),
      'prixPpa': instance.prixPpa,
      'qte': instance.qte,
      'prixPh': instance.prixPh,
      'txRistourne': instance.txRistourne,
      'montant': instance.montant,
    };
