part of 'navigation_cubit.dart';

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState.home() = _Home;
  const factory NavigationState.plans() = _Plans;
  const factory NavigationState.visits() = _Visits;
  const factory NavigationState.todo() = _Todo;
  const factory NavigationState.menu() = _Menu;
}
