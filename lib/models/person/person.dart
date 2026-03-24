// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../features/clients/models/statistics/client_statistics.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
class Person with _$Person {
  const factory Person({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'cmpId') required int companyId,
    @JsonKey(name: 'typeTier') required String typeTier,
    @JsonKey(name: 'nom') required String lastName,
    @JsonKey(name: 'prenom') String? firstName,
    @JsonKey(name: 'loginCode') required String loginCode,
    @JsonKey(name: 'activeFlag') required int activeFlag,
    @JsonKey(name: 'regionId') String? regionId,
    @JsonKey(name: 'ville') String? ville,
    @JsonKey(name: 'adresse') String? address,
    @JsonKey(name: 'latitude') double? latitude,
    @JsonKey(name: 'longitude') double? longitude,
    @JsonKey(name: 'superviseur') int? supervisor, // Supervisor ID
    @JsonKey(name: 'codePostal') String? postalCode,
    @JsonKey(name: 'boitePostale') String? postBox,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'siteWeb') String? website,
    @JsonKey(name: 'nisCode') String? nisCode,
    @JsonKey(name: 'nssCode') String? nssCode,
    @JsonKey(name: 'tel1Fixe') String? tel1Fixe,
    @JsonKey(name: 'tel2Fixe') String? tel2Fixe,
    @JsonKey(name: 'telMobile') String? telMobile,
    @JsonKey(name: 'fax') String? fax,
    @JsonKey(name: 'fullName') required String fullName,
    @JsonKey(name: 'prospect') bool? prospect,
    @JsonKey(name: 'solvabilite') Solvabilite? solvabilite, // Added solvabilite
    @JsonKey(name: 'modePaie') ModePaie? modePaie, // Added modePaie
    @JsonKey(name: 'categorieId') int? categoryId,
    @JsonKey(name: 'categorieLibelle') String? categoryLabel,
    @JsonKey(name: 'categorieId2') int? categorieId2,
    @JsonKey(name: 'categorieLibelle2') String? categoryLabel2,
    @JsonKey(name: 'ficheClient') ClientStatistics? clientStatistics,
    @JsonKey(name: 'laboratoireCode') String? laboratoireCode,
    @JsonKey(name: 'delegueType') num? delegueType,
    @JsonKey(name: 'lastVisitDate') String? lastVisitDate,
    @JsonKey(name: 'visitCount') int? visitCount,
    @JsonKey(name: 'inactifFlag') bool? inactifFlag,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'phase') String? phase,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}

@freezed
class Solvabilite with _$Solvabilite {
  const factory Solvabilite({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'label') required String label,
  }) = _Solvabilite;

  factory Solvabilite.fromJson(Map<String, dynamic> json) =>
      _$SolvabiliteFromJson(json);
}

@freezed
class ModePaie with _$ModePaie {
  const factory ModePaie({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'label') required String label,
  }) = _ModePaie;

  factory ModePaie.fromJson(Map<String, dynamic> json) =>
      _$ModePaieFromJson(json);
}
