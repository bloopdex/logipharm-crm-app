// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_detail.freezed.dart';
part 'order_detail.g.dart';

@freezed
class OrderDetail with _$OrderDetail {
  const factory OrderDetail({
    @JsonKey(name: 'companyId') required int companyId,
    @JsonKey(name: 'orderId') required int orderId,
    @JsonKey(name: 'orderType') required String orderType,
    @JsonKey(name: 'stockCode') required String stockCode,
    @JsonKey(name: 'date') required DateTime date,
    @JsonKey(name: 'reference') required String reference,
    @JsonKey(name: 'codeStatut') required int codeStatut,
    @JsonKey(name: 'statut') required String statut,
    @JsonKey(name: 'terId') required int terId,
    @JsonKey(name: 'fournisseurId') required int fournisseurId,
    @JsonKey(name: 'fournisseurType') required String fournisseurType,
    @JsonKey(name: 'client') required String client,
    @JsonKey(name: 'delegue') required String delegue,
    @JsonKey(name: 'medId') required int medId,
    @JsonKey(name: 'medAmm') String? medAmm,
    @JsonKey(name: 'medCommercialName') required String medCommercialName,
    @JsonKey(name: 'lot') required String lot,
    @JsonKey(name: 'datePeremption') required DateTime datePeremption,
    @JsonKey(name: 'prixPpa') required double prixPpa,
    @JsonKey(name: 'prixPh') required double prixPh,
    @JsonKey(name: 'qte') required double qte,
    @JsonKey(name: 'netHt') required int netHt,
    @JsonKey(name: 'montTva') required int montTva,
    @JsonKey(name: 'montTtc') required double montTtc,
  }) = _OrderDetail;

  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);
}
