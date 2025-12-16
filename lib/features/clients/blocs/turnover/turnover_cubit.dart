import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/logger.dart';
import '../../models/turnover/turnover.dart';
import '../../repositories/turnover_repository.dart';

part 'turnover_cubit.freezed.dart';
part 'turnover_state.dart';

class TurnoverCubit extends Cubit<TurnoverState> {
  TurnoverCubit() : super(const TurnoverState.initial());

  final int currentYear = DateTime.now().year;

  Future<void> fetchTurnovers(int clientId) async {
    emit(const TurnoverState.loading());
    try {
      Response response = await TurnoverRepository.get(clientId: clientId, year: currentYear);

      List<Turnover> turnovers = (response.data['body'] as List)
          .map<Turnover>((turnover) => Turnover.fromJson(turnover))
          .toList();

      // Ensure we have data for all 12 months
      for (int month = 1; month <= 12; month++) {
        if (!turnovers.any((t) => t.month == month)) {
          turnovers.add(
            Turnover(
              year: currentYear,
              month: month,
              turnover: 0,
            ),
          );
        }
      }

      emit(
        TurnoverState.loaded(
          turnovers: turnovers,
          hasReachedMax: false,
        ),
      );
    } catch (e) {
      ILogger.error(e.toString());
      emit(const TurnoverState.failure(message: "errors:something-went-wrong"));
    }
  }
}
