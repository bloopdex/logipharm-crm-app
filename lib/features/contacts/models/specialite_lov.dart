// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'specialite_lov.freezed.dart';
part 'specialite_lov.g.dart';

@freezed
class SpecialiteLov with _$SpecialiteLov {
  const factory SpecialiteLov({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'label') required String label,
  }) = _SpecialiteLov;

  factory SpecialiteLov.fromJson(Map<String, dynamic> json) =>
      _$SpecialiteLovFromJson(json);
}
