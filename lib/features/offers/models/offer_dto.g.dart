// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferDto _$OfferDtoFromJson(Map<String, dynamic> json) => OfferDto(
      companyId: (json['companyId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      ref: (json['ref'] as num?)?.toInt(),
      type: json['type'] as String?,
      labCode: json['labCode'] as String?,
      remarque: json['remarque'] as String?,
      reference: json['reference'] as String?,
      debut: json['debut'] as String?,
      fin: json['fin'] as String?,
      montant: json['montant'] as num?,
      montantConsom: json['montantConsom'] as num?,
      labo: json['labo'] as String?,
      tiers: json['tiers'] as String?,
      terType: json['terType'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OfferDtoToJson(OfferDto instance) => <String, dynamic>{
      'companyId': instance.companyId,
      'id': instance.id,
      'ref': instance.ref,
      'type': instance.type,
      'labCode': instance.labCode,
      'remarque': instance.remarque,
      'reference': instance.reference,
      'debut': instance.debut,
      'fin': instance.fin,
      'montant': instance.montant,
      'montantConsom': instance.montantConsom,
      'labo': instance.labo,
      'tiers': instance.tiers,
      'terType': instance.terType,
      'products': instance.products,
    };
