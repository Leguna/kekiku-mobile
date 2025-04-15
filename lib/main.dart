import 'package:dio/dio.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kekiku/core/themes.dart';
import 'package:kekiku/home/blocs/home_cubit.dart';
import 'package:kekiku/notification/blocs/notification_cubit.dart';
import 'package:kekiku/product/bloc/product_cubit.dart';
import 'package:kekiku/splash/onboarding_screen.dart';
import 'package:kekiku/transaction/blocs/transaction_cubit.dart';
import 'package:oktoast/oktoast.dart';

import 'app_setup.dart';
import 'auth/bloc/auth_cubit.dart';
import 'auth/data_sources/internet_connection_interceptor.dart';
import 'core/bloc/fallback_cubit.dart';
import 'core/index.dart';
import 'core/widgets/bottom_nav_bar/bloc/bottom_nav_bar_cubit.dart';
import 'favorite/bloc/favorite_cubit.dart';

Future<void> main() async {
  try {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await setupServices();
    await Future.delayed(const Duration(seconds: 1));

    final isFirstTime =
        await getIt<LocalDatabase>().getBool(firstTimeKey) ?? true;

    runApp(MyApp(isFirstTime: isFirstTime));
  } catch (e) {
    if (Flavors.currentFlavor == FlavorType.dev) {
      // ignore: avoid_print
      print('Error initializing services: $e');
    }
  }
  if (Flavors.currentFlavor == FlavorType.dev) {
    // ignore: avoid_print
    print('App started');
  }
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.isFirstTime = true});

  final bool isFirstTime;

  @override
  Widget build(BuildContext context) {
    Dimens.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavBarCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ProductCubit()),
        BlocProvider(create: (context) => FavoriteCubit()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => TransactionCubit()),
        BlocProvider(create: (context) => FallbackCubit()),
        BlocProvider(create: (context) => NotificationCubit()),
      ],
      child: OKToast(
        position: ToastPosition.bottom,
        dismissOtherOnShow: true,
        child: MaterialApp(
          navigatorKey: getIt<GlobalKey<NavigatorState>>(),
          title: Strings.appName,
          debugShowCheckedModeBanner: false,
          theme: mainTheme,
          home: const OnBoardingScreen(),
          routes: Routes.getRoutes(),
          onGenerateRoute: Routes.generateRoute,
          builder: (context, child) {
            final dio = getIt<Dio>();
            dio.interceptors.add(CheckInternetInterceptor(
              onLogout: (message, options) {
                final fallbackCubit = context.read<FallbackCubit>();
                final authCubit = context.read<AuthCubit>();
                authCubit.logout();
                fallbackCubit.logout();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.login,
                  (route) => route.settings.name == Routes.home,
                );
              },
            ));
            return BlocConsumer<FallbackCubit, FallbackState>(
              listener: (context, state) {
                switch (state) {
                  case FallbackError(:var message):
                    showToast(message);
                    break;
                  case MoveToLogin():
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.home,
                      (route) => false,
                    );
                    break;
                  default:
                    break;
                }
              },
              builder: (context, state) {
                return child ?? const SizedBox.shrink();
              },
            );
          },
          initialRoute: isFirstTime ? Routes.onBoarding : Routes.home,
        ),
      ),
    );
  }
}
