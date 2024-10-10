import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kekiku/core/themes.dart';
import 'package:kekiku/splash/onboarding_screen.dart';

import 'app_setup.dart';
import 'core/index.dart';
import 'core/widgets/bottom_nav_bar/bloc/bottom_nav_bar_cubit.dart';
import 'home/home_screen.dart';

Future<void> main() async {
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
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.isFirstTime = true});

  final bool isFirstTime;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavBarCubit()),
      ],
      child: MaterialApp(
        title: Strings.appName,
        routes: Routes.getRoutes(),
        debugShowCheckedModeBanner: dotenv.env['DEBUG'] == 'true',
        theme: mainTheme,
        home: const OnBoardingScreen(),
        initialRoute: isFirstTime ? Routes.onBoarding : Routes.home,
      ),
    );
  }
}
