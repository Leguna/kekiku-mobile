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
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: AppTextStyles.bodySmall.copyWith(color: Colors.white),
      side: const BorderSide(
        color: Colors.white,
        width: 2.0,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
    ),
  ),
  scaffoldBackgroundColor: AppColors.primaryColorBackground,
  textTheme: TextTheme(
    bodySmall: AppTextStyles.bodySmall.copyWith(color: AppColors.paleSteelBlue),
    bodyMedium:
        AppTextStyles.bodyMedium.copyWith(color: AppColors.paleSteelBlue),
    bodyLarge: AppTextStyles.bodyLarge.copyWith(color: Colors.white),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
  dividerTheme: const DividerThemeData(
    color: Colors.white12,
    thickness: 6.0,
  ),
  listTileTheme: const ListTileThemeData(
    textColor: Colors.white,
    tileColor: AppColors.primaryColorBackground,
    iconColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
    minVerticalPadding: 0.0,
    minLeadingWidth: 0.0,
    horizontalTitleGap: 16.0,
    dense: true,
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
    size: 24.0,
  ),
  primaryIconTheme: const IconThemeData(
    color: Colors.white,
    size: 24.0,
  ),
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
