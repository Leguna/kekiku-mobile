import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kekiku/core/colors.dart';
import 'package:kekiku/splash/onboarding_screen.dart';

import 'app_setup.dart';
import 'core/strings.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await setupServices();
  await Future.delayed(const Duration(seconds: 1));

  if (dotenv.env['PREVIEW'] == 'true') {
    runApp(DevicePreview(builder: (_) => const MyApp()));
  } else {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      title: Strings.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: const OnBoardingScreen(),
    );
  }
}
