// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TourImpl _$$TourImplFromJson(Map<String, dynamic> json) => _$TourImpl(
      tourId: json['tourneeId'] as String,
      companyId: (json['companyId'] as num).toInt(),
      regionId: json['regionId'] as String,
      regionName: json['regionName'] as String?,
      name: json['nom'] as String?,
      startDate: json['dateDebut'] as String?,
      endDate: json['dateFin'] as String?,
      statusFlag: (json['statusFlag'] as num).toInt(),
      statusName: json['statusName'] as String?,
      effectiveStartDate: json['dateDebutEffective'] as String?,
      effectiveEndDate: json['dateFinEffective'] as String?,
      delegate: Person.fromJson(json['delegue'] as Map<String, dynamic>),
      supervisor: json['superviseur'] == null
          ? null
          : Person.fromJson(json['superviseur'] as Map<String, dynamic>),
      totalClients: (json['totalClients'] as num?)?.toInt(),
      visitedClients: (json['visitedClients'] as num?)?.toInt(),
      pharmacies: (json['tourneeDetails'] as List<dynamic>?)
          ?.map((e) => TourDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TourImplToJson(_$TourImpl instance) =>
    <String, dynamic>{
      'tourneeId': instance.tourId,
      'companyId': instance.companyId,
      'regionId': instance.regionId,
      'regionName': instance.regionName,
      'nom': instance.name,
      'dateDebut': instance.startDate,
      'dateFin': instance.endDate,
      'statusFlag': instance.statusFlag,
      'statusName': instance.statusName,
      'dateDebutEffective': instance.effectiveStartDate,
      'dateFinEffective': instance.effectiveEndDate,
      'delegue': instance.delegate,
      'superviseur': instance.supervisor,
      'totalClients': instance.totalClients,
      'visitedClients': instance.visitedClients,
      'tourneeDetails': instance.pharmacies,
    };

_$TourDetailImpl _$$TourDetailImplFromJson(Map<String, dynamic> json) =>
    _$TourDetailImpl(
      id: json['id'] as String,
      masterTourId: json['tourneMaitreId'] as String,
      companyId: (json['companyId'] as num).toInt(),
      regionId: json['regionId'] as String?,
      startDate: json['dateDebut'] as String?,
      endDate: json['dateFin'] as String?,
      statusFlag: (json['statusFlag'] as num?)?.toInt(),
      statusName: json['statusName'] as String?,
      reason: json['motif'] == null
          ? null
          : Motif.fromJson(json['motif'] as Map<String, dynamic>),
      report: json['repport'] as String?,
      reportText: json['repportText'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      pharmacy: json['pharmacie'] == null
          ? null
          : Person.fromJson(json['pharmacie'] as Map<String, dynamic>),
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
      'statusName': instance.statusName,
      'motif': instance.reason,
      'repport': instance.report,
      'repportText': instance.reportText,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'pharmacie': instance.pharmacy,
    };

_$MotifImpl _$$MotifImplFromJson(Map<String, dynamic> json) => _$MotifImpl(
      id: (json['id'] as num).toInt(),
      label: json['label'] as String,
    );

Map<String, dynamic> _$$MotifImplToJson(_$MotifImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
    };
