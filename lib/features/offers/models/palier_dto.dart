import 'package:freezed_annotation/freezed_annotation.dart';

part 'palier_dto.freezed.dart';
part 'palier_dto.g.dart';

@freezed
class PalierDto with _$PalierDto {
  const factory PalierDto({
    int? companyId,
    int? offerId,
    int? id,
    num? valMin,
    num? valMax,
    num? valeur,
    String? type,
  }) = _PalierDto;

  factory PalierDto.fromJson(Map<String, dynamic> json) =>
      _$PalierDtoFromJson(json);
}
