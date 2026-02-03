// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'observation.freezed.dart';
part 'observation.g.dart';

@freezed
class Observation with _$Observation {
  const factory Observation({
    @JsonKey(name: 'pharmacieId') required int pharmacyId,
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'type') required int type,
    @JsonKey(name: 'titre') required String title,
    @JsonKey(name: 'motif') String? reason,
    @JsonKey(name: 'rapport') String? report,
    @JsonKey(name: 'rapportText') String? reportText,
    @JsonKey(name: 'fournisseurId') int? fournisseurId,
  }) = _Observation;

  factory Observation.fromJson(Map<String, dynamic> json) =>
      _$ObservationFromJson(json);
}
