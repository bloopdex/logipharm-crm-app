// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palier_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PalierDtoImpl _$$PalierDtoImplFromJson(Map<String, dynamic> json) =>
    _$PalierDtoImpl(
      companyId: (json['companyId'] as num?)?.toInt(),
      offerId: (json['offerId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      valMin: json['valMin'] as num?,
      valMax: json['valMax'] as num?,
      valeur: json['valeur'] as num?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$PalierDtoImplToJson(_$PalierDtoImpl instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'offerId': instance.offerId,
      'id': instance.id,
      'valMin': instance.valMin,
      'valMax': instance.valMax,
      'valeur': instance.valeur,
      'type': instance.type,
    };
