part of 'hire_bloc.dart';

@freezed
class HireState with _$HireState {
  const factory HireState.initial() = _Initial;
  const factory HireState.loading() = _Loading;
  const factory HireState.loaded({
    required List<Hire> hires,
    required bool hasReachedMax,
    required int currentPage,
  }) = _Loaded;
  const factory HireState.failure({required String message}) = _Failure;
}
