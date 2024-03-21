// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TourImpl _$$TourImplFromJson(Map<String, dynamic> json) => _$TourImpl(
      tourneeId: json['tourneeId'] as String,
      companyId: json['companyId'] as int,
      regionId: json['regionId'] as String?,
      regionName: json['regionName'] as String,
      startDate: json['dateDebut'] as String,
      endDate: json['dateFin'] as String,
      statusFlag: json['statusFlag'] as int,
      effectiveStartDate: json['dateDebutEffective'] as String?,
      effectiveEndDate: json['dateFinEffective'] as String?,
      delegate: Person.fromJson(json['delegue'] as Map<String, dynamic>),
      supervisor: Person.fromJson(json['superviseur'] as Map<String, dynamic>),
      tourDetails: (json['tourneeDetails'] as List<dynamic>)
          .map((e) => TourDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TourImplToJson(_$TourImpl instance) =>
    <String, dynamic>{
      'tourneeId': instance.tourneeId,
      'companyId': instance.companyId,
      'regionId': instance.regionId,
      'regionName': instance.regionName,
      'dateDebut': instance.startDate,
      'dateFin': instance.endDate,
      'statusFlag': instance.statusFlag,
      'dateDebutEffective': instance.effectiveStartDate,
      'dateFinEffective': instance.effectiveEndDate,
      'delegue': instance.delegate,
      'superviseur': instance.supervisor,
      'tourneeDetails': instance.tourDetails,
    };

_$TourDetailImpl _$$TourDetailImplFromJson(Map<String, dynamic> json) =>
    _$TourDetailImpl(
      id: json['id'] as String,
      masterTourId: json['tourneMaitreId'] as String,
      companyId: json['companyId'] as int,
      regionId: json['regionId'] as String?,
      startDate: json['dateDebut'] as String?,
      endDate: json['dateFin'] as String?,
      statusFlag: json['statusFlag'] as int?,
      reason: json['motif'] as String?,
      report: json['repport'] as String?,
      pharmacy: Person.fromJson(json['pharmacie'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TourDetailImplToJson(_$TourDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tourneMaitreId': instance.masterTourId,
      'companyId': instance.companyId,
      'regionId': instance.regionId,
      'dateDebut': instance.startDate,
      'dateFin': instance.endDate,
      'statusFlag': instance.statusFlag,
      'motif': instance.reason,
      'repport': instance.report,
      'pharmacie': instance.pharmacy,
    };

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
