part of 'hire_bloc.dart';

@freezed
class HireEvent with _$HireEvent {
  const factory HireEvent.started() = _Started;
  const factory HireEvent.load({
    required String query,
    DateTime? start,
    DateTime? end,
  }) = _Load;
  const factory HireEvent.search({
    required String query,
    DateTime? start,
    DateTime? end,
  }) = _Search;
}
