// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonImpl _$$PersonImplFromJson(Map<String, dynamic> json) => _$PersonImpl(
      id: json['id'] as int,
      companyId: json['cmpId'] as int,
      tierType: json['typeTier'] as String,
      lastName: json['nom'] as String,
      firstName: json['prenom'] as String?,
      loginCode: json['loginCode'] as String,
      actionFlag: json['actionFlag'] as int,
      regionId: json['regionId'] as String?,
      address: json['adresse'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      fullName: json['fullName'] as String,
    );

Map<String, dynamic> _$$PersonImplToJson(_$PersonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cmpId': instance.companyId,
      'typeTier': instance.tierType,
      'nom': instance.lastName,
      'prenom': instance.firstName,
      'loginCode': instance.loginCode,
      'actionFlag': instance.actionFlag,
      'regionId': instance.regionId,
      'adresse': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'fullName': instance.fullName,
    };
