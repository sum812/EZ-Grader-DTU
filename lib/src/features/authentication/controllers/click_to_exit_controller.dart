import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClickToExit {
  int backPressCount = 0;
  Timer? backPressTimer;

  Future<bool> onWillPop(BuildContext context) async {
    if (backPressCount == 0) {
      backPressCount++;
      backPressTimer = Timer(const Duration(seconds: 3), () {
        backPressCount = 0;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Click again to exit'),
      ));
      return false;
    } else if (backPressCount == 1) {
      backPressTimer?.cancel();
      SystemNavigator.pop();
    }
    return false;
  }
}