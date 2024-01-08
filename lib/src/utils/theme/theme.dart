import 'package:ez_grader/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:ez_grader/src/utils/theme/widget_themes/outined_button_theme.dart';
import 'package:ez_grader/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:ez_grader/src/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(),
    primarySwatch: Colors.pink,
    textTheme: TTextTheme.lightTextTheme,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(),
    primarySwatch: Colors.yellow,
    textTheme: TTextTheme.darkTextTheme,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
