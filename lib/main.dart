import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:battery/battery.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crm/features/todo/cubit/todo_cubit.dart';
import 'package:crm/features/tour-plan/bloc/tour-plan/tour_plan_bloc.dart';
import 'package:crm/features/visits/bloc/visits/visit_bloc.dart';
import 'package:crm/logic/file/file_cubit.dart';
import 'package:crm/shared/services/helpers/dio.helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:telephony/telephony.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

import 'core/const.dart';
import 'core/routes.dart';
import 'core/theme.dart';
import 'features/auth/bloc/login/login_bloc.dart';
import 'features/auth/login.screen.dart';
import 'features/auth/services/auth.repository.dart';
import 'features/clients/blocs/observation/observation_cubit.dart';
import 'features/navigation/cubit/navigation_cubit.dart';
import 'features/navigation/navigation.screen.dart';
import 'features/tour-plan/bloc/clients/clients_cubit.dart';
import 'features/tour-plan/bloc/delegate_cubit.dart';
import 'features/tour-plan/bloc/tour-creation/tour_creation_cubit.dart';
import 'features/tour-plan/bloc/wilaya_cubit.dart';
import 'features/tour-plan/core/controller.dart';
import 'features/visits/bloc/visit-creation/visit_creation_cubit.dart';
import 'l10n/l10n.dart';
import 'logic/auth/auth_bloc.dart';
import 'logic/counter_cubit.dart';
import 'logic/localizations/localizations_bloc.dart';
import 'logic/search/search_cubit.dart';
import 'logic/time.range/time_range_cubit.dart';
import 'shared/widgets/error/error.screen.dart';
import 'shared/widgets/loading/loading.screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await ScreenUtil.ensureScreenSize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb ? HydratedStorage.webStorageDirectory : await getApplicationDocumentsDirectory(),
  );
  await DioHelper.init();
  await initializeService();

  runApp(const MyApp());
}

final FlutterLocalNotificationsPlugin flutterLocalPlugin = FlutterLocalNotificationsPlugin();
const AndroidNotificationChannel notificationChannel = AndroidNotificationChannel(
    "a2s fetch location", "A2S is fetching your location",
    description: "This is a notification that shows that a2s is fetching ur location",
    importance: Importance.high);

Future<void> initializeService() async {
  var service = FlutterBackgroundService();
  //set for ios
  if (Platform.isIOS) {
    await flutterLocalPlugin
        .initialize(const InitializationSettings(iOS: DarwinInitializationSettings()));
  }

  await flutterLocalPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(notificationChannel);

  //service init and start
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,
      notificationChannelId: "a2s fetch location",
      initialNotificationTitle: "A2S is fetching your location",
      initialNotificationContent:
          "This is a notification that shows that a2s is fetching ur location",
      foregroundServiceNotificationId: 90,
    ),
    iosConfiguration: IosConfiguration(),
  );
  service.startService();
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) {
  DartPluginRegistrant.ensureInitialized();
  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  Timer.periodic(const Duration(minutes: 1), (timer) async {
    await updateLocalization();
    flutterLocalPlugin.show(
      90,
      "A2S Fetch Your Location Successfully",
      "Last Update At ${DateTime.now()}",
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "a2s fetch location",
          "A2S is fetching your location",
          ongoing: true,
          icon: "app_icon",
        ),
      ),
    );
  });
}

Future<void> updateLocalization() async {
  try {
    log('Updating location...');
    final token = await AuthRepository.token;
    if (token == null) {
      log("There is no token");
      return;
    }
    final location = await getCurrentLocation();
    final battery = await getBatteryInfo();

    Map<String, dynamic> data = {
      'latitude': location.latitude,
      'longitude': location.longitude,
      'location': '${location.latitude},${location.longitude}',
      'speed': location.speed,
      'course': location.course,
      'bearing': location.bearing,
      'altitude': location.altitude,
      'accuracy': location.accuracy,
      'hdop': location.hdop,
    };

    if (battery != null) {
      data['battery'] = battery.level;
    }

    log("Data : ${jsonEncode(data)}");
    log("Token : $token");
    final response = await Dio(BaseOptions(
      validateStatus: (status) => true,
    )).post(
      '$HTTP$baseUrl:$port$version/position',
      options: Options(
        headers: {
          'Authorization': token,
        },
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      log('Location updated successfully.');
    } else {
      log('Failed to update location. ${response.data}');
    }
  } catch (e) {
    log('Error updating location: $e');
  }
}

Future<LocationData> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  return LocationData(
    latitude: position.latitude,
    longitude: position.longitude,
    speed: position.speed,
    course: position.heading,
    bearing: position.heading,
    altitude: position.altitude,
    accuracy: position.accuracy,
    hdop: 0.0, // This is a placeholder, replace with actual value if available
  );
}

Future<String> getCellInfo() async {
  final Telephony telephony = Telephony.instance;

  if (await telephony.requestPhoneAndSmsPermissions ?? false) {}
  return '';
}

Future<String> getWifiInfo() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult.contains(ConnectivityResult.wifi)) {
    final wifiBSSID = await WifiInfo().getWifiBSSID();
    final wifiSignalStrength = await WifiInfo().getWifiBSSID();
    return '$wifiBSSID:$wifiSignalStrength';
  }
  return '';
}

Future<BatteryInfo?> getBatteryInfo() async {
  try {
    final battery = Battery();
    final batteryLevel = await battery.batteryLevel;

    return BatteryInfo(level: batteryLevel.toDouble());
  } catch (e) {
    log("Error getting battery info: $e");
    return null;
  }
}

class LocationData {
  final double latitude;
  final double longitude;
  final double speed;
  final double course;
  final double bearing;
  final double altitude;
  final double accuracy;
  final double hdop;

  LocationData({
    required this.latitude,
    required this.longitude,
    required this.speed,
    required this.course,
    required this.bearing,
    required this.altitude,
    required this.accuracy,
    required this.hdop,
  });
}

class BatteryInfo {
  final double level;

  BatteryInfo({
    required this.level,
  });
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
      minTextAdapt: false,
      splitScreenMode: false,
    );

    return MultiBlocProvider(
        providers: [
          BlocProvider<LocalizationsBloc>(create: (context) => LocalizationsBloc()),
          BlocProvider(
            create: (context) => authBloc,
          ),
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(authBloc),
          ),
          BlocProvider<NavigationCubit>(create: (context) => NavigationCubit()),
          BlocProvider<FileCubit>(create: (context) => FileCubit()),
          BlocProvider<FileLoadingCubit>(create: (context) => FileLoadingCubit()),
          BlocProvider<TimeRangeCubit>(create: (context) => TimeRangeCubit()),
          BlocProvider<SearchCubit>(create: (context) => SearchCubit()),
          BlocProvider<CounterCubit>(create: (context) => CounterCubit()..reset()),
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
          BlocProvider<TourCreationCubit>(create: (context) => TourCreationCubit()),
          BlocProvider<TourPlanBloc>(
            create: (context) => TourPlanBloc(),
          ),
          BlocProvider<VisitCreationCubit>(create: (context) => VisitCreationCubit()),
          BlocProvider<TodoCubit>(create: (context) => TodoCubit()),
          BlocProvider<VisitBloc>(create: (context) => VisitBloc()),
          BlocProvider<ObservationCubit>(
            create: (context) => ObservationCubit(),
          ),
        ],
        child: BlocBuilder<LocalizationsBloc, LocalizationsState>(builder: (context, state) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: MaterialApp(
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
                          authenticated: (user, tempError) => const NavigationScreen(),
                          unauthenticated: () => const LoginScreen(),
                          failure: (message) {
                            return ErrorScreen(
                              message: message,
                              onRetry: () {
                                authBloc.add(const AuthEvent.appstarted());
                              },
                            );
                          });
                    },
                  ),
                )),
          );
        }));
  }
}

class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
