import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';

abstract class MyTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorsManeger.white,
    textTheme: TextTheme(
      labelMedium: GoogleFonts.poppins(
        color: ColorsManeger.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.poppins(
        color: ColorsManeger.red,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),

    ),
  );
  static ThemeData dark = ThemeData();
}
