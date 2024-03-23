import 'package:crm/core/core.dart';
import 'package:crm/features/create-plan/bloc/delegate_cubit.dart';
import 'package:crm/features/create-plan/create-plan.page.dart';
import 'package:crm/logic/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/widgets/navigation/bottom.navigation.bar.widget.dart';
import '../tour-plan/bloc/tour_plan_bloc.dart';
import 'cubit/navigation_cubit.dart';
import 'widgets/notification.button.dart';

class NavigationScreen extends StatefulWidget {
  static String routeName = '/layout';
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  get surfacePrimary => null;

  @override
  void initState() {
    if (context.read<DelegateCubit>().state.isEmpty) {
      context.read<DelegateCubit>().load();
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TourPlanBloc>(
            lazy: false,
            create: (context) =>
                TourPlanBloc()..add(const TourPlanEvent.started())),
      ],
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
                actions: const [
                  NotificationButton(),
                ],
              ),
              body: layout.currentScreen,
              floatingActionButton: layout.current.value == 1
                  ? FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, CreatePlanPage.routeName);
                      },
                      child: Icon(Icons.add_outlined, color: kWhite),
                    )
                  : null,
              bottomNavigationBar: CustomBottomNavigationBar(layout: layout),
            ),
          );
        },
      ),
    );
  }
}
