// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_rotation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductRotationPeriodImpl _$$ProductRotationPeriodImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductRotationPeriodImpl(
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
    );

Map<String, dynamic> _$$ProductRotationPeriodImplToJson(
        _$ProductRotationPeriodImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };

_$ProductRotationItemImpl _$$ProductRotationItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductRotationItemImpl(
      productName: json['productName'] as String,
      totalQuantity: (json['totalQuantity'] as num).toDouble(),
    );

Map<String, dynamic> _$$ProductRotationItemImplToJson(
        _$ProductRotationItemImpl instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'totalQuantity': instance.totalQuantity,
    };

_$ProductRotationResponseImpl _$$ProductRotationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductRotationResponseImpl(
      period: ProductRotationPeriod.fromJson(
          json['period'] as Map<String, dynamic>),
      totalProducts: (json['totalProducts'] as num).toInt(),
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductRotationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductRotationResponseImplToJson(
        _$ProductRotationResponseImpl instance) =>
    <String, dynamic>{
      'period': instance.period,
      'totalProducts': instance.totalProducts,
      'products': instance.products,
    };
