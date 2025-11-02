import 'package:crm/features/auth/login.screen.dart';
import 'package:crm/features/tour-plan/create-plan.page.dart';
import 'package:crm/features/navigation/navigation.screen.dart';
import 'package:flutter/material.dart';
import 'package:crm/features/offers/offers_list_page.dart';
import 'package:crm/features/orders/my_orders_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crm/features/orders/blocs/orders/orders_cubit.dart';
import 'package:crm/features/orders/blocs/order_details/order_details_cubit.dart';
import 'package:crm/features/contacts/contacts_list_page.dart';
import 'package:crm/features/contacts/bloc/contacts_cubit.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    LoginScreen.routeName: (context) => const LoginScreen(),
    NavigationScreen.routeName: (context) => const NavigationScreen(),
    CreatePlanPage.routeName: (context) => const CreatePlanPage(),
    OffersListPage.routeName: (context) => const OffersListPage(),
    ContactsListPage.routeName: (context) => BlocProvider(
          create: (_) => ContactsCubit(),
          child: const ContactsListPage(),
        ),
    MyOrdersScreen.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => OrdersCubit()..load()),
            BlocProvider(create: (_) => OrderDetailsCubit()),
          ],
          child: const MyOrdersScreen(),
        ),
  };
}
