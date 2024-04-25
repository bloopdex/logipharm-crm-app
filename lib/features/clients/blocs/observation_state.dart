part of 'observation_cubit.dart';

@freezed
class ObservationState with _$ObservationState {
  const factory ObservationState.initial() = _Initial;
  const factory ObservationState.loading() = _Loading;
  const factory ObservationState.loaded(List<Observation> observations) =
      _Loaded;
  const factory ObservationState.error(String message) = _Error;
}
