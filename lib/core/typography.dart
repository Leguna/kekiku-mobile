import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  static const bodyLarge = TextStyle(
    fontSize: 18.0,
  );
  static const bodyMedium = TextStyle(
    fontSize: 16.0,
  );

  static const bodySmall = TextStyle(
    fontSize: 14.0,
  );

  static TextStyle title = GoogleFonts.poppins(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle poppins = GoogleFonts.poppins(
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
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

  static TextStyle titleHome = poppins.copyWith(
    fontSize: 26.0,
    letterSpacing: 1.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static var small = poppins.copyWith(
    fontSize: 14.0,
    color: Colors.white,
  );

  static var medium = poppins.copyWith(
    fontSize: 16.0,
    color: Colors.white,
  );

  static var appBarTitle = poppins.copyWith(
    fontSize: 20.0,
    color: Colors.white,
  );
}