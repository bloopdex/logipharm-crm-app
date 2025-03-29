// ignore_for_file: invalid_annotation_target

import 'package:crm/models/person/person.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../event/event.dart';

part 'eventvisite.freezed.dart';
part 'eventvisite.g.dart';

@freezed
class EventVisite with _$EventVisite {
  const factory EventVisite({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'date') DateTime? date,
    @JsonKey(name: 'nom') String? nom,
    @JsonKey(name: 'prenom') String? prenom,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'telephone') String? telephone,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'statusFlag') int? statusFlag,
    @JsonKey(name: 'remarque') String? remarque,
    @JsonKey(name: 'att1') String? att1,
    @JsonKey(name: 'att2') String? att2,
    @JsonKey(name: 'att3') String? att3,
    @JsonKey(name: 'att4') String? att4,
    @JsonKey(name: 'att5') String? att5,
    @JsonKey(name: 'att6') int? att6,
    @JsonKey(name: 'att7') int? att7,
    @JsonKey(name: 'att8') int? att8,
    @JsonKey(name: 'att9') int? att9,
    @JsonKey(name: 'att10') int? att10,
    @JsonKey(name: 'att11') DateTime? att11,
    @JsonKey(name: 'att12') DateTime? att12,
    @JsonKey(name: 'att13') DateTime? att13,
    @JsonKey(name: 'att14') DateTime? att14,
    @JsonKey(name: 'creerPar') String? creerPar,
    @JsonKey(name: 'creerDate') DateTime? creerDate,
    @JsonKey(name: 'evenement') Event? evenement,
    @JsonKey(name: 'delegue') Person? delegue,
  }) = _EventVisite;

  factory EventVisite.fromJson(Map<String, dynamic> json) => _$EventVisiteFromJson(json);
}
