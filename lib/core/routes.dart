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
      return ModalRoute
          .of(context)
          ?.settings
          .arguments
      as Map<String, dynamic>?;
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

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case menu:
        return slideToTop(const MenuScreen());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }

  static Route<dynamic> slideToRight(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  static Route<dynamic> slideToTop(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

}
