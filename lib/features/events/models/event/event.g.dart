// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      id: json['id'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      type: (json['type'] as num?)?.toInt(),
      titre: json['titre'] as String?,
      motif: json['motif'] as String?,
      repport: json['repport'] as String?,
      repportText: json['repportText'] as String?,
      att1: json['att1'] as String?,
      att2: json['att2'] as String?,
      att3: json['att3'] as String?,
      att4: json['att4'] as String?,
      att5: json['att5'] as String?,
      att6: (json['att6'] as num?)?.toInt(),
      att7: (json['att7'] as num?)?.toInt(),
      att8: (json['att8'] as num?)?.toInt(),
      att9: (json['att9'] as num?)?.toInt(),
      att10: (json['att10'] as num?)?.toInt(),
      att11: json['att11'] == null
          ? null
          : DateTime.parse(json['att11'] as String),
      att12: json['att12'] == null
          ? null
          : DateTime.parse(json['att12'] as String),
      att13: json['att13'] == null
          ? null
          : DateTime.parse(json['att13'] as String),
      att14: json['att14'] == null
          ? null
          : DateTime.parse(json['att14'] as String),
      creerPar: json['creerPar'] as String?,
      creerDate: json['creerDate'] == null
          ? null
          : DateTime.parse(json['creerDate'] as String),
      modifierPar: json['modifierPar'] as String?,
      modifierDate: json['modifierDate'] == null
          ? null
          : DateTime.parse(json['modifierDate'] as String),
      statut: json['statut'] as String?,
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'type': instance.type,
      'titre': instance.titre,
      'motif': instance.motif,
      'repport': instance.repport,
      'repportText': instance.repportText,
      'att1': instance.att1,
      'att2': instance.att2,
      'att3': instance.att3,
      'att4': instance.att4,
      'att5': instance.att5,
      'att6': instance.att6,
      'att7': instance.att7,
      'att8': instance.att8,
      'att9': instance.att9,
      'att10': instance.att10,
      'att11': instance.att11?.toIso8601String(),
      'att12': instance.att12?.toIso8601String(),
      'att13': instance.att13?.toIso8601String(),
      'att14': instance.att14?.toIso8601String(),
      'creerPar': instance.creerPar,
      'creerDate': instance.creerDate?.toIso8601String(),
      'modifierPar': instance.modifierPar,
      'modifierDate': instance.modifierDate?.toIso8601String(),
      'statut': instance.statut,
    };
