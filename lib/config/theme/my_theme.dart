import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';

abstract class MyTheme {
  static ThemeData light = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: ColorsManeger.white,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.transparent)
      )
    ),
    inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorsManeger.redWithOpacity5,
              width: 2
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorsManeger.red,
              width: 2
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorsManeger.redWithOpacity5,
              width: 2
          ),
          borderRadius: BorderRadius.circular(16),
        ),
    ),
    textTheme: TextTheme(
      //button text  style
      labelMedium: GoogleFonts.poppins(
        color: ColorsManeger.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: GoogleFonts.poppins(
        color: ColorsManeger.red,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      //title large  black 24
      titleLarge: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: ColorsManeger.black
      ),
        titleSmall: GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: ColorsManeger.gray
    ),

    ),
  );
  static ThemeData dark = ThemeData();
}
