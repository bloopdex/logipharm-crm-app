// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'date') DateTime? date,
    @JsonKey(name: 'type') int? type,
    @JsonKey(name: 'titre') String? titre,
    @JsonKey(name: 'motif') String? motif,
    @JsonKey(name: 'repport') String? repport,
    @JsonKey(name: 'repportText') String? repportText,
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
    @JsonKey(name: 'modifierPar') String? modifierPar,
    @JsonKey(name: 'modifierDate') DateTime? modifierDate,
    @JsonKey(name: 'statut') String? statut,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
