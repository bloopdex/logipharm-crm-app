import 'package:freezed_annotation/freezed_annotation.dart';

part 'monthly_statistics.freezed.dart';
part 'monthly_statistics.g.dart';

@freezed
class MonthlyStatistics with _$MonthlyStatistics {
  const factory MonthlyStatistics({
    required DateTime periodStart,
    required DateTime periodEnd,
    required OrderStats orders,
    required List<ArticleStats> articles,
    required ProspectStats prospects,
    required ObjectiveStats objectives,
  }) = _MonthlyStatistics;

  factory MonthlyStatistics.fromJson(Map<String, dynamic> json) =>
      _$MonthlyStatisticsFromJson(json);
}

@freezed
class OrderStats with _$OrderStats {
  const factory OrderStats({
    required int validatedOrders,
    required int totalOrders,
    required String percentage,
  }) = _OrderStats;

  factory OrderStats.fromJson(Map<String, dynamic> json) =>
      _$OrderStatsFromJson(json);
}

@freezed
class ArticleStats with _$ArticleStats {
  const factory ArticleStats({
    required String articleCode,
    required String articleName,
    required int achieved,
    required int objective,
    required String percentage,
  }) = _ArticleStats;

  factory ArticleStats.fromJson(Map<String, dynamic> json) =>
      _$ArticleStatsFromJson(json);
}

@freezed
class ProspectStats with _$ProspectStats {
  const factory ProspectStats({
    required int validatedProspects,
    required int totalProspects,
    required String percentage,
  }) = _ProspectStats;

  factory ProspectStats.fromJson(Map<String, dynamic> json) =>
      _$ProspectStatsFromJson(json);
}

@freezed
class ObjectiveStats with _$ObjectiveStats {
  const factory ObjectiveStats({
    required double caObjective,
    required double recObjective,
    required double caAchieved,
    required double recAchieved,
    required String caPercentage,
    required String recPercentage,
  }) = _ObjectiveStats;

  factory ObjectiveStats.fromJson(Map<String, dynamic> json) =>
      _$ObjectiveStatsFromJson(json);
}
