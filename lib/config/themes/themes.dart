import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Poppins',
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    background: Color(0xFFf4ebe4),
    onBackground: Color(0xFF18212a),
    primary: Color(0xFF393e46),
    onPrimary: Color(0xFFf4ebe4),
    secondary: Color(0xFFE8E3E5),
    onSecondary: Color(0xFF18212a),
    tertiary: Color(0xFFbaaeab),
    onTertiary: Color(0xFF18212a),
    surface: Color(0xFFf4ebe4),
    onSurface: Color(0xFF18212a),
    error: Brightness.light == Brightness.light
        ? Color(0xffB3261E)
        : Color(0xffF2B8B5),
    onError: Brightness.light == Brightness.light
        ? Color(0xffFFFFFF)
        : Color(0xff601410),
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Poppins',
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    background: Color(0xFF33313b),
    onBackground: Color(0xFFe3c4a8),
    primary: Color(0xFFccbbae),
    onPrimary: Color(0xFF33313b),
    secondary: Color(0xFF3e3938),
    onSecondary: Color(0xFFe3c4a8),
    tertiary: Color(0xFFe2b287),
    onTertiary: Color(0xFF33313b),
    surface: Color(0xFF33313b),
    onSurface: Color(0xFFe3c4a8),
    error: Brightness.dark == Brightness.light
        ? Color(0xffB3261E)
        : Color(0xffF2B8B5),
    onError: Brightness.dark == Brightness.light
        ? Color(0xffFFFFFF)
        : Color(0xff601410),
  ),
);
