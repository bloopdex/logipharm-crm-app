// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'claim.freezed.dart';
part 'claim.g.dart';

@freezed
class Claim with _$Claim {
  const factory Claim({
    @JsonKey(name: 'pharmacieId') required int pharmacieId,
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'type') required int type,
    @JsonKey(name: 'titre') required String titre,
    @JsonKey(name: 'motif') required String motif,
    @JsonKey(name: 'rapport') required String rapport,
    @JsonKey(name: 'rapportText') required String rapportText,
  }) = _Claim;

  factory Claim.fromJson(Map<String, dynamic> json) => _$ClaimFromJson(json);
}
