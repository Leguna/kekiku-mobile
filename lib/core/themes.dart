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
  dividerColor: AppColors.primaryColorDark,
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      iconColor: WidgetStateProperty.all(Colors.white),
      iconSize: WidgetStateProperty.all(20.0),
      padding: WidgetStateProperty.all(const EdgeInsets.all(0.0)),
    ),
  ),
  useMaterial3: true,
);
