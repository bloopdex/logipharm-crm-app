import 'package:crm/features/auth/login.screen.dart';
import 'package:crm/features/navigation/navigation.screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    LoginScreen.routeName: (context) => const LoginScreen(),
    NavigationScreen.routeName: (context) => const NavigationScreen(),
  };
}
