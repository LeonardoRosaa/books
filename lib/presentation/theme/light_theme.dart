import 'package:books/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

const color = {
  50: Color.fromRGBO(91, 94, 166, .1),
  100: Color.fromRGBO(91, 94, 166, .2),
  200: Color.fromRGBO(91, 94, 166, .3),
  300: Color.fromRGBO(91, 94, 166, .4),
  400: Color.fromRGBO(91, 94, 166, .5),
  500: Color.fromRGBO(91, 94, 166, .6),
  600: Color.fromRGBO(91, 94, 166, .7),
  700: Color.fromRGBO(91, 94, 166, .8),
  800: Color.fromRGBO(91, 94, 166, .9),
  900: Color.fromRGBO(91, 94, 166, 1),
};

const colorCustom = MaterialColor(0xFF5B5EA6, color);

final lightTheme = ThemeData(
  fontFamily: FontFamily.rubik,
  primarySwatch: colorCustom,
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ),
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    primary: Color(0xFF5B5EA6),
    secondary: Color(0xFF263D36),
    tertiary: Color(0xFFE1EBE8),
    outline: Color(0xFF181A19),
  ),
);
