part of 'events_cubit.dart';

@freezed
class EventsState with _$EventsState {
  const factory EventsState.initial() = _Initial;
  const factory EventsState.loading() = _Loading;
  const factory EventsState.loaded({required List<Event> events}) = _Loaded;
  const factory EventsState.failure({required String message}) = _Failure;
}
