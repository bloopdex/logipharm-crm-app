// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'commune.freezed.dart';
part 'commune.g.dart';

@freezed
class Commune with _$Commune {
  const factory Commune({
    @JsonKey(name: 'code') required String code,
    @JsonKey(name: 'nom') required String name,
    @JsonKey(name: 'wlyCode') required String wlyCode,
  }) = _Commune;

  factory Commune.fromJson(Map<String, dynamic> json) => _$CommuneFromJson(json);
}
