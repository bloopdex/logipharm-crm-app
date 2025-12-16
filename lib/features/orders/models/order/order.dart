// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    @JsonKey(name: 'companyId') required int companyId,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'stockCode') required String stockCode,
    @JsonKey(name: 'date') required DateTime date,
    @JsonKey(name: 'reference') required String reference,
    @JsonKey(name: 'statut') required String statut,
    @JsonKey(name: 'terId') required int terId,
    @JsonKey(name: 'fournisseurId') required int fournisseurId,
    @JsonKey(name: 'fournisseurType') required String fournisseurType,
    @JsonKey(name: 'client') required String client,
    @JsonKey(name: 'delegue') String? delegue,
    @JsonKey(name: 'netHt') required int netHt,
    @JsonKey(name: 'totalTva') required int totalTva,
    @JsonKey(name: 'totalTtc') required double totalTtc,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
