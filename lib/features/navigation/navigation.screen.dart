import 'package:crm/core/core.dart';
import 'package:crm/features/auth/login.screen.dart';
import 'package:crm/features/contacts/bloc/contacts_cubit.dart';
import 'package:crm/features/events/blocs/events/events_cubit.dart';
import 'package:crm/features/menu/sections/change_password_page.dart';
import 'package:crm/features/todo/create-event.page.dart';
import 'package:crm/features/tour-plan/bloc/clients/clients_cubit.dart';
import 'package:crm/features/tour-plan/bloc/commune_cubit.dart';
import 'package:crm/features/tour-plan/bloc/delegate_cubit.dart';
import 'package:crm/features/tour-plan/bloc/tour-plan/tour_plan_bloc.dart';
import 'package:crm/features/tour-plan/bloc/wilaya_cubit.dart';
import 'package:crm/features/tour-plan/core/enums.dart';
import 'package:crm/features/tour-plan/create-plan.page.dart';
import 'package:crm/logic/auth/auth_bloc.dart';
import 'package:crm/logic/localizations/localizations_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/widgets/inputs/daterange.picker.input.dart';
import '../../shared/widgets/navigation/bottom.navigation.bar.widget.dart';
import '../todo/create-todo.page.dart';
import '../tour-plan/bloc/visit_motif_cubit.dart';
import '../visits/bloc/contact_type_cubit.dart';
import '../visits/bloc/visits/visit_bloc.dart';
import 'cubit/navigation_cubit.dart';

class NavigationScreen extends StatefulWidget {
  static String routeName = '/layout';
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            unauthenticated: () {
              context.pushAndRemoveUntil(const LoginScreen());
            });
      },
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          NavigationCubit layout = NavigationCubit.get(context);
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                centerTitle: layout.current.value != 0,
                title: Text(
                  layout.current.value == 0
                      ? "${context.i10n.homeHello} ${context.read<AuthBloc>().user.fullName}"
                      : layout.title,
                  style: context.textTheme.displaySmall,
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                actions: [
                  if (layout.current.value == 2) const CustomDateRangePicker(),
                  if (layout.current.value == 4) ...{
                    IconButton(
                      icon: const Icon(Icons.language, color: kCeruleanBlue),
                      onPressed: () {
                        context.read<LocalizationsBloc>().add(
                            LocalizationsEvent.changeLocale(
                                locale: context
                                            .read<LocalizationsBloc>()
                                            .state
                                            .locale ==
                                        const Locale('en')
                                    ? const Locale('fr')
                                    : const Locale('en')));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        context.push(const ChangePasswordScreen());
                      },
                    ),
                  }
                ],
              ),
              body: layout.currentScreen,
              floatingActionButtonLocation:
                  layout.current.value == 3 ? ExpandableFab.location : null,
              floatingActionButton: layout.current.value == 1
                  ? FloatingActionButton(
                      heroTag: 'createPlan',
                      onPressed: () {
                        final current =
                            context.read<TourPlanBloc>().state.maybeWhen(
                                  loaded: (tours, hasReachedMax, currentPage,
                                      goal) {
                                    return tours
                                        .where((element) =>
                                            element.statusFlag ==
                                            StatuFlags.opened.value)
                                        .firstOrNull;
                                  },
                                  orElse: () => null,
                                );
                        final user = context.read<AuthBloc>().user;
                        if (current == null || user.supervisor == 0) {
                          Navigator.pushNamed(
                              context, CreatePlanPage.routeName);
                        } else {
                          context.errorSnackBar(
                              context.i10n.cantCreatePlanWhileOpened);
                        }
                      },
                      child: Icon(Icons.add_outlined, color: kWhite),
                    )
                  : layout.current.value == 3
                      ? ExpandableFab(
                          key: const Key('todoFab'),
                          distance: 50.h,
                          type: ExpandableFabType.up,
                          duration: Duration.zero,
                          childrenOffset: Offset(0, kSpacingX3),
                          openButtonBuilder: FloatingActionButtonBuilder(
                            size: kSpacingX7,
                            builder: (context, onPressed, progress) {
                              return FloatingActionButton(
                                heroTag: 'openTask',
                                onPressed: onPressed,
                                child: const Icon(Icons.add_rounded),
                              );
                            },
                          ),
                          closeButtonBuilder: FloatingActionButtonBuilder(
                            size: kSpacingX7,
                            builder: (context, onPressed, progress) {
                              return FloatingActionButton(
                                heroTag: 'closeTask',
                                onPressed: onPressed,
                                child: const Icon(Icons.close_rounded),
                              );
                            },
                          ),
                          children: [
                            InkWell(
                              key: const Key('createEvent'),
                              onTap: () {
                                context.push(const CreateEventPage());
                              },
                              child: Container(
                                width: 170.h,
                                height: 50.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: kPaddingMd3,
                                  vertical: kPaddingMd2,
                                ),
                                decoration: BoxDecoration(
                                  color: kCeruleanBlue.shade500,
                                  // Bottom border
                                  border: Border(
                                    bottom: BorderSide(
                                      color: kWhite,
                                      width: 1,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(kPaddingLg1),
                                    bottomRight: Radius.circular(kPaddingLg1),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(context.i10n.todoEvent,
                                        style: context.textTheme.labelLarge!
                                            .copyWith(color: kWhite)),
                                    SizedBox(width: kSpacingX3),
                                    Icon(
                                      Icons.event_rounded,
                                      color: kWhite,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              key: const Key('createTask'),
                              onTap: () {
                                context.push(const CreateTaskPage());
                              },
                              child: Container(
                                width: 170.h,
                                height: 50.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: kPaddingMd3,
                                  vertical: kPaddingMd2,
                                ),
                                decoration: BoxDecoration(
                                  color: kCeruleanBlue.shade500,
                                  border: Border(
                                    bottom: BorderSide(
                                      color: kWhite,
                                      width: 1,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(kPaddingLg1),
                                    topRight: Radius.circular(kPaddingLg1),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(context.i10n.todoTask,
                                        style: context.textTheme.labelLarge!
                                            .copyWith(color: kWhite)),
                                    SizedBox(width: kSpacingX3),
                                    Icon(
                                      Icons.check_circle_outline_rounded,
                                      color: kWhite,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : null,
              bottomNavigationBar: CustomBottomNavigationBar(layout: layout),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    if (context.read<DelegateCubit>().state.isEmpty) {
      context.read<DelegateCubit>().load();
    }
    if (context.read<WilayaCubit>().state.isEmpty) {
      context.read<WilayaCubit>().load();
    }
    if (context.read<CommuneCubit>().state.isEmpty) {
      context.read<CommuneCubit>().load();
    }
    if (context.read<MotifVisitCubit>().state.isEmpty) {
      context.read<MotifVisitCubit>().load();
    }
    if (context.read<ContactTypeCubit>().state.isEmpty) {
      context.read<ContactTypeCubit>().load();
    }
    if (context.read<ClientsCubit>().state.maybeWhen(
          orElse: () => true,
          loaded: (all, filter) => all.isEmpty,
        )) {
      context.read<ClientsCubit>().load();
    }
    if (context.read<ContactsCubit>().state.maybeWhen(
        orElse: () => true, loaded: (contacts) => contacts.isEmpty)) {
      context.read<ContactsCubit>().load();
    }
    if (context.read<TourPlanBloc>().state.maybeWhen(
        orElse: () => true, loaded: (tours, _, __, ___) => tours.isEmpty)) {
      context.read<TourPlanBloc>().add(const TourPlanEvent.started());
    }
    if (context.read<VisitBloc>().state.maybeWhen(
        orElse: () => true, loaded: (visits, _, __) => visits.isEmpty)) {
      context.read<VisitBloc>().add(const VisitEvent.started());
    }

    if (context
        .read<EventsCubit>()
        .state
        .maybeWhen(orElse: () => true, loaded: (events) => events.isEmpty)) {
      context.read<EventsCubit>().loadEvents(page: 0);
    }

    super.initState();
  }
}
