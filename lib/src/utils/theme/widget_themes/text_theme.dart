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
    ),
    displayMedium: _montserratStyle.copyWith(
      color: Colors.black87,
    ),
    displaySmall: _rotoboStyle.copyWith(
    ),
    headlineLarge: _rotoboStyle.copyWith(
    ),
    headlineMedium: _poppinsStyle.copyWith(
    ),
    headlineSmall: _poppinsStyle.copyWith(
    ),
    bodyLarge: _dosisStyle.copyWith(
    ),
    bodyMedium: _dosisStyle.copyWith(
    ),
    bodySmall: _poppinsStyle.copyWith(
    ),
    titleLarge: _poppinsStyle.copyWith(
      color: Colors.black54,
    ),
    titleMedium: _montserratStyle.copyWith(
    ),
    titleSmall: _montserratStyle.copyWith(
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: _montserratStyle.copyWith(
    ),
    displayMedium: _montserratStyle.copyWith(
      color: Colors.white70,
    ),
    displaySmall: _rotoboStyle.copyWith(
    ),
    headlineLarge: _rotoboStyle.copyWith(
    ),
    headlineMedium: _poppinsStyle.copyWith(
    ),
    headlineSmall: _poppinsStyle.copyWith(
    ),
    bodyLarge: _dosisStyle.copyWith(
    ),
    bodyMedium: _dosisStyle.copyWith(
    ),
    bodySmall: _poppinsStyle.copyWith(
    ),
    titleLarge: _poppinsStyle.copyWith(
      color: Colors.white60,
    ),
    titleMedium: _montserratStyle.copyWith(
    ),
    titleSmall: _montserratStyle.copyWith(
    ),
  );
}
