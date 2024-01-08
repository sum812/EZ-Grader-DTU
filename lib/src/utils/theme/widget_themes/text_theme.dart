import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static final TextStyle _montserratStyle =
      GoogleFonts.montserrat();
  static final TextStyle _rotoboStyle =
      GoogleFonts.roboto();
  static final TextStyle _poppinsStyle =
      GoogleFonts.poppins();
  static final TextStyle _dosisStyle =
      GoogleFonts.dosis();

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: _montserratStyle.copyWith(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: _montserratStyle.copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: _rotoboStyle.copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: _rotoboStyle.copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: _poppinsStyle.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: _poppinsStyle.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: _dosisStyle.copyWith(
      fontSize: 16.0,
    ),
    bodyMedium: _dosisStyle.copyWith(
      fontSize: 14.0,
    ),
    bodySmall: _poppinsStyle.copyWith(
      fontSize: 12.0,
    ),
    titleLarge: _poppinsStyle.copyWith(
      fontSize: 16.0,
    ),
    titleMedium: _montserratStyle.copyWith(
      fontSize: 14.0,
    ),
    titleSmall: _montserratStyle.copyWith(
      fontSize: 12.0,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: _montserratStyle.copyWith(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: _montserratStyle.copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: _rotoboStyle.copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: _rotoboStyle.copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: _poppinsStyle.copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: _poppinsStyle.copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: _dosisStyle.copyWith(
      fontSize: 16.0,
    ),
    bodyMedium: _dosisStyle.copyWith(
      fontSize: 14.0,
    ),
    bodySmall: _poppinsStyle.copyWith(
      fontSize: 12.0,
    ),
    titleLarge: _poppinsStyle.copyWith(
      fontSize: 16.0,
    ),
    titleMedium: _montserratStyle.copyWith(
      fontSize: 14.0,
    ),
    titleSmall: _montserratStyle.copyWith(
      fontSize: 12.0,
    ),
  );
}
