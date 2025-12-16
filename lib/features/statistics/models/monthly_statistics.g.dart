// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonthlyStatisticsImpl _$$MonthlyStatisticsImplFromJson(
        Map<String, dynamic> json) =>
    _$MonthlyStatisticsImpl(
      periodStart: DateTime.parse(json['periodStart'] as String),
      periodEnd: DateTime.parse(json['periodEnd'] as String),
      orders: OrderStats.fromJson(json['orders'] as Map<String, dynamic>),
      articles: (json['articles'] as List<dynamic>)
          .map((e) => ArticleStats.fromJson(e as Map<String, dynamic>))
          .toList(),
      prospects:
          ProspectStats.fromJson(json['prospects'] as Map<String, dynamic>),
      objectives:
          ObjectiveStats.fromJson(json['objectives'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MonthlyStatisticsImplToJson(
        _$MonthlyStatisticsImpl instance) =>
    <String, dynamic>{
      'periodStart': instance.periodStart.toIso8601String(),
      'periodEnd': instance.periodEnd.toIso8601String(),
      'orders': instance.orders,
      'articles': instance.articles,
      'prospects': instance.prospects,
      'objectives': instance.objectives,
    };

_$OrderStatsImpl _$$OrderStatsImplFromJson(Map<String, dynamic> json) =>
    _$OrderStatsImpl(
      validatedOrders: (json['validatedOrders'] as num).toInt(),
      totalOrders: (json['totalOrders'] as num).toInt(),
      percentage: json['percentage'] as String,
    );

Map<String, dynamic> _$$OrderStatsImplToJson(_$OrderStatsImpl instance) =>
    <String, dynamic>{
      'validatedOrders': instance.validatedOrders,
      'totalOrders': instance.totalOrders,
      'percentage': instance.percentage,
    };

_$ArticleStatsImpl _$$ArticleStatsImplFromJson(Map<String, dynamic> json) =>
    _$ArticleStatsImpl(
      articleCode: json['articleCode'] as String,
      articleName: json['articleName'] as String,
      achieved: (json['achieved'] as num).toInt(),
      objective: (json['objective'] as num).toInt(),
      percentage: json['percentage'] as String,
    );

Map<String, dynamic> _$$ArticleStatsImplToJson(_$ArticleStatsImpl instance) =>
    <String, dynamic>{
      'articleCode': instance.articleCode,
      'articleName': instance.articleName,
      'achieved': instance.achieved,
      'objective': instance.objective,
      'percentage': instance.percentage,
    };

_$ProspectStatsImpl _$$ProspectStatsImplFromJson(Map<String, dynamic> json) =>
    _$ProspectStatsImpl(
      validatedProspects: (json['validatedProspects'] as num).toInt(),
      totalProspects: (json['totalProspects'] as num).toInt(),
      percentage: json['percentage'] as String,
    );

Map<String, dynamic> _$$ProspectStatsImplToJson(_$ProspectStatsImpl instance) =>
    <String, dynamic>{
      'validatedProspects': instance.validatedProspects,
      'totalProspects': instance.totalProspects,
      'percentage': instance.percentage,
    };

_$ObjectiveStatsImpl _$$ObjectiveStatsImplFromJson(Map<String, dynamic> json) =>
    _$ObjectiveStatsImpl(
      caObjective: (json['caObjective'] as num).toDouble(),
      recObjective: (json['recObjective'] as num).toDouble(),
      caAchieved: (json['caAchieved'] as num).toDouble(),
      recAchieved: (json['recAchieved'] as num).toDouble(),
      caPercentage: json['caPercentage'] as String,
      recPercentage: json['recPercentage'] as String,
    );

Map<String, dynamic> _$$ObjectiveStatsImplToJson(
        _$ObjectiveStatsImpl instance) =>
    <String, dynamic>{
      'caObjective': instance.caObjective,
      'recObjective': instance.recObjective,
      'caAchieved': instance.caAchieved,
      'recAchieved': instance.recAchieved,
      'caPercentage': instance.caPercentage,
      'recPercentage': instance.recPercentage,
    };
