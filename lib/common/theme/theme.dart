import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData.from(
      colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF000000),
    onPrimary: Color(0xFBD8181),
    secondary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFB2B2B2),
    error: Color(0xFFFF0000),
    onError: Color(0xFF000000),
    surface: Color(0x80989898),
    onSurface: Color(0xFF333333),
    tertiary: Color(0xff0068ff),
  ));
}

ThemeData darkTheme() {
  return ThemeData.from(
      colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFFFFFF),
    onPrimary: Color(0xFBD8181),
    secondary: Color(0xFF000000),
    onSecondary: Color(0xFFB2B2B2),
    error: Color(0xFFFF0000),
    onError: Color(0xFF000000),
    surface: Color(0x80989898),
    onSurface: Color(0xFFBEBEBE),
    tertiary: Color(0xff0068ff),
  ));
}
