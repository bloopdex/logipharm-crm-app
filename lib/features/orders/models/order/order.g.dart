// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      companyId: (json['companyId'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      stockCode: json['stockCode'] as String,
      date: DateTime.parse(json['date'] as String),
      reference: json['reference'] as String,
      statut: json['statut'] as String,
      terId: (json['terId'] as num).toInt(),
      fournisseurId: (json['fournisseurId'] as num).toInt(),
      fournisseurType: (json['fournisseurType'] ?? '').toString(),
      client: json['client'] as String,
      delegue: json['delegue'] as String?,
      netHt: (json['netHt'] as num).toInt(),
      totalTva: (json['totalTva'] as num).toInt(),
      totalTtc: (json['totalTtc'] as num).toDouble(),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'id': instance.id,
      'type': instance.type,
      'stockCode': instance.stockCode,
      'date': instance.date.toIso8601String(),
      'reference': instance.reference,
      'statut': instance.statut,
      'terId': instance.terId,
      'fournisseurId': instance.fournisseurId,
      'fournisseurType': instance.fournisseurType,
      'client': instance.client,
      'delegue': instance.delegue,
      'netHt': instance.netHt,
      'totalTva': instance.totalTva,
      'totalTtc': instance.totalTtc,
    };
