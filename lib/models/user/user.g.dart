// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      companyId: (json['cmpId'] as num?)?.toInt(),
      companyType: (json['cmpType'] as num?)?.toInt() ?? 0,
      typeTier: json['typeTier'] as String?,
      lastName: json['nom'] as String?,
      firstName: json['prenom'] as String?,
      loginCode: json['loginCode'] as String?,
      actionFlag: (json['actionFlag'] as num?)?.toInt(),
      regionId: json['regionId'] as String?,
      address: json['adresse'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      supervisor: (json['superviseur'] as num?)?.toInt(),
      addVisitOutPlanPrivilege: json['addViseHorsPlan'] as bool?,
      fullName: json['fullName'] as String?,
      authorizedRadius: json['authorizedRadius'] as num?,
      roleChangeLocationClient: json['roleChangeLocationClient'] as bool?,
      delegueType: json['delegueType'] as num?,
      minReportChar: (json['crmNbrLettres'] as num?)?.toInt(),
      terVentePrixAchat: (json['terVentePrixAchat'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cmpId': instance.companyId,
      'cmpType': instance.companyType,
      'typeTier': instance.typeTier,
      'nom': instance.lastName,
      'prenom': instance.firstName,
      'loginCode': instance.loginCode,
      'actionFlag': instance.actionFlag,
      'regionId': instance.regionId,
      'adresse': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'superviseur': instance.supervisor,
      'addViseHorsPlan': instance.addVisitOutPlanPrivilege,
      'fullName': instance.fullName,
      'authorizedRadius': instance.authorizedRadius,
      'roleChangeLocationClient': instance.roleChangeLocationClient,
      'delegueType': instance.delegueType,
      'crmNbrLettres': instance.minReportChar,
      'terVentePrixAchat': instance.terVentePrixAchat,
    };
