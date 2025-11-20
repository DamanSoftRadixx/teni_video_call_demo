import 'dart:async';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' show SpinKitCubeGrid;
import 'package:loader_overlay/loader_overlay.dart' show LoaderOverlay;
import 'core/constants/app_strings.dart';
import 'core/constants/device_constatns.dart';
import 'core/language_them_bloc/bloc/language_them_bloc.dart'
    show LanguageTypes, MapLocaleList;
import 'core/routes/routes.dart';
import 'core/theme/app_theme.dart';
import 'core/common_bloc/app_bloc_observer.dart';
import 'core/utils/device_utils.dart';
import 'di.dart';

void main() async {
  // ✅ Set error handler BEFORE zone (it's just a callback assignment)
  FlutterError.onError = (FlutterErrorDetails details) {
    // Check if it's a PlatformException with DeviceOrientation error
    if (details.exception is PlatformException) {
      final platformException = details.exception as PlatformException;
      if (platformException.message?.contains('DeviceOrientation') ??
          false ||
              (platformException.message?.contains('ordinal()') ?? false)) {
        // Silently ignore this known flutter_webrtc bug
        if (kDebugMode) {
          print(
            '⚠️ Ignored DeviceOrientation error: ${platformException.message}',
          );
        }
        return; // Don't crash, just ignore
      }
    }
    // Handle other errors normally
    FlutterError.presentError(details);
  };

  // ✅ Move everything inside runZonedGuarded to keep same zone
  runZonedGuarded(
    () async {
      // ✅ Move ensureInitialized inside the zone
      WidgetsFlutterBinding.ensureInitialized();

      // Initialize BLoC observer for global monitoring
      Bloc.observer = AppBlocObserver();

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      await FlutterLocalization.instance.ensureInitialized();
      DeviceUtils.configureSystemUIForGame();
      await initDependencies();
      runApp(const MyApp());
    },
    (error, stack) {
      // Catch async errors (PlatformExceptions from native code)
      if (error is PlatformException) {
        if (error.message?.contains('DeviceOrientation') ??
            false || (error.message?.contains('ordinal()') ?? false)) {
          if (kDebugMode) {
            print(
              '⚠️ Ignored DeviceOrientation PlatformException: ${error.message}',
            );
          }
          return; // Don't crash
        }
      }
      // Re-throw other errors
      FlutterError.reportError(
        FlutterErrorDetails(exception: error, stack: stack),
      );
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final FlutterLocalization localization = getIt<FlutterLocalization>();

  @override
  void initState() {
    localization.init(
      mapLocales: MapLocaleList.types,
      initLanguageCode: LanguageTypes.en.languageCode,
    );
    localization.onTranslatedLanguage = _onTranslatedLanguage;
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // loader_overlay
  // please explose this for loading

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        DeviceConstants.designDeviceWidth,
        DeviceConstants.designDeviceHeight,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          supportedLocales: localization.supportedLocales,
          localizationsDelegates: localization.localizationsDelegates,
          title: AppStrings.appName,
          locale: Locale(
            LanguageTypes.en.languageCode,
            LanguageTypes.en.countryCode,
          ),
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: LoaderOverlay(
                overlayWidgetBuilder: (_) {
                  return const Center(
                    child: SpinKitCubeGrid(color: Colors.red, size: 50.0),
                  );
                },
                child: child!,
              ),
            );
          },
        );
      },
    );
  }
}
