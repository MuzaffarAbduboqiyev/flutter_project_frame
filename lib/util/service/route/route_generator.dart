import 'package:flutter/material.dart';
import 'package:flutter_core/ui/dashboard/dashboard_screen.dart';
import 'package:flutter_core/ui/splash/splash_screen.dart';
import 'package:flutter_core/util/service/helper_service/translator.dart';
import 'package:flutter_core/util/service/route/routes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RouteGenerator {
  final RouteObserver<PageRoute> routeObserver;

  RouteGenerator() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case dashboardScreen:
        return _buildRoute(settings, const DashboardScreen());

      default:
        return _buildRoute(settings, errorRoute());
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget screen) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => screen,
    );
  }

  static createSplashScreen() => const MaterialApp(
        home: SplashScreen(),
      );

  Widget errorRoute() {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate("error.page.page_not_found")),
      ),
      body: Expanded(
        child: Center(
          child: SvgPicture.asset("assets/img/page_not_found.svg"),
        ),
      ),
    );
  }
}
