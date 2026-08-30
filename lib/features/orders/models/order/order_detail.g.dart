// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderDetailImpl _$$OrderDetailImplFromJson(Map<String, dynamic> json) =>
    _$OrderDetailImpl(
      companyId: (json['companyId'] as num).toInt(),
      orderId: (json['orderId'] as num).toInt(),
      orderType: json['orderType'] as String,
      stockCode: json['stockCode'] as String,
      date: DateTime.parse(json['date'] as String),
      reference: json['reference'] as String,
      codeStatut: (json['codeStatut'] as num).toInt(),
      statut: json['statut'] as String,
      terId: (json['terId'] as num).toInt(),
      fournisseurId: (json['fournisseurId'] as num).toInt(),
      fournisseurType: (json['fournisseurType'] ?? '').toString(),
      client: json['client'] as String,
      delegue: json['delegue'] as String,
      medId: (json['medId'] as num).toInt(),
      medAmm: json['medAmm'] as String?,
      medCommercialName: json['medCommercialName'] as String,
      lot: json['lot'] as String,
      datePeremption: DateTime.parse(json['datePeremption'] as String),
      prixPpa: (json['prixPpa'] as num).toDouble(),
      prixPh: (json['prixPh'] as num).toDouble(),
      qte: (json['qte'] as num).toDouble(),
      netHt: (json['netHt'] as num).toInt(),
      montTva: (json['montTva'] as num).toInt(),
      montTtc: (json['montTtc'] as num).toDouble(),
    );

Map<String, dynamic> _$$OrderDetailImplToJson(_$OrderDetailImpl instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'orderId': instance.orderId,
      'orderType': instance.orderType,
      'stockCode': instance.stockCode,
      'date': instance.date.toIso8601String(),
      'reference': instance.reference,
      'codeStatut': instance.codeStatut,
      'statut': instance.statut,
      'terId': instance.terId,
      'fournisseurId': instance.fournisseurId,
      'fournisseurType': instance.fournisseurType,
      'client': instance.client,
      'delegue': instance.delegue,
      'medId': instance.medId,
      'medAmm': instance.medAmm,
      'medCommercialName': instance.medCommercialName,
      'lot': instance.lot,
      'datePeremption': instance.datePeremption.toIso8601String(),
      'prixPpa': instance.prixPpa,
      'prixPh': instance.prixPh,
      'qte': instance.qte,
      'netHt': instance.netHt,
      'montTva': instance.montTva,
      'montTtc': instance.montTtc,
    };
