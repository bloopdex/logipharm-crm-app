part of 'tour_creation_cubit.dart';

@freezed
class TourCreationState with _$TourCreationState {
  const factory TourCreationState.initial() = _Initial;
  const factory TourCreationState.loading() = _Loading;
  const factory TourCreationState.loaded({required Tour tour}) = _Loaded;
  const factory TourCreationState.failure({required String message}) = _Failure;
}
