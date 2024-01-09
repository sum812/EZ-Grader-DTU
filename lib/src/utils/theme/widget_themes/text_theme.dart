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
    displayLarge: const TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
      fontSize: 42,
    ),
    displayMedium: const TextStyle(
      color: Colors.redAccent,
      fontWeight: FontWeight.bold,
      fontSize: 36,
    ),
    displaySmall: _montserratStyle.copyWith(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
    headlineLarge: _rotoboStyle.copyWith(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
    headlineMedium: _poppinsStyle.copyWith(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    headlineSmall: _poppinsStyle.copyWith(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
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
    titleSmall: const TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: const TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
      fontSize: 42,
    ),
    displayMedium: const TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
      fontSize: 36,
    ),
    displaySmall: _montserratStyle.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
    headlineLarge: _rotoboStyle.copyWith(
      color: Colors.grey[400],
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
    headlineMedium: _poppinsStyle.copyWith(
      color: Colors.grey[400],
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    headlineSmall: _poppinsStyle.copyWith(
      color: Colors.grey[400],
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
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
    titleSmall: const TextStyle(
      color: Colors.white70,
      fontSize: 16,
    ),
  );
}
