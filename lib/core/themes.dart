import 'package:flutter/material.dart';
import 'package:kekiku/core/dimens.dart';

import 'colors.dart';
import 'typography.dart';

final mainTheme = ThemeData(
  cardTheme: const CardTheme(
    color: AppColors.primaryColorDark,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(Dimens.small)),
    ),
  ),
  fontFamily: 'Poppins',
  fontFamilyFallback: const ['Montserrat'],
  primaryColorDark: AppColors.darkBlueGray,
  appBarTheme: AppBarTheme(
    titleTextStyle: AppTextStyles.medium.copyWith(
      fontWeight: FontWeight.w600,
    ),
    backgroundColor: AppColors.midnightBlue,
    shadowColor: Colors.transparent,
    surfaceTintColor: AppColors.midnightBlue,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(AppColors.primaryColorLight),
      textStyle: WidgetStateProperty.all(
        AppTextStyles.medium.copyWith(
          color: AppColors.primaryColorLight,
        ),
      ),
    ),
  ),
  tabBarTheme: TabBarTheme(
    overlayColor: WidgetStateProperty.all(AppColors.primaryColorLight),
    labelColor: AppColors.primaryColorLight,
    unselectedLabelColor: Colors.grey,
    labelStyle: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.primaryColorBackground,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Dimens.small),
        topRight: Radius.circular(Dimens.small),
      ),
    ),
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
      textStyle: AppTextStyles.medium.copyWith(color: Colors.white),
      side: const BorderSide(
        color: Colors.white,
        width: 2.0,
      ),
    ),
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: AppColors.primaryColor,
    contentTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 14.0,
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
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    floatingLabelStyle: TextStyle(
      color: AppColors.paleSteelBlue,
      fontStyle: AppTextStyles.medium.fontStyle,
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
    disabledBorder: OutlineInputBorder(
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
      textStyle: WidgetStateProperty.all(
        AppTextStyles.medium.copyWith(),
      ),
    ),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: AppColors.primaryColorBackground,
    titleTextStyle: AppTextStyles.large,
    contentTextStyle:
        AppTextStyles.medium.copyWith(color: AppColors.paleSteelBlue),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(Dimens.tiny)),
    ),
    alignment: Alignment.center,
  ),
  scaffoldBackgroundColor: AppColors.primaryColorBackground,
  textTheme: TextTheme(
    bodySmall: AppTextStyles.small.copyWith(color: Colors.white),
    bodyMedium: AppTextStyles.medium.copyWith(color: Colors.white),
    bodyLarge: AppTextStyles.medium.copyWith(color: Colors.white),
    titleSmall: AppTextStyles.small.copyWith(color: Colors.white),
    titleMedium: AppTextStyles.medium.copyWith(color: Colors.white),
    titleLarge: AppTextStyles.xlarge.copyWith(color: Colors.white),
    labelSmall: AppTextStyles.small.copyWith(color: AppColors.paleSteelBlue),
    labelMedium: AppTextStyles.medium.copyWith(color: AppColors.paleSteelBlue),
    labelLarge: AppTextStyles.medium.copyWith(color: AppColors.paleSteelBlue),
    displaySmall:
        AppTextStyles.small.copyWith(color: AppColors.primaryColorLight),
    displayMedium:
        AppTextStyles.medium.copyWith(color: AppColors.primaryColorLight),
    displayLarge:
        AppTextStyles.medium.copyWith(color: AppColors.primaryColorLight),
    headlineSmall: AppTextStyles.small.copyWith(color: Colors.white),
    headlineMedium: AppTextStyles.medium.copyWith(color: Colors.white),
    headlineLarge: AppTextStyles.medium.copyWith(color: Colors.white),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColor,
  ),
  dividerTheme: const DividerThemeData(
    color: Colors.white12,
    thickness: 6.0,
  ),
  listTileTheme: const ListTileThemeData(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 14.0,
    ),
    subtitleTextStyle: TextStyle(
      color: Colors.white60,
      fontSize: 10.0,
    ),
    tileColor: AppColors.primaryColorBackground,
    iconColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(horizontal: Dimens.small),
    minVerticalPadding: 0.0,
    minLeadingWidth: 0.0,
    horizontalTitleGap: 16.0,
    dense: true,
  ),
  disabledColor: Colors.grey,
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
