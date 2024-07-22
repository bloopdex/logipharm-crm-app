// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commune.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommuneImpl _$$CommuneImplFromJson(Map<String, dynamic> json) =>
    _$CommuneImpl(
      code: json['code'] as String,
      name: json['nom'] as String,
      wlyCode: json['wlyCode'] as String,
    );

Map<String, dynamic> _$$CommuneImplToJson(_$CommuneImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'nom': instance.name,
      'wlyCode': instance.wlyCode,
    };
