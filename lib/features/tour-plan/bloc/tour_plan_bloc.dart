import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/logger.dart';
import '../../../shared/utils/date.formatter.dart';
import '../models/tour.dart';
import '../services/tour.repository.dart';

part 'tour_plan_event.dart';
part 'tour_plan_state.dart';
part 'tour_plan_bloc.freezed.dart';

class TourPlanBloc extends Bloc<TourPlanEvent, TourPlanState> {
  TourPlanBloc() : super(const _Initial()) {
    on<_Started>(_started);
    on<_Search>(_search);
    on<_Load>(_load);
  }

  Future<void> _started(_Started event, Emitter<TourPlanState> emit) async {
    emit(const TourPlanState.loading());
    try {
      Response response = await TourRepository.get(
        page: 0,
        size: 10,
        startDate: DateHelper.YYYYMMdd(DateTime(DateTime.now().year, 1, 1)),
        endDate:
            DateHelper.YYYYMMdd(DateTime.now().add(const Duration(days: 1))),
      );

      List<Tour> tours = response.data['body']['content']
          .map<Tour>((laboratory) => Tour.fromJson(laboratory))
          .toList();

      emit(TourPlanState.loaded(
          tours: tours,
          hasReachedMax: response.data['body']['last'],
          currentPage: 0));
    } catch (e) {
      ILogger.error(e.toString());
      emit(const TourPlanState.failure(message: "errors:something-went-wrong"));
    }
  }

  Future<void> _search(_Search event, Emitter<TourPlanState> emit) async {
    emit(const TourPlanState.loading());
    try {
      Response response = await TourRepository.get(
        page: 0,
        size: 10,
        startDate: DateHelper.YYYYMMdd(
            event.start ?? DateTime(DateTime.now().year, 1, 1)),
        endDate: DateHelper.YYYYMMdd(event.end ?? DateTime.now()),
      );

      List<Tour> tours = response.data['body']['content']
          .map<Tour>((laboratory) => Tour.fromJson(laboratory))
          .toList();

      emit(TourPlanState.loaded(
          tours: tours,
          hasReachedMax: response.data['body']['last'],
          currentPage: 0));
    } catch (e) {
      ILogger.error(e.toString());
      emit(const TourPlanState.failure(message: "errors:something-went-wrong"));
    }
  }

  Future<void> _load(_Load event, Emitter<TourPlanState> emit) async {
    if (state is _Loaded) {
      final currentState = state as _Loaded;
      if (!currentState.hasReachedMax) {
        try {
          Response response = await TourRepository.get(
            page: currentState.currentPage + 1,
            size: 10,
            startDate: DateHelper.YYYYMMdd(
                event.start ?? DateTime(DateTime.now().year, 1, 1)),
            endDate: DateHelper.YYYYMMdd(event.end ?? DateTime.now()),
          );

          List<Tour> tours = response.data['body']['content']
              .map<Tour>((laboratory) => Tour.fromJson(laboratory))
              .toList();

          emit(TourPlanState.loaded(
              tours: currentState.tours + tours,
              hasReachedMax: response.data['body']['last'],
              currentPage: currentState.currentPage + 1));
        } catch (e) {
          ILogger.error(e.toString());
          emit(const TourPlanState.failure(
              message: "errors:something-went-wrong"));
        }
      }
    }
  }
}
