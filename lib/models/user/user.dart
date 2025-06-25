// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'cmpId') int? companyId,
    @JsonKey(name: 'typeTier') String? typeTier,
    @JsonKey(name: 'nom') String? lastName,
    @JsonKey(name: 'prenom') String? firstName,
    @JsonKey(name: 'loginCode') String? loginCode,
    @JsonKey(name: 'actionFlag') int? actionFlag,
    @JsonKey(name: 'regionId') String? regionId,
    @JsonKey(name: 'adresse') String? address,
    @JsonKey(name: 'latitude') double? latitude,
    @JsonKey(name: 'longitude') double? longitude,
    @JsonKey(name: 'superviseur') int? supervisor,
    @JsonKey(name: 'addViseHorsPlan') bool? addVisitOutPlanPrivilege,
    @JsonKey(name: 'fullName') String? fullName,
    @JsonKey(name: 'roleChangeLocationClient') bool? roleChangeLocationClient,
    @JsonKey(name: 'crmNbrLettres') int? minReportChar,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
