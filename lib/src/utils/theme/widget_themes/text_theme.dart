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
      color: Colors.red,
      fontWeight: FontWeight.bold,
      fontSize: 42,
    ),
    displayMedium: _montserratStyle.copyWith(
      color: Colors.redAccent,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
    displaySmall: _rotoboStyle.copyWith(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    headlineLarge: _rotoboStyle.copyWith(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
    headlineMedium: _poppinsStyle.copyWith(),
    headlineSmall: _poppinsStyle.copyWith(),
    bodyLarge: _dosisStyle.copyWith(),
    bodyMedium: _dosisStyle.copyWith(),
    bodySmall: _poppinsStyle.copyWith(),
    titleLarge: _poppinsStyle.copyWith(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    titleMedium: _montserratStyle.copyWith(
      color: Colors.black54,
      fontSize: 18,
    ),
    titleSmall: _montserratStyle.copyWith(),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: _montserratStyle.copyWith(
      color: Colors.red,
      fontWeight: FontWeight.bold,
      fontSize: 42,
    ),
    displayMedium: _montserratStyle.copyWith(
      color: Colors.white70,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
    displaySmall: _rotoboStyle.copyWith(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    headlineLarge: _rotoboStyle.copyWith(
      color: Colors.grey[900],
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
    headlineMedium: _poppinsStyle.copyWith(),
    headlineSmall: _poppinsStyle.copyWith(),
    bodyLarge: _dosisStyle.copyWith(),
    bodyMedium: _dosisStyle.copyWith(),
    bodySmall: _poppinsStyle.copyWith(),
    titleLarge: _poppinsStyle.copyWith(
      color: Colors.grey[50],
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    titleMedium: _montserratStyle.copyWith(
      color: Colors.black54,
      fontSize: 18,
    ),
    titleSmall: _montserratStyle.copyWith(),
  );
}
