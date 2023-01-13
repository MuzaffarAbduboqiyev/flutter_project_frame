import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/controller/app_controller/app_bloc.dart';
import 'package:flutter_core/controller/app_controller/app_event.dart';
import 'package:flutter_core/controller/app_controller/app_state.dart';
import 'package:flutter_core/controller/observers/bloc_observer.dart';
import 'package:flutter_core/model/local_database/hive_model/hive_repository.dart';
import 'package:flutter_core/util/service/loader_service/asset_loader.dart';
import 'package:flutter_core/util/service/loader_service/loader_dialog_initial.dart';
import 'package:flutter_core/util/service/network_service/http_override.dart';
import 'package:flutter_core/util/service/route/route_generator.dart';
import 'package:flutter_core/util/service/singleton/singleton.dart';
import 'package:flutter_core/util/theme/app_theme.dart';
import 'package:flutter_core/util/theme/colors.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';

void main() async {
  setupGetIt();
  initialLoadingDialog();
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: backgroundColor, //or set color with: Color(0xFF0000FF)
    ),
  );

  await EasyLocalization.ensureInitialized();

  Bloc.observer = AppBlocObserver();
  runApp(
    EasyLocalization(
      path: 'assets/lang',
      startLocale: const Locale.fromSubtags(languageCode: 'ru'),
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('uz', 'UZ'),
        Locale('en', 'EN'),
      ],
      fallbackLocale: const Locale.fromSubtags(languageCode: 'uz'),
      useFallbackTranslations: true,
      assetLoader: JsonAssetLoader(),
      saveLocale: true,
      child: FutureBuilder(
        future: getIt.allReady(),
        builder: (context, snapshot) => (snapshot.hasData)
            ? BlocProvider(
                create: (context) => AppBloc(
                  hiveRepository: getIt<HiveRepository>(),
                )..add(
                    AppInitEvent(),
                  ),
                child: const MyApp(),
              )
            : RouteGenerator.createSplashScreen(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final RouteGenerator routeGenerator;

  @override
  void initState() {
    routeGenerator = RouteGenerator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) =>
          BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Quramiz delivery',
            themeMode: (state.isDarkMode) ? ThemeMode.dark : ThemeMode.light,
            theme: (state.isDarkMode)
                ? MyTheme.theme(
                    darkTheme: true,
                  )
                : MyTheme.theme(
                    darkTheme: false,
                  ),
            onGenerateRoute: routeGenerator.getRoutes,
            navigatorObservers: [routeGenerator.routeObserver],
            locale: context.locale,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            debugShowCheckedModeBanner: false,
            builder: EasyLoading.init(),
          );
        },
      ),
    );
  }
}
