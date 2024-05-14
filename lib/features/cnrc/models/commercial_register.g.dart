// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commercial_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommercialRegisterImpl _$$CommercialRegisterImplFromJson(
        Map<String, dynamic> json) =>
    _$CommercialRegisterImpl(
      commercialRegisterNumber: json['commercialRegisterNumber'] as String,
      region: json['region'] as String,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      address: json['adress'] as String,
      stateWilaya: json['stateWilaya'] as String,
      municipality: json['mnuicipality'] as String,
      commercialRegisterStatus: json['commercialRegisterStatus'] as String,
    );

Map<String, dynamic> _$$CommercialRegisterImplToJson(
        _$CommercialRegisterImpl instance) =>
    <String, dynamic>{
      'commercialRegisterNumber': instance.commercialRegisterNumber,
      'region': instance.region,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
      'adress': instance.address,
      'stateWilaya': instance.stateWilaya,
      'mnuicipality': instance.municipality,
      'commercialRegisterStatus': instance.commercialRegisterStatus,
    };
