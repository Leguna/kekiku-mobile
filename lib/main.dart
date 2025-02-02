import 'package:device_preview/device_preview.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kekiku/auth/bloc/profile_cubit.dart';
import 'package:kekiku/core/themes.dart';
import 'package:kekiku/home/blocs/home_cubit.dart';
import 'package:kekiku/notification/blocs/notification_cubit.dart';
import 'package:kekiku/product/bloc/product_cubit.dart';
import 'package:kekiku/splash/onboarding_screen.dart';
import 'package:kekiku/transaction/blocs/transaction_cubit.dart';
import 'package:oktoast/oktoast.dart';

import 'app_setup.dart';
import 'auth/bloc/auth_cubit.dart';
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

    if (dotenv.env['PREVIEW'] == 'true') {
      runApp(DevicePreview(builder: (_) => MyApp(isFirstTime: isFirstTime)));
    } else {
      runApp(MyApp(isFirstTime: isFirstTime));
    }
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
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => ProductCubit()),
        BlocProvider(create: (context) => FavoriteCubit()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => TransactionCubit()),
        BlocProvider(create: (context) => NotificationCubit()),
      ],
      child: OKToast(
        position: ToastPosition.bottom,
        dismissOtherOnShow: true,
        child: MaterialApp(
          title: Strings.appName,
          debugShowCheckedModeBanner: dotenv.env['DEBUG'] == 'true',
          theme: mainTheme,
          home: const OnBoardingScreen(),
          routes: Routes.getRoutes(),
          onGenerateRoute: Routes.generateRoute,
          initialRoute: isFirstTime ? Routes.onBoarding : Routes.home,
        ),
      ),
    );
  }
}
