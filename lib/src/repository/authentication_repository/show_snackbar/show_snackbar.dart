import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowSnackBar {
  static void showErrorSnackbar(
      String errorMessage) {
    Get.snackbar(
      'Error',
      errorMessage,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red.withOpacity(.1),
      colorText: Colors.red,
    );
  }

  static void showSuccessSnackbar(
      String successMessage) {
    Get.snackbar(
      'Success',
      successMessage,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.green.withOpacity(.2),
      colorText: Colors.green,
    );
  }
}
