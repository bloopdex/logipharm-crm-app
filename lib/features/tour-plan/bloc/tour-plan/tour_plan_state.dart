part of 'tour_plan_bloc.dart';

@freezed
class TourPlanState with _$TourPlanState {
  const factory TourPlanState.initial() = _Initial;
  const factory TourPlanState.loading() = _Loading;
  const factory TourPlanState.loaded({
    required List<Tour> tours,
    required bool hasReachedMax,
    required int currentPage,
    required Goal goal,
  }) = _Loaded;
  const factory TourPlanState.failure({required String message}) = _Failure;
}
