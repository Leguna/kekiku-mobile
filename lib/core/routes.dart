import 'package:flutter/material.dart';

import '../hamburger_menu/menu_screen.dart';
import '../home/home_screen.dart';
import '../splash/onboarding_screen.dart';
import 'widgets/not_found_page.dart';

class Routes {
  static const String onBoarding = '/onboarding';
  static const String home = '/home';
  static const String menu = '/menu';

  static WidgetBuilder getRoute(String route) {
    return getRoutes()[route] ?? (context) => const NotFoundPage();
  }

  Map<String, dynamic>? getRouteArgs(BuildContext context) {
    try {
      return ModalRoute.of(context)?.settings.arguments
          as Map<String, dynamic>?;
    } catch (e) {
      return null;
    }
  }

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      onBoarding: (context) => const OnBoardingScreen(),
      home: (context) => const HomeScreen(),
      menu: (context) => const MenuScreen(),
    };
  }

  // Animation
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case menu:
        return MaterialPageRoute(builder: (_) => const MenuScreen());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
