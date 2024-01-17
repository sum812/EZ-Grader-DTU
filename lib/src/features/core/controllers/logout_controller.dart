import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';

class LogOutController extends GetxController {
  static LogOutController get instance => Get.find();

  showLogoutConfirmationDialog(
      BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          title:
          Center(
            child: Text('Logout Confirmation', style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 24),),
          ),
          content: const Text('😒', textAlign: TextAlign.center, style: TextStyle(fontSize: 45),),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel', style: TextStyle(fontSize: 20),),
                ),
                TextButton(
                  onPressed: () {
                    AuthenticationRepository.instance
                        .logout();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Logout', style: TextStyle(fontSize: 20, color: Colors.redAccent),),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}