import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:battery_plus/battery_plus.dart';
import 'package:crm/features/clients/blocs/claims-motifs/motifs_cubit.dart';
import 'package:crm/features/clients/blocs/details/client_details_cubit.dart';
import 'package:crm/features/clients/blocs/veille_concurrentielle/veille_concurrentielle_cubit.dart';
import 'package:crm/features/events/blocs/events/events_cubit.dart';
import 'package:crm/features/menu/cubits/change_password_cubit.dart';
import 'package:crm/features/orders/blocs/order_details/order_details_cubit.dart';
import 'package:crm/features/orders/blocs/orders/orders_cubit.dart';
import 'package:crm/features/orders/blocs/product/products_cubit.dart';
import 'package:crm/features/todo/cubit/todo_cubit.dart';
import 'package:crm/features/tour-plan/bloc/commune_cubit.dart';
import 'package:crm/features/tour-plan/bloc/tour-plan/tour_plan_bloc.dart';
import 'package:crm/features/visits/bloc/visits/visit_bloc.dart';
import 'package:crm/logic/file/file_cubit.dart';
import 'package:crm/shared/services/helpers/dio.helper.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:workmanager/workmanager.dart';

import 'core/const.dart';
import 'core/routes.dart';
import 'core/theme.dart';
import 'features/auth/bloc/login/login_bloc.dart';
import 'features/auth/login.screen.dart';
import 'features/auth/services/auth.repository.dart';
import 'features/clients/blocs/categories/category_cubit.dart';
import 'features/clients/blocs/claims/claim_cubit.dart';
import 'features/clients/blocs/etablissement/etablissement_cubit.dart';
import 'features/clients/blocs/grossiste/grossiste_cubit.dart';
import 'features/clients/blocs/observation/observation_cubit.dart';
import 'features/clients/blocs/turnover/turnover_cubit.dart';
import 'features/statistics/cubit/monthly_statistics_cubit.dart';
import 'features/contacts/bloc/contacts_cubit.dart';
import 'features/navigation/cubit/navigation_cubit.dart';
import 'features/navigation/navigation.screen.dart';
import 'features/orders/blocs/cart/cart_cubit.dart';
import 'features/orders/product_details_screen.dart';
import 'features/tour-plan/bloc/clients/clients_cubit.dart';
import 'features/tour-plan/bloc/delegate_cubit.dart';
import 'features/tour-plan/bloc/tour-creation/tour_creation_cubit.dart';
import 'features/tour-plan/bloc/visit_motif_cubit.dart';
import 'features/tour-plan/bloc/wilaya_cubit.dart';
import 'features/tour-plan/core/controller.dart';
import 'features/visits/bloc/contact_type_cubit.dart';
import 'features/visits/bloc/visit-creation/visit_creation_cubit.dart';
import 'features/visits/bloc/visit_result_cubit.dart';
import 'features/contacts/bloc/specialite_lov_cubit.dart';
import 'features/clients/blocs/fournisseur_lov/fournisseur_lov_cubit.dart';
import 'l10n/l10n.dart';
import 'logic/auth/auth_bloc.dart';
import 'logic/counter_cubit.dart';
import 'logic/localizations/localizations_bloc.dart';
import 'logic/search/search_cubit.dart';
import 'logic/time.range/time_range_cubit.dart';
import 'shared/widgets/loading/loading.screen.dart';

const platform = MethodChannel('crm.a2s.dz/battery');

void main() async {
  runZonedGuarded(() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await ScreenUtil.ensureScreenSize();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorageDirectory.web
          : HydratedStorageDirectory((await getTemporaryDirectory()).path),
    );

    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://7c4384a09f450f67e99ba58d721a86f1@o4508163822649344.ingest.de.sentry.io/4509638629785680';
        options.sendDefaultPii = true;
      },
    );

    await AuthRepository.setBaseUrl(baseUrl);
    await DioHelper.init();

    await requestForegroundPermissions();
    await initializeService();

    Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: true,
    );
    Workmanager().registerPeriodicTask(
      "update-location-crm",
      "UpdateLocation",
      frequency: const Duration(minutes: 15),
    );

    runApp(const MyApp());
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      await updateLocalization();
      return Future.value(true);
    } catch (e) {
      log('Error in callbackDispatcher: $e');
      return Future.value(false);
    }
  });
}

final FlutterLocalNotificationsPlugin flutterLocalPlugin =
    FlutterLocalNotificationsPlugin();
const AndroidNotificationChannel notificationChannel =
    AndroidNotificationChannel(
        "a2s fetch location", "A2S is fetching your location",
        description:
            "This is a notification that shows that a2s is fetching ur location",
        importance: Importance.high);

Future<void> initializeService() async {
  try {
    var service = FlutterBackgroundService();
    if (Platform.isIOS) {
      await flutterLocalPlugin.initialize(
          const InitializationSettings(iOS: DarwinInitializationSettings()));
    }

    await flutterLocalPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(notificationChannel);

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
        foregroundServiceTypes: [AndroidForegroundType.location],
      ),
      iosConfiguration: IosConfiguration(),
    );
    service.startService();
  } catch (e) {
    log('Error initializing service: $e');
  }
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  // Call startForeground immediately for Android
  if (service is AndroidServiceInstance) {
    // This is the crucial part - call startForeground immediately
    service.setAsForegroundService();

    // Update the notification periodically
    Timer.periodic(const Duration(seconds: 5), (timer) {
      service.setForegroundNotificationInfo(
        title: "A2S is fetching your location",
        content:
            "This is a notification that shows that a2s is fetching ur location",
      );
    });
  }

  service.on('setAsForeground').listen((event) {
    if (service is AndroidServiceInstance) {
      service.setAsForegroundService();
    }
  });

  service.on('setAsBackground').listen((event) {
    if (service is AndroidServiceInstance) {
      service.setAsBackgroundService();
    }
  });

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  // Your location update logic
  Timer.periodic(const Duration(minutes: 1), (timer) async {
    await updateLocalization();
  });
}

Future<bool> requestForegroundPermissions() async {
  final status = await Permission.locationWhenInUse.request();
  final foregroundStatus = await Permission.locationAlways.request();

  return status.isGranted && foregroundStatus.isGranted;
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

    final dio = Dio(BaseOptions(
      validateStatus: (status) => true,
      receiveDataWhenStatusError: true,
    ));
    (dio.httpClientAdapter as IOHttpClientAdapter).validateCertificate =
        (certificate, host, port) => true;
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      HttpClient client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    final response = await dio.post(
      '$baseUrl/position',
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
    await Geolocator.openLocationSettings();
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

  Position position = await Geolocator.getCurrentPosition();
  return LocationData(
    latitude: position.latitude,
    longitude: position.longitude,
    speed: position.speed,
    course: position.heading,
    bearing: position.heading,
    altitude: position.altitude,
    accuracy: position.accuracy,
    hdop: 0.0,
  );
}

Future<BatteryInfo?> getBatteryInfo() async {
  try {
    Battery battery = Battery();
    int level = await battery.batteryLevel;
    bool charging = (await battery.batteryState) == BatteryState.charging;

    return BatteryInfo(
      level: level,
      charging: charging,
    );
  } catch (e) {
    log("Error getting battery data: $e");
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
  final int level;
  final bool charging;

  BatteryInfo({
    required this.level,
    this.charging = false,
  });
}

class TestAppBanner extends StatelessWidget {
  const TestAppBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Banner(
      message: 'TEST MODE',
      location: BannerLocation.topStart,
      color: Colors.redAccent,
      textStyle: const TextStyle(color: Colors.white, fontSize: 16),
      child: Container(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late AuthBloc authBloc;

  final bool isDebugMode =
      false; // Set to true for debug mode, false for release mode

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
          BlocProvider<LocalizationsBloc>(
              create: (context) => LocalizationsBloc()),
          BlocProvider(
            create: (context) => authBloc,
          ),
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(authBloc),
          ),
          BlocProvider<NavigationCubit>(create: (context) => NavigationCubit()),
          BlocProvider<FileCubit>(create: (context) => FileCubit()),
          BlocProvider<FileLoadingCubit>(
              create: (context) => FileLoadingCubit()),
          BlocProvider<TimeRangeCubit>(create: (context) => TimeRangeCubit()),
          BlocProvider<SearchCubit>(create: (context) => SearchCubit()),
          BlocProvider<CounterCubit>(
              create: (context) => CounterCubit()..reset()),
          BlocProvider<ChangePasswordCubit>(
              create: (context) => ChangePasswordCubit()),
          BlocProvider<DelegateCubit>(
            lazy: false,
            create: (context) => DelegateCubit()..load(),
          ),
          BlocProvider<WilayaCubit>(
            lazy: false,
            create: (context) => WilayaCubit(),
          ),
          BlocProvider<CommuneCubit>(
            lazy: false,
            create: (context) => CommuneCubit(),
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
          BlocProvider<TodoCubit>(create: (context) => TodoCubit()),
          BlocProvider<VisitBloc>(create: (context) => VisitBloc()),
          BlocProvider<ObservationCubit>(
              create: (context) => ObservationCubit()),
          BlocProvider<ClaimCubit>(create: (context) => ClaimCubit()),
          BlocProvider<ClaimMotifCubit>(create: (context) => ClaimMotifCubit()),
          BlocProvider<SpecialiteLovCubit>(
              create: (context) => SpecialiteLovCubit()),
          BlocProvider<FournisseurLovCubit>(
              create: (context) => FournisseurLovCubit()),
          BlocProvider<ClientDetailsCubit>(
              create: (context) => ClientDetailsCubit()),
          BlocProvider<MotifVisitCubit>(create: (context) => MotifVisitCubit()),
          // Contact type for visits
          BlocProvider<ContactTypeCubit>(
              create: (context) => ContactTypeCubit()),
          BlocProvider<VisitResultLovCubit>(
              create: (context) => VisitResultLovCubit()),
          BlocProvider<GrossisteCubit>(create: (context) => GrossisteCubit()),
          BlocProvider<EtablissementCubit>(
              create: (context) => EtablissementCubit()),
          BlocProvider<VeilleConcurrentielleCubit>(
              create: (context) => VeilleConcurrentielleCubit()),
          BlocProvider<TurnoverCubit>(create: (context) => TurnoverCubit()),
          BlocProvider<EventsCubit>(create: (context) => EventsCubit()),
          BlocProvider<ProductsCubit>(
            lazy: true,
            create: (context) => ProductsCubit(),
          ),
          BlocProvider<CartCubit>(
            lazy: true,
            create: (context) => CartCubit(),
          ),
          BlocProvider<QuantityCubit>(
            lazy: true,
            create: (context) => QuantityCubit(),
          ),
          BlocProvider<CategoryCubit>(create: (context) => CategoryCubit()),
          BlocProvider<OrdersCubit>(create: (context) => OrdersCubit()),
          BlocProvider<OrderDetailsCubit>(
              create: (context) => OrderDetailsCubit()),
          BlocProvider<ContactsCubit>(create: (context) => ContactsCubit()),
          BlocProvider<MonthlyStatisticsCubit>(
              create: (context) => MonthlyStatisticsCubit()),
        ],
        child: BlocBuilder<LocalizationsBloc, LocalizationsState>(
            builder: (context, state) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: false,
              textScaler: const TextScaler.linear(1.0),
            ),
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
                  FlutterQuillLocalizations.delegate,
                ],
                routes: AppRoutes.routes,
                home: Builder(builder: (context) {
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () =>
                            FocusManager.instance.primaryFocus?.unfocus(),
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
                              failure: (message) => const LoginScreen(),
                            );
                          },
                        ),
                      ),
                      if (isDebugMode) const TestAppBanner(),
                    ],
                  );
                })),
          );
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
