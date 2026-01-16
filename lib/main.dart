import 'dart:async';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_architecture/api/global_api.dart';
import 'package:flutter_base_architecture/api/upload_file_bloc.dart';
import 'package:flutter_base_architecture/page_routes.dart';
import 'package:flutter_base_architecture/pages/login/register/component/filter_bottom_sheet/filter_provider.dart';
import 'package:flutter_base_architecture/pages/splash/splash_screen.dart';
import 'package:flutter_base_architecture/preference/preference.dart';
import 'package:flutter_base_architecture/repository/filter_repository.dart';
import 'package:flutter_base_architecture/repository/login_repository.dart';
import 'package:flutter_base_architecture/repository/repository.dart';
import 'package:flutter_base_architecture/theme/styles.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:upgrader/upgrader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'models/app_provider.dart';
import 'pages/login/login.dart';
import 'pages/login/register/register.dart';
import 'theme/app_strings.dart';
import 'theme/colors.dart';
import 'widgets/widget.dart';
import 'package:device_uuid/device_uuid.dart';

List<CameraDescription>? camerasFront;
List<CameraDescription>? camerasBack;
List<CameraDescription>? camerasFace;

List<CameraDescription>? cameras;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Upgrader.clearSavedSettings(); // REMOVE this for release builds

  configLoading();
  HttpOverrides.global = MyHttpOverrides();
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.max,
  );
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  // _getCurrentLocation();
  // globalApi.determinePosition().then((value) {
  //   globalApi.curPosition = value;
  // });

  ///ERROR: https://github.com/flutter/flutter/issues/73286
  // GestureBinding.instance?.resamplingEnabled = true;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light));
  await PreferenceManager.init();
  final firstLaunch =
      PreferenceManager.getBoolean(PreferenceManager.KEY_FIRST_LAUNCH, true);
  bool isLogged =
      PreferenceManager.getString(PreferenceManager.KEY_ACCESS_TOKEN, '')
          .isNotEmpty;

  if (isLogged) {
    final fuck =
        PreferenceManager.getString(PreferenceManager.KEY_CURRENT_USER, '');

    final isFirstToken =
        PreferenceManager.getString(PreferenceManager.KEY_ACCESS_TOKEN, '');
  }

  runApp(MultiProvider(
      providers: [
        Provider(create: (context) => Repository()),
        Provider(create: (context) => LoginRepository()),
        Provider(create: (_) => FilterRepository()),
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => FilterProvider()),
        ChangeNotifierProvider(create: (_) => UploadFileBloc()),
      ],
      child: MyApp(
        isLogged: isLogged,
      )));

  camerasFront = await availableCameras();
  camerasBack = await availableCameras();
  camerasFace = await availableCameras();
  cameras = await availableCameras();
  FirebaseMessaging.instance.getToken().then((value) async {
    print("TOKEN == $value");
    await PreferenceManager.setValue<String>(
        PreferenceManager.KEY_FCM_TOKEN, value!);
  });
}

final GlobalKey<NavigatorState> navigatorGlobal = GlobalKey();

class MyApp extends StatefulWidget {
  final bool firstLaunch;
  final bool isLogged;

  const MyApp({Key? key, this.firstLaunch = true, required this.isLogged})
      : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _uuid = 'Unknown';
  final _deviceUuidPlugin = DeviceUuid();
  @override
  void initState() {
    // ScreenProtector.protectDataLeakageWithBlur();

    initPlatformState();
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String uuid;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      uuid = await _deviceUuidPlugin.getUUID() ?? 'Unknown uuid version';
    } on PlatformException {
      uuid = 'Failed to get uuid version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    setState(() async {
      _uuid = uuid;
      await PreferenceManager.setString(PreferenceManager.UUID_DEVICE, _uuid);
    });
  }

  @override
  void dispose() {
    // ScreenProtector.protectDataLeakageWithBlurOff();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      // showPerformanceOverlay: true,

      navigatorKey: navigatorGlobal,
      debugShowCheckedModeBanner: false,
      navigatorObservers: [BotToastNavigatorObserver()],
      builder: EasyLoading.init(
        builder: (context, child) {
          // fix font size in your device

          final a = ResponsiveBreakpoints.builder(
            child: BouncingScrollWrapper.builder(context, child!),
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          );
          final b = BotToastInit()(context, a);
          child = EasyLoading.init(
            builder: (context, child1) {
              // fix font size in your device
              final mediaQueryData = MediaQuery.of(context);
              final constrainedTextScaleFactor =
                  mediaQueryData.textScaleFactor.clamp(1.0, 1.0);
              return MediaQuery(
                  data: mediaQueryData.copyWith(
                      textScaleFactor: constrainedTextScaleFactor.toDouble()),
                  child: child1!);
            },
          )(context, b);
          return child;
        },
      ),

      theme: ThemeData(
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: AppColors.primaryGreen,
          primaryColorLight: Colors.white,
          iconTheme: IconThemeData(
            color: AppColors.iconDefaultColor,
          ),
          textTheme: AppStyles.textTheme,
          dividerTheme:
              DividerThemeData(color: AppColors.dividerGray, thickness: 1),
          canvasColor: Colors.white,
          scaffoldBackgroundColor: AppColors.textWhite,
          unselectedWidgetColor: AppColors.iconDefaultColor,
          indicatorColor: AppColors.primaryGreen,
          tabBarTheme: TabBarTheme(
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: AppColors.primaryGreen,
            labelPadding: EdgeInsets.only(left: 0, right: 0),
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColors.primaryGreen,
          ),
          cupertinoOverrideTheme: CupertinoThemeData(
              textTheme: CupertinoTextThemeData(
                dateTimePickerTextStyle:
                    TextStyle(color: AppColors.textDefault, fontSize: 16),
                pickerTextStyle: TextStyle(
                    color: AppColors.pickerDefaultColor, fontSize: 16),
              ),
              brightness: Brightness.light),
          hintColor: AppColors.grey,
          buttonTheme: ButtonThemeData(height: 42),
          inputDecorationTheme: InputDecorationTheme(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: AppStyles.textTheme.bodyLarge
                ?.copyWith(color: AppColors.textGrayColor[500]!),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.textGrayColor[500]!)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.textGrayColor[500]!)),
            hintStyle: AppStyles.textTheme.bodyLarge
                ?.copyWith(color: AppColors.textGrayColor[700]!, fontSize: 16),
          ),
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: AppColors.accentColor)),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('vi'),
      ],
      locale: const Locale('vi'),
      initialRoute: PageRoutes.splash_screen,
      routes: _pageMap(),
    );
  }

  _pageMap() {
    return <String, WidgetBuilder>{
      PageRoutes.splash_screen: (BuildContext context) {
        return SplashScreen();
      },
      PageRoutes.login: (BuildContext context) {
        return ChangeNotifierProvider(
            create: (_) =>
                LoginViewModel(repository: context.read<LoginRepository>()),
            child: LoginScreen());
      },
      PageRoutes.register: (BuildContext context) {
        final arguments = (ModalRoute.of(context)?.settings.arguments ??
            <String, dynamic>{}) as Map;
        final accountType = arguments[AppStrings.TYPE_ACCOUNT];
        final isRegister = arguments[AppStrings.IS_REGISTER];
        return ChangeNotifierProvider(
          create: (_) => RegisterViewModel(
              repository: context.read<LoginRepository>(),
              accountType: accountType,
              isRegister: isRegister,
              context: context),
          child: RegisterScreen(),
        );
      },
    };
  }
}

_getCurrentLocation() {
  Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
          forceAndroidLocationManager: true)
      .then((Position position) {
    globalApi.curPosition = position;
  }).catchError((e) {
    Geolocator.requestPermission();
    // debugPrint(e);
  });
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorWidget = LoadingSpinner()
    ..indicatorSize = 45.0
    ..radius = 5
    ..progressColor = Colors.white
    ..backgroundColor = Colors.transparent
    // ..indicatorColor = Colors.white
    ..indicatorColor = Colors.transparent
    ..textColor = Colors.white
    ..maskColor = Color(0xff475D6B).withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = true
    ..animationStyle = EasyLoadingAnimationStyle.offset
    ..boxShadow = <BoxShadow>[BoxShadow(color: Colors.transparent)]
    ..maskType = EasyLoadingMaskType.black;
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
