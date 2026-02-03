// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDtoImpl _$$ProductDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProductDtoImpl(
      offerId: (json['offerId'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      productId: (json['productId'] as num?)?.toInt(),
      productName: json['productName'] as String?,
      labCode: json['labCode'] as String?,
    );

Map<String, dynamic> _$$ProductDtoImplToJson(_$ProductDtoImpl instance) =>
    <String, dynamic>{
      'offerId': instance.offerId,
      'companyId': instance.companyId,
      'productId': instance.productId,
      'productName': instance.productName,
      'labCode': instance.labCode,
    };
