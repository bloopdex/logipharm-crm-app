// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HireImpl _$$HireImplFromJson(Map<String, dynamic> json) => _$HireImpl(
      id: json['id'] as String,
      companyId: (json['companyId'] as num).toInt(),
      delegateId: (json['delegueId'] as num).toInt(),
      delegateType: json['delegueType'] as String,
      lastName: json['nom'] as String?,
      firstName: json['prenom'] as String?,
      regionId: json['regionId'] as String,
      regionName: json['regionName'] as String,
      address: json['address'] as String?,
      telephone: json['telephone'] as String?,
      email: json['email'] as String?,
      statusFlag: (json['statusFlag'] as num).toInt(),
      statusName: json['statusName'] as String,
      remark: json['remarque'] as String?,
    );

Map<String, dynamic> _$$HireImplToJson(_$HireImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'delegueId': instance.delegateId,
      'delegueType': instance.delegateType,
      'nom': instance.lastName,
      'prenom': instance.firstName,
      'regionId': instance.regionId,
      'regionName': instance.regionName,
      'address': instance.address,
      'telephone': instance.telephone,
      'email': instance.email,
      'statusFlag': instance.statusFlag,
      'statusName': instance.statusName,
      'remarque': instance.remark,
    };
