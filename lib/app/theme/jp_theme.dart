import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justplay/app/theme/jp_colors.dart';

abstract class JpTheme {
  static ThemeData light = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: JpColors.black),
    useMaterial3: true,
    textTheme: GoogleFonts.robotoTextTheme(ThemeData.light().textTheme),
    inputDecorationTheme: InputDecorationTheme(
      border: inputBorder(),
      enabledBorder: inputBorder(),
      disabledBorder: inputBorder(
        borderColor: JpColors.blackLight,
      ),
      errorBorder: inputBorder(
        borderColor: JpColors.red,
      ),
      focusedBorder: inputBorder(),
      labelStyle: TextStyle(color: JpColors.black),
      contentPadding: EdgeInsets.zero,
    ),
  );

  static InputBorder inputBorder({Color? borderColor}) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: borderColor ?? JpColors.black,
      ),
    );
  }
}
