import 'package:crm/features/tour-plan/bloc/tour-plan/tour_plan_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/routes.dart';
import 'core/theme.dart';
import 'features/auth/bloc/login/login_bloc.dart';
import 'features/auth/login.screen.dart';
import 'features/navigation/cubit/navigation_cubit.dart';
import 'features/navigation/navigation.screen.dart';
import 'features/tour-plan/bloc/clients/clients_cubit.dart';
import 'features/tour-plan/bloc/delegate_cubit.dart';
import 'features/tour-plan/bloc/tour-creation/tour_creation_cubit.dart';
import 'features/tour-plan/bloc/wilaya_cubit.dart';
import 'features/tour-plan/core/controller.dart';
import 'features/visits/bloc/tour-creation/visit_creation_cubit.dart';
import 'l10n/l10n.dart';
import 'logic/auth/auth_bloc.dart';
import 'logic/counter_cubit.dart';
import 'logic/localizations/localizations_bloc.dart';
import 'logic/search/search_cubit.dart';
import 'logic/time.range/time_range_cubit.dart';
import 'shared/services/helpers/dio.helper.dart';
import 'shared/widgets/error/error.screen.dart';
// import 'shared/widgets/error/noconnection.screen.dart';
import 'shared/widgets/loading/loading.screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await ScreenUtil.ensureScreenSize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late AuthBloc authBloc;
  @override
  void initState() {
    DioHelper.init();
    authBloc = AuthBloc();
    authBloc.add(const AuthEvent.appstarted());
    TabController tourController = TabController(length: 4, vsync: this);
    TourTabController.setController(tourController);
    super.initState();
  }

  @override
  void dispose() {
    authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    ScreenUtil.init(
      context,
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
    );

    return MultiBlocProvider(
        providers: [
          BlocProvider<LocalizationsBloc>(
              create: (context) => LocalizationsBloc()),
          BlocProvider(
            create: (context) => authBloc,
          ),
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(authBloc),
          ),
          BlocProvider<NavigationCubit>(create: (context) => NavigationCubit()),
          BlocProvider<TimeRangeCubit>(create: (context) => TimeRangeCubit()),
          BlocProvider<SearchCubit>(create: (context) => SearchCubit()),
          BlocProvider<CounterCubit>(
              create: (context) => CounterCubit()..reset()),
          BlocProvider<DelegateCubit>(
            lazy: false,
            create: (context) => DelegateCubit()..load(),
          ),
          BlocProvider<WilayaCubit>(
            lazy: false,
            create: (context) => WilayaCubit()..load(),
          ),
          BlocProvider<ClientsCubit>(
            lazy: false,
            create: (context) => ClientsCubit()..load(),
          ),
          BlocProvider<TourCreationCubit>(
              create: (context) => TourCreationCubit()),
          BlocProvider<TourPlanBloc>(
            create: (context) => TourPlanBloc(),
          ),
          BlocProvider<VisitCreationCubit>(
              create: (context) => VisitCreationCubit()),
        ],
        child: BlocBuilder<LocalizationsBloc, LocalizationsState>(
            builder: (context, state) {
          return MaterialApp(
              title: 'Logipharm-CRM',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme(),
              scrollBehavior: MyScrollBehavior(),
              locale: state.locale,
              supportedLocales: S.delegate.supportedLocales,
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale!.languageCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              routes: AppRoutes.routes,
              home: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return state.when(
                        initial: () => const SizedBox.shrink(),
                        loading: () {
                          FlutterNativeSplash.remove();
                          return const LoadingScreen();
                        },
                        authenticated: (user, tempError) =>
                            const NavigationScreen(),
                        unauthenticated: () => const LoginScreen(),
                        failure: (message) {
                          return ErrorScreen(
                            message: message,
                            onRetry: () {
                              authBloc.add(const AuthEvent.appstarted());
                            },
                          );
                        });
                    // return LoginScreen();
                  },
                ),
              ));
        }));
  }
}

class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
