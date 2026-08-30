// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DelegateRealizationImpl _$$DelegateRealizationImplFromJson(
        Map<String, dynamic> json) =>
    _$DelegateRealizationImpl(
      companyId: (json['companyId'] as num).toInt(),
      year: (json['year'] as num).toInt(),
      month: (json['month'] as num).toInt(),
      delegateId: (json['delegateId'] as num).toInt(),
      delegateType: json['delegateType'] as String,
      delegue: json['delegue'] as String,
      medId: (json['medId'] as num).toInt(),
      medAmm: json['medAmm'] as String?,
      medCommercialName: json['medCommercialName'] as String,
      qteObj: (json['qteObj'] as num?)?.toInt(),
      qteVendue: (json['qteVendue'] as num).toInt(),
      nbrCde: (json['nbrCde'] as num).toInt(),
      txReal: (json['txReal'] as num).toInt(),
    );

Map<String, dynamic> _$$DelegateRealizationImplToJson(
        _$DelegateRealizationImpl instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'year': instance.year,
      'month': instance.month,
      'delegateId': instance.delegateId,
      'delegateType': instance.delegateType,
      'delegue': instance.delegue,
      'medId': instance.medId,
      'medAmm': instance.medAmm,
      'medCommercialName': instance.medCommercialName,
      'qteObj': instance.qteObj,
      'qteVendue': instance.qteVendue,
      'nbrCde': instance.nbrCde,
      'txReal': instance.txReal,
    };
