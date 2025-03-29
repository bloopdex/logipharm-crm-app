part of 'event_visits_bloc.dart';

@freezed
class EventVisitsEvent with _$EventVisitsEvent {
  const factory EventVisitsEvent.started({
    required String id,
  }) = _Started;
  const factory EventVisitsEvent.load({
    required String id,
    required String startDate,
    required String endDate,
  }) = _Load;
  const factory EventVisitsEvent.search({
    required String id,
    required String startDate,
    required String endDate,
  }) = _Search;
  const factory EventVisitsEvent.reset({
    required String id,
  }) = _Reset;
}
