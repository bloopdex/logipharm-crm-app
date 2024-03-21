// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: Id.fromJson(json['id'] as Map<String, dynamic>),
      lastName: json['nom'] as String,
      firstName: json['prenom'] as String?,
      loginCode: json['loginCode'] as String,
      actionFlag: json['actionFlag'] as int,
      regionId: json['regionId'] as String,
      address: json['adresse'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      supervisor: json['superviseur'] as int?,
      fullName: json['fullName'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.lastName,
      'prenom': instance.firstName,
      'loginCode': instance.loginCode,
      'actionFlag': instance.actionFlag,
      'regionId': instance.regionId,
      'adresse': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'superviseur': instance.supervisor,
      'fullName': instance.fullName,
    };

_$IdImpl _$$IdImplFromJson(Map<String, dynamic> json) => _$IdImpl(
      id: json['id'] as int,
      companyId: json['cmpId'] as int,
      typeTier: json['typeTier'] as String,
    );

Map<String, dynamic> _$$IdImplToJson(_$IdImpl instance) => <String, dynamic>{
      'id': instance.id,
      'cmpId': instance.companyId,
      'typeTier': instance.typeTier,
    };
