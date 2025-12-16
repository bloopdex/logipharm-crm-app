import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:crm/core/core.dart';
import 'package:crm/features/tour-plan/services/goal.repository.dart';
import 'package:crm/l10n/l10n.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/logger.dart';
import '../../../../shared/utils/date.formatter.dart';
import '../../models/goal/goal.dart';
import '../../models/tour.dart';
import '../../services/tour.repository.dart';

part 'tour_plan_bloc.freezed.dart';
part 'tour_plan_event.dart';
part 'tour_plan_state.dart';

class TourPlanBloc extends Bloc<TourPlanEvent, TourPlanState> {
  static const int _pageSize = 10;
  TourPlanBloc() : super(const _Initial()) {
    on<_Started>(_started);
    on<_Search>(_search);
    on<_Load>(_load);
    on<_StartTour>(_startTour);
    on<_CloseTour>(_closeTour);
    on<_Reset>(_reset);
  }

  Future<void> _started(_Started event, Emitter<TourPlanState> emit) async {
    emit(const TourPlanState.loading());
    try {
      Response response = await TourRepository.get(
        page: 0,
        size: _pageSize,
        startDate: DateHelper.YYYYMMdd(DateTime(DateTime.now().year, 1, 1)),
        endDate: DateHelper.YYYYMMdd(DateTime(DateTime.now().year, 12, 31)),
        query: "",
      );

      var rawTours = response.data['body']['content'];
      List<Tour> tours = rawTours.map<Tour>((tour) {
        var parsedTour = Tour.fromJson(tour);
        // Ensure totalClients and visitedClients are calculated correctly
        int totalClients = int.tryParse((tour['tourneeDetails']?.length ?? 0).toString()) ?? 0;
        int visitedClients = tour['tourneeDetails']?.where((detail) {
              return (int.tryParse(detail['statusFlag'].toString()) ?? 0) == 1;
            })?.length ??
            0;

        return parsedTour.copyWith(
          totalClients: totalClients,
          visitedClients: visitedClients,
        );
      }).toList();
      bool hasReachedMax = response.data['body']['last'];

      response = await GoalRepository.get();
      var rawGoal = response.data['body'];
      Goal goal = Goal.fromJson(rawGoal);

      emit(TourPlanState.loaded(
        tours: tours,
        hasReachedMax: hasReachedMax,
        currentPage: 0,
        goal: goal,
      ));
    } catch (e) {
      ILogger.error(e.toString());
      emit(const TourPlanState.failure(message: "errors:something-went-wrong"));
    }
  }

  Future<void> _search(_Search event, Emitter<TourPlanState> emit) async {
    if (state is! _Loaded) return;
    Goal goal = (state as _Loaded).goal;
    emit(const TourPlanState.loading());
    try {
      Response response = await TourRepository.get(
        page: 0,
        size: _pageSize,
        startDate: DateHelper.YYYYMMdd(event.start ?? DateTime(DateTime.now().year, 1, 1)),
        endDate: DateHelper.YYYYMMdd(event.end ?? DateTime.now()),
        query: event.query,
      );

      var rawTours = response.data['body']['content'];
      List<Tour> tours = rawTours.map<Tour>((tour) {
        var parsedTour = Tour.fromJson(tour);
        // Ensure totalClients and visitedClients are calculated correctly
        int totalClients = int.tryParse((tour['tourneeDetails']?.length ?? 0).toString()) ?? 0;
        int visitedClients = tour['tourneeDetails']?.where((detail) {
              return (int.tryParse(detail['statusFlag'].toString()) ?? 0) == 1;
            })?.length ??
            0;

        return parsedTour.copyWith(
          totalClients: totalClients,
          visitedClients: visitedClients,
        );
      }).toList();

      emit(TourPlanState.loaded(
        tours: tours,
        hasReachedMax: response.data['body']['last'],
        currentPage: 0,
        goal: goal,
      ));
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
            size: _pageSize,
            startDate: DateHelper.YYYYMMdd(event.start ?? DateTime(DateTime.now().year, 1, 1)),
            endDate: DateHelper.YYYYMMdd(event.end ?? DateTime.now()),
            query: event.query,
          );

          var rawTours = response.data['body']['content'];
          List<Tour> tours = rawTours.map<Tour>((tour) {
            var parsedTour = Tour.fromJson(tour);
            // Ensure totalClients and visitedClients are calculated correctly
            int totalClients = int.tryParse((tour['tourneeDetails']?.length ?? 0).toString()) ?? 0;
            int visitedClients = tour['tourneeDetails']?.where((detail) {
                  return (int.tryParse(detail['statusFlag'].toString()) ?? 0) == 1;
                })?.length ??
                0;

            return parsedTour.copyWith(
              totalClients: totalClients,
              visitedClients: visitedClients,
            );
          }).toList();

          emit(TourPlanState.loaded(
            tours: currentState.tours + tours,
            hasReachedMax: response.data['body']['last'],
            currentPage: currentState.currentPage + 1,
            goal: currentState.goal,
          ));
        } catch (e) {
          ILogger.error(e.toString());
          emit(const TourPlanState.failure(message: "errors:something-went-wrong"));
        }
      }
    }
  }

  FutureOr<void> _startTour(_StartTour event, Emitter<TourPlanState> emit) async {
    emit(const TourPlanState.loading());
    try {
      Response response = await TourRepository.startTour(tourId: event.tourId);
      if (response.statusCode != 200) {
        log(response.data.toString());
        switch (response.data['codeError']) {
          case 'error.exist.others.tourney.open':
            emit(TourPlanState.failure(message: S.current.tourErrorExistOpenTour));
            break;
          case 'error.tourney.is.closed':
            emit(TourPlanState.failure(message: S.current.tourErrorExistClosedTour));
            break;
          case 'error.ressourceRequiredAuthentication':
            emit(TourPlanState.failure(message: i10n.tourErrorResourceRequireAuthentication));
            break;
          default:
            emit(const TourPlanState.failure(message: "errors:something-went-wrong"));
        }
      }
      add(const TourPlanEvent.started());
    } catch (e) {
      ILogger.error(e.toString());
      emit(const TourPlanState.failure(message: "errors:something-went-wrong"));
    }
  }

  FutureOr<void> _closeTour(_CloseTour event, Emitter<TourPlanState> emit) async {
    emit(const TourPlanState.loading());
    try {
      Response response = await TourRepository.closeTour(tourId: event.tourId);
      if (response.statusCode != 200) {
        log(response.data.toString());
        switch (response.data['codeError']) {
          case 'error.exist.others.tourney.open':
            emit(TourPlanState.failure(message: S.current.tourErrorExistOpenTour));
            break;
          case 'error.tourney.is.closed':
            emit(TourPlanState.failure(message: S.current.tourErrorExistClosedTour));
            break;
          case 'error.ressourceRequiredAuthentication':
            emit(TourPlanState.failure(message: i10n.tourErrorResourceRequireAuthentication));
            break;
          default:
            emit(const TourPlanState.failure(message: "errors:something-went-wrong"));
        }
      }
      add(const TourPlanEvent.started());
    } catch (e) {
      ILogger.error(e.toString());
      emit(const TourPlanState.failure(message: "errors:something-went-wrong"));
    }
  }

  FutureOr<void> _reset(event, Emitter<TourPlanState> emit) {
    emit(const TourPlanState.initial());
  }
}
