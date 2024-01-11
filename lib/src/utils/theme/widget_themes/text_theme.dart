import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static final TextStyle _montserratStyle =
      GoogleFonts.montserrat();
  static final TextStyle _rotoboStyle =
      GoogleFonts.roboto();
  static final TextStyle _poppinsStyle =
      GoogleFonts.poppins();

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
    displaySmall: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
    labelLarge: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30),
    labelMedium: const TextStyle(
        color: Colors.black, fontSize: 14),
    labelSmall: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 27),
    headlineLarge: _rotoboStyle.copyWith(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: 27,
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
    bodyLarge: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 42,
    ),
    bodyMedium: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
    bodySmall: _poppinsStyle.copyWith(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    titleLarge: _poppinsStyle.copyWith(
      color: Colors.black87,
      fontSize: 17,
    ),
    titleMedium: _montserratStyle.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    titleSmall: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 12,
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
    displaySmall: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
    labelLarge: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30),
    labelMedium:const TextStyle (
        color: Colors.white, fontSize: 14),
    labelSmall: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 27),
    headlineLarge: _rotoboStyle.copyWith(
      color: Colors.grey[900],
      fontWeight: FontWeight.bold,
      fontSize: 27,
    ),
    headlineMedium: _poppinsStyle.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    headlineSmall: _poppinsStyle.copyWith(
      color: Colors.grey[400],
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    bodyLarge: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 42,
    ),
    bodyMedium: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 30,
    ),
    bodySmall: _poppinsStyle.copyWith(
      color: Colors.black54,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    titleLarge: _poppinsStyle.copyWith(
      color: Colors.grey[50],
      fontSize: 17,
    ),
    titleMedium: _montserratStyle.copyWith(
      color: Colors.black54,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    titleSmall: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    ),
  );
}
