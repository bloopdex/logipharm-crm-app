part of 'veille_concurrentielle_cubit.dart';

@freezed
class VeilleConcurrentielleState with _$VeilleConcurrentielleState {
  const factory VeilleConcurrentielleState.initial() = _Initial;
  const factory VeilleConcurrentielleState.loading() = _Loading;
  const factory VeilleConcurrentielleState.loaded(List<Observation> veilles) = _Loaded;
  const factory VeilleConcurrentielleState.error(String message) = _Error;
}
