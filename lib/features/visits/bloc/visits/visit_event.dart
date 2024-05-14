part of 'visit_bloc.dart';

@freezed
class VisitEvent with _$VisitEvent {
  const factory VisitEvent.started() = _Started;
  const factory VisitEvent.search({
    DateTime? start,
    DateTime? end,
  }) = _Search;
  const factory VisitEvent.load({
    DateTime? start,
    DateTime? end,
  }) = _Load;

  const factory VisitEvent.reset() = _Reset;
}
