import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_rotation.freezed.dart';
part 'product_rotation.g.dart';

@freezed
class ProductRotationPeriod with _$ProductRotationPeriod {
  const factory ProductRotationPeriod({
    @JsonKey(name: 'startDate') required String startDate,
    @JsonKey(name: 'endDate') required String endDate,
  }) = _ProductRotationPeriod;

  factory ProductRotationPeriod.fromJson(Map<String, dynamic> json) =>
      _$ProductRotationPeriodFromJson(json);
}

@freezed
class ProductRotationItem with _$ProductRotationItem {
  const factory ProductRotationItem({
    @JsonKey(name: 'productName') required String productName,
    @JsonKey(name: 'totalQuantity') required double totalQuantity,
  }) = _ProductRotationItem;

  factory ProductRotationItem.fromJson(Map<String, dynamic> json) =>
      _$ProductRotationItemFromJson(json);
}

@freezed
class ProductRotationResponse with _$ProductRotationResponse {
  const factory ProductRotationResponse({
    @JsonKey(name: 'period') required ProductRotationPeriod period,
    @JsonKey(name: 'totalProducts') required int totalProducts,
    @JsonKey(name: 'products') required List<ProductRotationItem> products,
  }) = _ProductRotationResponse;

  factory ProductRotationResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductRotationResponseFromJson(json);
}
