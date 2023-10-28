import 'package:flutter/material.dart';
import 'package:justplay/app/theme/jp_colors.dart';

abstract class JpTheme {
  static ThemeData light = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: JpColors.black),
    useMaterial3: true,
  );
}
