import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

InputDecorationTheme defaultInputTheme = const InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
    borderSide: BorderSide(color: Colors.white),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
    borderSide: BorderSide(color: Colors.white),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
    borderSide: BorderSide(color: Colors.white),
  ),
  floatingLabelBehavior: FloatingLabelBehavior.never,
);

class AppTextStyles {
  static TextStyle titleSplash = GoogleFonts.montserrat(
    fontSize: 32.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle normalBlack = GoogleFonts.montserrat(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static TextStyle normalWhite = GoogleFonts.montserrat(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle italicWhite = GoogleFonts.montserrat(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontStyle: FontStyle.italic,
  );

  static TextStyle montserrat = GoogleFonts.montserrat(
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle titleLogin = titleSplash.copyWith(
    fontSize: 34,
  );

  static TextStyle otpText = titleSplash.copyWith(
    fontSize: 18,
    color: Colors.black,
  );
  static TextStyle button = GoogleFonts.montserrat(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static TextStyle label = GoogleFonts.montserrat(
    fontSize: 26.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static TextStyle textField = GoogleFonts.montserrat(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle textFieldHint = textField.copyWith(
    color: Colors.white.withOpacity(0.5),
  );

  static var tooltip = textField.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static TextStyle chooseStudentNumberTitle = GoogleFonts.montserrat(
    fontSize: 42,
    letterSpacing: 1.5,
    height: 2,
    fontWeight: FontWeight.w700,
  );

  static TextStyle appBarTitle = GoogleFonts.montserrat(
    fontSize: 22,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w700,
  );

  static TextStyle titleHome = montserrat.copyWith(
    fontSize: 26.0,
    letterSpacing: 1.0,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColor,
  );

  static TextStyle subtitleHome = montserrat.copyWith(
    fontSize: 22.0,
    letterSpacing: 1.0,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColor,
  );
  static TextStyle contentHome = montserrat.copyWith(
    fontSize: 22,
    letterSpacing: 1,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w400,
  );

  static TextStyle dataFieldTitle = GoogleFonts.montserrat(
    fontSize: 18,
    color: AppColors.grey,
    fontWeight: FontWeight.w400,
  );

  static TextStyle dataFieldContent = GoogleFonts.montserrat(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleFeed = GoogleFonts.montserrat(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );
}
