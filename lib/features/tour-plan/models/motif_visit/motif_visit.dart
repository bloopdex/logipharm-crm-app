// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'motif_visit.freezed.dart';
part 'motif_visit.g.dart';

@freezed
class MotifVisit with _$MotifVisit {
  const factory MotifVisit({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'label') required String? label,
  }) = _MotifVisit;

  factory MotifVisit.fromJson(Map<String, dynamic> json) => _$MotifVisitFromJson(json);
}
