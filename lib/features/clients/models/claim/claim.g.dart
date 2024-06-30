// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClaimImpl _$$ClaimImplFromJson(Map<String, dynamic> json) => _$ClaimImpl(
      pharmacieId: (json['pharmacieId'] as num).toInt(),
      date: json['date'] as String,
      type: (json['type'] as num).toInt(),
      titre: json['titre'] as String,
      motif: json['motif'] as String,
      rapport: json['rapport'] as String,
      rapportText: json['rapportText'] as String,
    );

Map<String, dynamic> _$$ClaimImplToJson(_$ClaimImpl instance) =>
    <String, dynamic>{
      'pharmacieId': instance.pharmacieId,
      'date': instance.date,
      'type': instance.type,
      'titre': instance.titre,
      'motif': instance.motif,
      'rapport': instance.rapport,
      'rapportText': instance.rapportText,
    };
