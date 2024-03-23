// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
class Person with _$Person {
  const factory Person({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'cmpId') required int companyId,
    @JsonKey(name: 'typeTier') required String tierType,
    @JsonKey(name: 'nom') required String lastName,
    @JsonKey(name: 'prenom') String? firstName,
    @JsonKey(name: 'loginCode') required String loginCode,
    @JsonKey(name: 'actionFlag') required int actionFlag,
    @JsonKey(name: 'regionId') String? regionId,
    @JsonKey(name: 'adresse') String? address,
    @JsonKey(name: 'latitude') double? latitude,
    @JsonKey(name: 'longitude') double? longitude,
    @JsonKey(name: 'fullName') required String fullName,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
