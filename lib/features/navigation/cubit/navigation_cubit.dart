import 'package:crm/features/menu/menu.page.dart';
import 'package:crm/features/visits/visit.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../l10n/l10n.dart';
import '../../home/home.page.dart';
import '../../todo/todo.page.dart';
import '../../tour-plan/tour.plan.page.dart';

part 'navigation_cubit.freezed.dart';
part 'navigation_state.dart';

enum AppScreen {
  home(0),
  plans(1),
  visits(2),
  todo(3),
  menu(4);

  const AppScreen(this.value);
  final num value;
}

extension AppScreensExtension on AppScreen {
  Widget get screen {
    switch (this) {
      case AppScreen.home:
        return const HomePage();
      case AppScreen.plans:
        return const PlanTourPage();
      case AppScreen.visits:
        return const VisitPage();
      case AppScreen.todo:
        return const TodoPage();
      case AppScreen.menu:
        return const MenuPage();
      default:
        return const SizedBox.shrink();
    }
  }
}

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState.home());

  static NavigationCubit get(context) => BlocProvider.of(context);

  AppScreen current = AppScreen.home;

  Widget currentScreen = AppScreen.home.screen;

  String title = S.current.navHome;

  void change(int index) {
    switch (index) {
      case 0:
        home();
        break;
      case 1:
        plans();
        break;
      case 2:
        visits();
        break;
      case 3:
        todo();
        break;
      case 4:
        menu();
        break;
    }
  }

  void home() {
    current = AppScreen.home;
    currentScreen = AppScreen.home.screen;
    title = S.current.navHome;
    emit(const NavigationState.home());
  }

  void plans() {
    current = AppScreen.plans;
    currentScreen = AppScreen.plans.screen;
    title = S.current.navPlans;
    emit(const NavigationState.plans());
  }

  void visits() {
    current = AppScreen.visits;
    currentScreen = AppScreen.visits.screen;
    title = S.current.navVisits;
    emit(const NavigationState.visits());
  }

  void todo() {
    current = AppScreen.todo;
    currentScreen = AppScreen.todo.screen;
    title = S.current.navTodos;
    emit(const NavigationState.todo());
  }

  void menu() {
    current = AppScreen.menu;
    currentScreen = AppScreen.menu.screen;
    title = S.current.navMenu;
    emit(const NavigationState.menu());
  }
}
