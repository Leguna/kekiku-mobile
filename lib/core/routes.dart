import 'package:flutter/material.dart';
import 'package:kekiku/home/home_screen.dart';
import 'package:kekiku/splash/onboarding_screen.dart';

class Routes {
  static const String onBoarding = '/onboarding';
  static const String home = '/home';


  static WidgetBuilder getRoute(String route) {
    return getRoutes()[route] ?? (context) => const SizedBox();
  }

  Map<String, dynamic>? getRouteArgs(BuildContext context) {
    try {
      return ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    } catch (e) {
      return null;
    }
  }

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      onBoarding: (context) => const OnBoardingScreen(),
      home: (context) => const HomeScreen(),
    };
  }
}
