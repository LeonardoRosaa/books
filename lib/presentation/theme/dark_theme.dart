import 'package:books/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

const _primary = {
  50: Color.fromRGBO(130, 87, 229, .1),
  100: Color.fromRGBO(130, 87, 229, .2),
  200: Color.fromRGBO(130, 87, 229, .3),
  300: Color.fromRGBO(130, 87, 229, .4),
  400: Color.fromRGBO(130, 87, 229, .5),
  500: Color.fromRGBO(130, 87, 229, .6),
  600: Color.fromRGBO(130, 87, 229, .7),
  700: Color.fromRGBO(130, 87, 229, .8),
  800: Color.fromRGBO(130, 87, 229, .9),
  900: Color.fromRGBO(130, 87, 229, 1),
};

const _primarySwatch = MaterialColor(0xFF8257E5, _primary);

final darkTheme = ThemeData(
  fontFamily: FontFamily.rubik,
  primarySwatch: _primarySwatch,
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ),
  colorScheme: const ColorScheme.light(
    background: Color(0xFF121214),
    primary: Color(0xFF8257E5),
    secondary: Color(0xFFa8a8b3),
    tertiary: Color(0xFF5B5EA6),
    outline: Color(0xFFFFFFFF),
    outlineVariant: Color(0xFF9AABA6),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color.fromARGB(255, 60, 58, 58),
  ),
);
