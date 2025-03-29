import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/utils/date.formatter.dart';
import '../../models/eventvisite/eventvisite.dart';
import '../../repositories/event_visits_repository.dart';

part 'event_visits_bloc.freezed.dart';
part 'event_visits_event.dart';
part 'event_visits_state.dart';

class EventVisitsBloc extends Bloc<EventVisitsEvent, EventVisitsState> {
  EventVisitsBloc() : super(const EventVisitsState.initial()) {
    on<_Started>(_onStarted);
    on<_Load>(_onLoad);
    on<_Search>(_onSearch);
    on<_Reset>(_onReset);
  }

  Future<void> _onStarted(_Started event, Emitter<EventVisitsState> emit) async {
    emit(const EventVisitsState.loading());
    try {
      final response = await EventVisitsRepository.getEventVisits(
        id: event.id,
        page: 0,
        size: 20,
        startDate: DateHelper.YYYYMMdd(DateTime(DateTime.now().year, 1, 1)),
        endDate: DateHelper.YYYYMMdd(DateTime.now().add(const Duration(days: 1))),
      );

      final List<EventVisite> eventVisits = response.data['body']['content']
          .map<EventVisite>((visit) => EventVisite.fromJson(visit))
          .toList();

      emit(EventVisitsState.loaded(
        eventVisits: eventVisits,
        hasReachedMax: response.data['body']['last'],
        currentPage: 0,
      ));
    } catch (e) {
      emit(const EventVisitsState.failure(message: 'Failed to load event visits'));
    }
  }

  Future<void> _onLoad(_Load event, Emitter<EventVisitsState> emit) async {
    final currentState = state;
    if (currentState is! _Loaded) return;

    if (currentState.hasReachedMax) return;

    try {
      final response = await EventVisitsRepository.getEventVisits(
        id: event.id,
        page: currentState.currentPage + 1,
        size: 20,
        startDate: event.startDate,
        endDate: event.endDate,
      );

      final List<EventVisite> newEventVisits = response.data['body']['content']
          .map<EventVisite>((visit) => EventVisite.fromJson(visit))
          .toList();

      emit(EventVisitsState.loaded(
        eventVisits: currentState.eventVisits + newEventVisits,
        hasReachedMax: response.data['body']['last'],
        currentPage: currentState.currentPage + 1,
      ));
    } catch (e) {
      emit(const EventVisitsState.failure(message: 'Failed to load more event visits'));
    }
  }

  Future<void> _onSearch(_Search event, Emitter<EventVisitsState> emit) async {
    emit(const EventVisitsState.loading());
    try {
      final response = await EventVisitsRepository.getEventVisits(
        id: event.id,
        page: 0,
        size: 20,
        startDate: event.startDate,
        endDate: event.endDate,
      );

      final List<EventVisite> eventVisits = response.data['body']['content']
          .map<EventVisite>((visit) => EventVisite.fromJson(visit))
          .toList();

      emit(EventVisitsState.loaded(
        eventVisits: eventVisits,
        hasReachedMax: response.data['body']['last'],
        currentPage: 0,
      ));
    } catch (e) {
      emit(const EventVisitsState.failure(message: 'Failed to search event visits'));
    }
  }

  void _onReset(_Reset event, Emitter<EventVisitsState> emit) {
    emit(const EventVisitsState.initial());
  }
}
