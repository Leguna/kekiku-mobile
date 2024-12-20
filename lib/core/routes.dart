import 'package:flutter/material.dart';
import 'package:kekiku/product/product_detail_screen.dart';

import '../auth/create_profile_screen.dart';
import '../auth/login_screen.dart';
import '../auth/profile/edit_profile_screen.dart';
import '../auth/profile_detail_screen.dart';
import '../auth/register_screen.dart';
import '../auth/verify_code_screen.dart';
import '../hamburger_menu/menu_screen.dart';
import '../home/home_screen.dart';
import '../scanner/scanner_screen.dart';
import '../splash/onboarding_screen.dart';
import 'widgets/not_found_page.dart';

class Routes {
  static const String isEmail = 'isEmail';

  static const String onBoarding = '/onboarding';
  static const String home = '/home';
  static const String menu = '/menu';

  static const String login = '/login';
  static const String register = '/register';

  static const String settings = '/settings';
  static const String codeScanner = '/code-scanner';
  static const String help = '/help';
  static const String verifyCode = '/verify-code';
  static const String createProfile = '/create-profile';
  static const String termsAndConditions = '/terms-and-conditions';
  static const String editProfile = '/edit-profile';
  static const String profileDetail = '/profile-detail';
  static const String profile = '/profile';
  static const String aboutKekiku = '/about-kekiku';
  static const String notFound = '/not-found';
  static const String productDetail = '/product-detail';
  static const String search = '/search';

  static const String cart = '/cart';
  static const String checkout = '/checkout';

  static WidgetBuilder getRoute(String route) {
    return getRoutes()[route] ?? (context) => const NotFoundPage();
  }

  static Map<String, dynamic>? getRouteArgs(BuildContext context) {
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
      login: (context) => const LoginScreen(),
      register: (context) => const RegisterScreen(),
      verifyCode: (context) =>
          VerifyCodeScreen(isEmail: getRouteArgs(context)?['isEmail'] ?? false),
      createProfile: (context) => const CreateProfileScreen(),
      profile: (context) => const ProfileDetailScreen(),
      codeScanner: (context) => const ScannerScreen(),
      editProfile: (context) => const EditProfileScreen(),
      productDetail: (context) =>
          ProductDetailScreen(args: getRouteArgs(context)),
      notFound: (context) => const NotFoundPage(),
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
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
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
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
