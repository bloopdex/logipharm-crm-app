part of 'realization_cubit.dart';

@freezed
class RealizationState with _$RealizationState {
  const factory RealizationState.initial() = _Initial;
  const factory RealizationState.loading() = _Loading;
  const factory RealizationState.loaded(
      {required List<DelegateRealization> list}) = _Loaded;
  const factory RealizationState.failure({required String message}) = _Failure;
}
