part of 'event_visits_bloc.dart';

@freezed
class EventVisitsState with _$EventVisitsState {
  const factory EventVisitsState.initial() = _Initial;
  const factory EventVisitsState.loading() = _Loading;
  const factory EventVisitsState.loaded({
    required List<EventVisite> eventVisits,
    required bool hasReachedMax,
    required int currentPage,
  }) = _Loaded;
  const factory EventVisitsState.failure({required String message}) = _Failure;
}
