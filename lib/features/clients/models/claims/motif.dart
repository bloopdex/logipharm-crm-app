// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'motif.freezed.dart';
part 'motif.g.dart';

@freezed
class ClaimMotif with _$ClaimMotif {
  const factory ClaimMotif({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'label') required String label,
  }) = _ClaimMotif;

  factory ClaimMotif.fromJson(Map<String, dynamic> json) => _$ClaimMotifFromJson(json);
}
