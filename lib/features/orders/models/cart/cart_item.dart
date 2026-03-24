// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    @JsonKey(name: 'cpsCmpId') int? cpsCmpId,
    @JsonKey(name: 'cpsTerId') int? cpsTerId,
    @JsonKey(name: 'cpsTerType') String? cpsTerType,
    @JsonKey(name: 'no') int? no,
    @JsonKey(name: 'commercialName') String? commercialName,
    @JsonKey(name: 'datePeremption') DateTime? datePeremption,
    @JsonKey(name: 'prixPpa') double? prixPpa,
    @JsonKey(name: 'qte') double? qte,
    @JsonKey(name: 'qteSansUg') double? qteSansUg,
    @JsonKey(name: 'qteUg') double? qteUg,
    @JsonKey(name: 'prixPh') double? prixPh,
    @JsonKey(name: 'txRistourne') double? txRistourne,
    @JsonKey(name: 'montant') num? montant,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
