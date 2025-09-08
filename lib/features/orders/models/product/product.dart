// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    @JsonKey(name: 'cmpId') required int cmpId,
    @JsonKey(name: 'prdId') required int prdId,
    @JsonKey(name: 'medId') required int medId,
    @JsonKey(name: 'stkCode') required String stkCode,
    @JsonKey(name: 'commercialName') required String commercialName,
    @JsonKey(name: 'attribut2') String? attribut2,
    @JsonKey(name: 'nlot') required String nlot,
    @JsonKey(name: 'datePeremption') required DateTime datePeremption,
    @JsonKey(name: 'prixPpa') required double prixPpa,
    @JsonKey(name: 'qte') required double qte,
    @JsonKey(name: 'prixPh') required double prixPh,
    @JsonKey(name: 'prixGr') int? prixGr,
    @JsonKey(name: 'prixShp') required double prixShp,
    @JsonKey(name: 'ugVnete') double? ugVnete,
    @JsonKey(name: 'etatFlag') bool? etatFlag,
    @JsonKey(name: 'creerDate') required DateTime creerDate,
    @JsonKey(name: 'colis') double? colis,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
