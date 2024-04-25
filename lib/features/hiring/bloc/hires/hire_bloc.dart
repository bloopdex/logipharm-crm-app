import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/logger.dart';
import '../../../../shared/utils/date.formatter.dart';
import '../../models/hire.dart';
import '../../services/hire.repository.dart';

part 'hire_bloc.freezed.dart';
part 'hire_event.dart';
part 'hire_state.dart';

class HireBloc extends Bloc<HireEvent, HireState> {
  HireBloc() : super(const _Initial()) {
    on<_Started>(_started);
    on<_Load>(_load);
    on<_Search>(_search);
  }

  Future<void> _started(_Started event, Emitter<HireState> emit) async {
    emit(const HireState.loading());
    try {
      Response response = await HireRepository.get(
        page: 0,
        size: 10,
        startDate: DateHelper.YYYYMMdd(DateTime(DateTime.now().year, 1, 1)),
        endDate:
            DateHelper.YYYYMMdd(DateTime.now().add(const Duration(days: 1))),
        query: "",
      );

      List<Hire> hires = response.data['body']['content']
          .map<Hire>((tour) => Hire.fromJson(tour))
          .toList();

      emit(HireState.loaded(
          hires: hires,
          hasReachedMax: response.data['body']['last'],
          currentPage: 0));
    } catch (e) {
      ILogger.error(e.toString());
      emit(const HireState.failure(message: "errors:something-went-wrong"));
    }
  }

  Future<void> _load(_Load event, Emitter<HireState> emit) async {
    if (state is _Loaded) {
      final currentState = state as _Loaded;
      if (!currentState.hasReachedMax) {
        try {
          Response response = await HireRepository.get(
            page: currentState.currentPage + 1,
            size: 10,
            startDate: DateHelper.YYYYMMdd(
                event.start ?? DateTime(DateTime.now().year, 1, 1)),
            endDate: DateHelper.YYYYMMdd(event.end ?? DateTime.now()),
            query: event.query,
          );

          List<Hire> hires = response.data['body']['content']
              .map<Hire>((tour) => Hire.fromJson(tour))
              .toList();

          emit(HireState.loaded(
            hires: currentState.hires + hires,
            hasReachedMax: response.data['body']['last'],
            currentPage: currentState.currentPage + 1,
          ));
        } catch (e) {
          ILogger.error(e.toString());
          emit(const HireState.failure(message: "errors:something-went-wrong"));
        }
      }
    }
  }

  FutureOr<void> _search(event, Emitter<HireState> emit) async {
    emit(const HireState.loading());
    try {
      Response response = await HireRepository.get(
        page: 0,
        size: 10,
        startDate: DateHelper.YYYYMMdd(
            event.start ?? DateTime(DateTime.now().year, 1, 1)),
        endDate: DateHelper.YYYYMMdd(event.end ?? DateTime.now()),
        query: event.query,
      );

      List<Hire> hires = response.data['body']['content']
          .map<Hire>((tour) => Hire.fromJson(tour))
          .toList();

      emit(HireState.loaded(
          hires: hires,
          hasReachedMax: response.data['body']['last'],
          currentPage: 0));
    } catch (e) {
      ILogger.error(e.toString());
      emit(const HireState.failure(message: "errors:something-went-wrong"));
    }
  }
}
