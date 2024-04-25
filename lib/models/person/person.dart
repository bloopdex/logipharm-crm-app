// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

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
    @JsonKey(name: 'actionFlag') required int actionFlag,
    @JsonKey(name: 'regionId') String? regionId,
    @JsonKey(name: 'adresse') String? address,
    @JsonKey(name: 'latitude') double? latitude,
    @JsonKey(name: 'longitude') double? longitude,
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
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
