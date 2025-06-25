part of 'turnover_cubit.dart';

@freezed
class TurnoverState with _$TurnoverState {
  const factory TurnoverState.initial() = _Initial;
  const factory TurnoverState.loading() = _Loading;
  const factory TurnoverState.loaded({
    required List<Turnover> turnovers,
    required bool hasReachedMax,
  }) = _Loaded;
  const factory TurnoverState.failure({required String message}) = _Failure;
}
