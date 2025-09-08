// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    @JsonKey(name: 'cpsCmpId') required int cpsCmpId,
    @JsonKey(name: 'cpsTerId') required int cpsTerId,
    @JsonKey(name: 'cpsTerType') required String cpsTerType,
    @JsonKey(name: 'no') required int no,
    @JsonKey(name: 'commercialName') required String commercialName,
    @JsonKey(name: 'datePeremption') required DateTime datePeremption,
    @JsonKey(name: 'prixPpa') required double prixPpa,
    @JsonKey(name: 'qte') required double qte,
    @JsonKey(name: 'prixPh') required double prixPh,
    @JsonKey(name: 'txRistourne') double? txRistourne,
    @JsonKey(name: 'montant') num? montant,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
}
