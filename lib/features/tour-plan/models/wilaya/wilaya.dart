// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'wilaya.freezed.dart';
part 'wilaya.g.dart';

@freezed
class Wilaya with _$Wilaya {
  const factory Wilaya({
    @JsonKey(name: 'code') required String code,
    @JsonKey(name: 'nom') required String name,
    @JsonKey(name: 'zone') required String zone,
  }) = _Wilaya;

  factory Wilaya.fromJson(Map<String, dynamic> json) => _$WilayaFromJson(json);
}
