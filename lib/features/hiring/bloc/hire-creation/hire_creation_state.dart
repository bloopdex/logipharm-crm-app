part of 'hire_creation_cubit.dart';

@freezed
class HireCreationState with _$HireCreationState {
  const factory HireCreationState.initial() = _Initial;
  const factory HireCreationState.loading() = _Loading;
  const factory HireCreationState.loaded({required Hire hire}) = _Loaded;
  const factory HireCreationState.failure({required String message}) = _Failure;
}
