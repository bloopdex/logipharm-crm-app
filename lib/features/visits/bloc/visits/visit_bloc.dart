import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/logger.dart';
import '../../../../shared/utils/date.formatter.dart';
import '../../../tour-plan/models/tour.dart';
import '../../services/visit.repository.dart';

part 'visit_bloc.freezed.dart';
part 'visit_event.dart';
part 'visit_state.dart';

class VisitBloc extends Bloc<VisitEvent, VisitState> {
  VisitBloc() : super(const _Initial()) {
    on<_Started>(_started);
    on<_Search>(_search);
    on<_Load>(_load);
  }

  Future<void> _started(_Started event, Emitter<VisitState> emit) async {
    emit(const VisitState.loading());
    try {
      Response response = await VisitsRepository.get(
        page: 0,
        size: 20,
        startDate: DateHelper.YYYYMMdd(DateTime(DateTime.now().year, 1, 1)),
        endDate:
            DateHelper.YYYYMMdd(DateTime.now().add(const Duration(days: 1))),
      );

      List<TourDetail> visits = response.data['body']['content']
          .map<TourDetail>((tour) => TourDetail.fromJson(tour))
          .toList();

      emit(VisitState.loaded(
          visits: visits,
          hasReachedMax: response.data['body']['last'],
          currentPage: 0));
    } catch (e) {
      ILogger.error(e.toString());
      emit(const VisitState.failure(message: "errors:something-went-wrong"));
    }
  }

  Future<void> _load(_Load event, Emitter<VisitState> emit) async {
    if (state is _Loaded) {
      final currentState = state as _Loaded;
      try {
        if (currentState.hasReachedMax) return;
        Response response = await VisitsRepository.get(
          page: currentState.currentPage + 1,
          size: 20,
          startDate: DateHelper.YYYYMMdd(
              event.start ?? DateTime(DateTime.now().year, 1, 1)),
          endDate: DateHelper.YYYYMMdd(event.end ?? DateTime.now()),
        );
        List<TourDetail> visits = response.data['body']['content']
            .map<TourDetail>((tour) => TourDetail.fromJson(tour))
            .toList();

        emit(VisitState.loaded(
          visits: currentState.visits + visits,
          hasReachedMax: response.data['body']['last'],
          currentPage: currentState.currentPage + 1,
        ));
      } catch (e) {
        ILogger.error(e.toString());
        emit(const VisitState.failure(message: "errors:something-went-wrong"));
      }
    }
  }

  FutureOr<void> _search(event, Emitter<VisitState> emit) async {
    emit(const VisitState.loading());
    try {
      Response response = await VisitsRepository.get(
        page: 0,
        size: 20,
        startDate: DateHelper.YYYYMMdd(
            event.start ?? DateTime(DateTime.now().year, 1, 1)),
        endDate: DateHelper.YYYYMMdd(
            event.end ?? DateTime.now().add(const Duration(days: 1))),
      );

      List<TourDetail> visits = response.data['body']['content']
          .map<TourDetail>((tour) => TourDetail.fromJson(tour))
          .toList();

      emit(VisitState.loaded(
          visits: visits, hasReachedMax: false, currentPage: 0));
    } catch (e) {
      ILogger.error(e.toString());
      emit(const VisitState.failure(message: "errors:something-went-wrong"));
    }
  }
}
