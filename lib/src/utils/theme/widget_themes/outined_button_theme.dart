import 'package:ez_grader/src/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: Colors.black,
      side: const BorderSide(color: Colors.black),
      backgroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(
          vertical: tButtonHeight),
    ),
  );

  static final darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: Colors.white,
      side: const BorderSide(color: Colors.white),
      backgroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(
          vertical: tButtonHeight),
    ),
  );
}
