// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'id') required Id id,
    @JsonKey(name: 'nom') required String lastName,
    @JsonKey(name: 'prenom') String? firstName,
    @JsonKey(name: 'loginCode') required String loginCode,
    @JsonKey(name: 'actionFlag') required int actionFlag,
    @JsonKey(name: 'regionId') required String regionId,
    @JsonKey(name: 'adresse') String? address,
    @JsonKey(name: 'latitude') double? latitude,
    @JsonKey(name: 'longitude') double? longitude,
    @JsonKey(name: 'superviseur') int? supervisor,
    @JsonKey(name: 'fullName') required String fullName,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Id with _$Id {
  const factory Id({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'cmpId') required int companyId,
    @JsonKey(name: 'typeTier') required String typeTier,
  }) = _Id;

  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);
}
