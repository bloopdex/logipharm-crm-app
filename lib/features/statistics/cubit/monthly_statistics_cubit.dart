import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/monthly_statistics.dart';
import '../repositories/monthly_statistics_repository.dart';

part 'monthly_statistics_cubit.freezed.dart';
part 'monthly_statistics_state.dart';

class MonthlyStatisticsCubit extends Cubit<MonthlyStatisticsState> {
  MonthlyStatisticsCubit() : super(const MonthlyStatisticsState.initial());

  Future<void> loadStatistics({
    DateTime? periodStart,
    DateTime? periodEnd,
  }) async {
    emit(const MonthlyStatisticsState.loading());

    try {
      final response = await MonthlyStatisticsRepository.getMonthlyStatistics(
        periodStart: periodStart,
        periodEnd: periodEnd,
      );

      if (response.statusCode == 200 && response.data['body'] != null) {
        final statistics = MonthlyStatistics.fromJson(response.data['body']);
        emit(MonthlyStatisticsState.loaded(statistics: statistics));
      } else {
        emit(MonthlyStatisticsState.error(
          message: response.data['message'] ?? 'Failed to load statistics',
        ));
      }
    } catch (e) {
      log("Error loading monthly statistics: $e");
      emit(MonthlyStatisticsState.error(
        message: e.toString(),
      ));
    }
  }

  void reset() {
    emit(const MonthlyStatisticsState.initial());
  }
}
