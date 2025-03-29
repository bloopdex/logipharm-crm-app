import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/event/event.dart';
import '../../repositories/events_repository.dart';

part 'events_cubit.freezed.dart';
part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit() : super(const EventsState.initial());

  Future<void> loadEvents({
    int page = 0,
    int size = 20,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    emit(const EventsState.loading());
    try {
      final response = await EventsRepository.getEvents(
        page: page,
        size: size,
        startDate: startDate,
        endDate: endDate,
      );

      final List<Event> events =
          response.data['body']['content'].map<Event>((event) => Event.fromJson(event)).toList();

      emit(EventsState.loaded(events: events));
    } catch (e) {
      emit(const EventsState.failure(message: 'Failed to load events'));
    }
  }

  void reset() {
    emit(const EventsState.initial());
  }
}
