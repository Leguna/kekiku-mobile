import 'package:flutter/material.dart';
import 'package:kekiku/core/dimens.dart';

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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      textStyle: AppTextStyles.bodySmall.copyWith(color: Colors.white),
      side: const BorderSide(
        color: Colors.white,
        width: 2.0,
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    suffixIconColor: Colors.white,
    hintStyle: const TextStyle(fontSize: 0),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: Dimens.small,
      vertical: Dimens.small,
    ),
    helperStyle: AppTextStyles.micro.copyWith(
      color: AppColors.paleSteelBlue,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    floatingLabelStyle: TextStyle(
      color: AppColors.paleSteelBlue,
      fontStyle: AppTextStyles.bodySmall.fontStyle,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: AppColors.paleSteelBlue, width: 2.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    labelStyle: const TextStyle(
      color: AppColors.paleSteelBlue,
      fontSize: 12.0,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      disabledBackgroundColor: Colors.grey,
    ).copyWith(
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
  ),
  dialogTheme:  DialogTheme(
    backgroundColor: AppColors.primaryColorBackground,
    titleTextStyle: AppTextStyles.bodyLarge,
    contentTextStyle: AppTextStyles.small.copyWith(color: AppColors.paleSteelBlue),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(Dimens.tiny)),
    ),
    alignment: Alignment.center,
  ),
  scaffoldBackgroundColor: AppColors.primaryColorBackground,
  textTheme: TextTheme(
    bodySmall: AppTextStyles.bodySmall.copyWith(color: Colors.white),
    bodyMedium: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
    bodyLarge: AppTextStyles.medium.copyWith(color: Colors.white),
    labelSmall: AppTextStyles.small.copyWith(color: AppColors.paleSteelBlue),
    displaySmall: AppTextStyles.small.copyWith(color: AppColors.paleSteelBlue),
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
    contentPadding: EdgeInsets.symmetric(horizontal: Dimens.small),
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
