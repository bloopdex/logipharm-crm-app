part of 'tour_plan_bloc.dart';

@freezed
class TourPlanEvent with _$TourPlanEvent {
  const factory TourPlanEvent.started() = _Started;
  const factory TourPlanEvent.search({
    required String query,
    DateTime? start,
    DateTime? end,
  }) = _Search;
  const factory TourPlanEvent.load({
    required String query,
    DateTime? start,
    DateTime? end,
  }) = _Load;

  const factory TourPlanEvent.startTour({
    required String tourId,
  }) = _StartTour;
}
