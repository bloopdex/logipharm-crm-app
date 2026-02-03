// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ObservationImpl _$$ObservationImplFromJson(Map<String, dynamic> json) =>
    _$ObservationImpl(
      pharmacyId: (json['pharmacieId'] as num).toInt(),
      date: json['date'] as String,
      type: (json['type'] as num).toInt(),
      title: json['titre'] as String,
      reason: json['motif'] as String?,
      report: json['rapport'] as String?,
      reportText: json['rapportText'] as String?,
      fournisseurId: (json['fournisseurId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ObservationImplToJson(_$ObservationImpl instance) =>
    <String, dynamic>{
      'pharmacieId': instance.pharmacyId,
      'date': instance.date,
      'type': instance.type,
      'titre': instance.title,
      'motif': instance.reason,
      'rapport': instance.report,
      'rapportText': instance.reportText,
      'fournisseurId': instance.fournisseurId,
    };
