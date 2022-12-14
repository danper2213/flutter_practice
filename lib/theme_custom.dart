import 'package:flutter/material.dart';

class ThemeCustom {
  ThemeCustom._();
  static const MaterialColor primarySwatch =
      MaterialColor(_colorPrimaryValue, <int, Color>{
    50: Color(0xFFE0E0ED),
    100: Color(0xFFB3B3D1),
    200: Color(0xFF8080B3),
    300: Color(0xFF4D4D94),
    400: Color(0xFF26267D),
    500: Color(_colorPrimaryValue),
    600: Color(0xFF00005E),
    700: Color(0xFF000053),
    800: Color(0xFF000049),
    900: Color(0xFF000038),
  });
  static const int _colorPrimaryValue = 0xFF000066;

  static ThemeData blueTheme = ThemeData(
      primarySwatch: primarySwatch,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: primarySwatch,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorCustom.marineBlue,
        foregroundColor: ColorCustom.whiteColor,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: primarySwatch,
      ),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: ColorCustom.whiteColor),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: ColorCustom.whiteColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: ThemeCustom.primarySwatch.shade300),
          ),
          labelStyle: const TextStyle(
            color: ColorCustom.whiteColor,
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(50, 50)),
        textStyle: MaterialStateProperty.all(TextStyleCustom.regular20()),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return ColorCustom.marineBlue.withOpacity(0.5);
          }
          return ColorCustom.marineBlue;
        }),
      )));
}

class ColorCustom {
  ColorCustom._();

  static const whiteColor = Colors.white;
  static const marineBlue = Color.fromRGBO(0, 162, 254, 1);
}

class TextStyleCustom {
  TextStyleCustom._();

  static TextStyle regular18({Color? color}) {
    return TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: color ?? ColorCustom.whiteColor,
    );
  }

  static TextStyle regular20({Color? color}) {
    return TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: color ?? ColorCustom.whiteColor,
    );
  }

  static TextStyle regular16({Color? color}) {
    return TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: color ?? ColorCustom.whiteColor,
    );
  }
}
