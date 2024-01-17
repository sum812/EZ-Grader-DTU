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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Click again to exit',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 16, color: Colors.white),
        ),
      ));
      return false;
    } else if (backPressCount == 1) {
      backPressTimer?.cancel();
      SystemNavigator.pop();
    }
    return false;
  }
}
