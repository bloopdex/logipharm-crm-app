part of 'grossiste_cubit.dart';

@freezed
class GrossisteState with _$GrossisteState {
  const factory GrossisteState.initial() = _Initial;
  const factory GrossisteState.loading() = _Loading;
  const factory GrossisteState.loaded(List<Observation> grossistes) = _Loaded;
  const factory GrossisteState.error(String message) = _Error;
}
