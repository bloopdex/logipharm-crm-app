import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/widgets/navigation/bottom.app.bar.widget.dart';
import '../../shared/widgets/navigation/bottom.navigation.bar.widget.dart';
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
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        NavigationCubit layout = NavigationCubit.get(context);
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('layout:${layout.title}'.translate(context),
                  style: context.textTheme.headlineLarge!.copyWith(
                    color: kText1,
                  )),
              backgroundColor: Colors.white,
              elevation: 0,
              actions: const [
                NotificationButton(),
              ],
              bottom: layout.current.value == 2
                  ? CustomBottomAppBar(
                      current: layout.current,
                    )
                  : null,
            ),
            body: layout.currentScreen,
            bottomNavigationBar: CustomBottomNavigationBar(layout: layout),
          ),
        );
      },
    );
  }
}
