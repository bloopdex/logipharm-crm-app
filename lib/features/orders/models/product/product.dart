// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    @JsonKey(name: 'cmpId') int? cmpId,
    @JsonKey(name: 'prdId') int? prdId,
    @JsonKey(name: 'medId') int? medId,
    @JsonKey(name: 'stkCode') String? stkCode,
    @JsonKey(name: 'commercialName') String? commercialName,
    @JsonKey(name: 'attribut2') String? attribut2,
    @JsonKey(name: 'nlot') String? nlot,
    @JsonKey(name: 'datePeremption') DateTime? datePeremption,
    @JsonKey(name: 'prixPpa') double? prixPpa,
    @JsonKey(name: 'qte') double? qte,
    @JsonKey(name: 'prixPh') double? prixPh,
    @JsonKey(name: 'prixGr') int? prixGr,
    @JsonKey(name: 'prixShp') double? prixShp,
    @JsonKey(name: 'ugVnete') double? ugVnete,
    @JsonKey(name: 'tva') double? tva,
    @JsonKey(name: 'etatFlag') bool? etatFlag,
    @JsonKey(name: 'creerDate') DateTime? creerDate,
    @JsonKey(name: 'colis') double? colis,
    @JsonKey(name: 'objectif') double? objectif,
    @JsonKey(name: 'laboratoire') String? laboratoire,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
