import 'package:flutter/material.dart';

import 'colors.dart';
import 'typography.dart';

final mainTheme = ThemeData(
  fontFamily: 'Poppins',
  fontFamilyFallback: const ['Montserrat'],
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.midnightBlue,
    foregroundColor: Colors.white,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.primaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(),
  ),
  scaffoldBackgroundColor: AppColors.primaryColorBackground,
  textTheme: TextTheme(
    bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.paleSteelBlue),
    bodyMedium:AppTextStyles.bodyMedium.copyWith(color: AppColors.paleSteelBlue),
    bodyLarge: AppTextStyles.bodyLarge.copyWith(color: Colors.white),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateProperty.all(Colors.white),
    ),
  ),
  useMaterial3: true,
);
