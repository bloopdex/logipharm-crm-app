// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientReclamationImpl _$$ClientReclamationImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientReclamationImpl(
      status: json['statutLigne'] as String,
      number: (json['number'] as num).toInt(),
    );

Map<String, dynamic> _$$ClientReclamationImplToJson(
        _$ClientReclamationImpl instance) =>
    <String, dynamic>{
      'statutLigne': instance.status,
      'number': instance.number,
    };

_$ClientStatisticsImpl _$$ClientStatisticsImplFromJson(
        Map<String, dynamic> json) =>
    _$ClientStatisticsImpl(
      companyId: json['companyId'] as num?,
      clientId: json['clientId'] as num?,
      commercialBlockage: json['blocageCommercial'] as bool,
      financialBlockage: json['blocageFinancier'] as bool,
      totalHt: json['totalHt'] as num,
      totalTtc: json['totalTtc'] as num,
      ceiling: json['plafond'] as num,
      totalRest: json['totalReste'] as num,
      totalPayment: json['totalReglement'] as num,
      clientReclamations: (json['reclamations'] as List<dynamic>)
          .map((e) => ClientReclamation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ClientStatisticsImplToJson(
        _$ClientStatisticsImpl instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'clientId': instance.clientId,
      'blocageCommercial': instance.commercialBlockage,
      'blocageFinancier': instance.financialBlockage,
      'totalHt': instance.totalHt,
      'totalTtc': instance.totalTtc,
      'plafond': instance.ceiling,
      'totalReste': instance.totalRest,
      'totalReglement': instance.totalPayment,
      'reclamations': instance.clientReclamations,
    };
