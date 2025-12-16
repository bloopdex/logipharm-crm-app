part of 'monthly_statistics_cubit.dart';

@freezed
class MonthlyStatisticsState with _$MonthlyStatisticsState {
  const factory MonthlyStatisticsState.initial() = _Initial;
  const factory MonthlyStatisticsState.loading() = _Loading;
  const factory MonthlyStatisticsState.loaded({
    required MonthlyStatistics statistics,
  }) = _Loaded;
  const factory MonthlyStatisticsState.error({
    required String message,
  }) = _Error;
}
