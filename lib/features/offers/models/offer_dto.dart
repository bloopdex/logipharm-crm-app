import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer_dto.freezed.dart';
part 'offer_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
@freezed
class OfferDto with _$OfferDto {
  const factory OfferDto({
    int? companyId,
    int? id,
    int? ref,
    String? type,
    String? labCode,
    String? remarque,
    String? reference,
    String? debut, // ISO date (yyyy-MM-dd)
    String? fin, // ISO date (yyyy-MM-dd)
    num? montant,
    num? montantConsom,
    String? labo,
    String? tiers,
    String? terType,
  }) = _OfferDto;

  factory OfferDto.fromJson(Map<String, dynamic> json) {
    // accept both 'montConsom' and 'montantConsom'
    final map = Map<String, dynamic>.from(json);
    if (map.containsKey('montConsom') && !map.containsKey('montantConsom')) {
      map['montantConsom'] = map['montConsom'];
    }
    return _$OfferDtoFromJson(map);
  }
}
