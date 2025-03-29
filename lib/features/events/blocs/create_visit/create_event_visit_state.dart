part of 'create_event_visit_cubit.dart';

@freezed
class CreateEventVisitState with _$CreateEventVisitState {
  const factory CreateEventVisitState.initial() = _Initial;
  const factory CreateEventVisitState.loading() = _Loading;
  const factory CreateEventVisitState.loaded({required EventVisite eventVisit}) = _Loaded;
  const factory CreateEventVisitState.failure({required String message}) = _Failure;
}
