import 'package:ez_grader/src/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: tLightElevatedButtonColor,
      backgroundColor: tLightElevatedButtonColor,
      side: const BorderSide(color: tDarkColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: tDarkElevatedButtonColor,
      backgroundColor: tDarkElevatedButtonColor,
      side: const BorderSide(color: tWhiteColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
}
