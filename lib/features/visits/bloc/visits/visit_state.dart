part of 'visit_bloc.dart';

@freezed
class VisitState with _$VisitState {
  const factory VisitState.initial() = _Initial;
  const factory VisitState.loading() = _Loading;
  const factory VisitState.loaded({
    required List<TourDetail> visits,
    required bool hasReachedMax,
    required int currentPage,
  }) = _Loaded;
  const factory VisitState.failure({required String message}) = _Failure;
}
