part of 'tour_plan_bloc.dart';

@freezed
class TourPlanEvent with _$TourPlanEvent {
  const factory TourPlanEvent.started() = _Started;
  const factory TourPlanEvent.search({
    String? query,
    DateTime? start,
    DateTime? end,
  }) = _Search;
  const factory TourPlanEvent.load({
    String? query,
    DateTime? start,
    DateTime? end,
  }) = _Load;
}
