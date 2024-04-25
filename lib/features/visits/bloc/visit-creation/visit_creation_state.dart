part of 'visit_creation_cubit.dart';

@freezed
class VisitCreationState with _$VisitCreationState {
  const factory VisitCreationState.initial() = _Initial;
  const factory VisitCreationState.loading() = _Loading;
  const factory VisitCreationState.loaded({required TourDetail visit}) =
      _Loaded;
  const factory VisitCreationState.failure({required String message}) =
      _Failure;
}
