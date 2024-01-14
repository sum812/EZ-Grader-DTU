import 'package:ez_grader/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  String formatPhoneNumber(String phoneNumber) {
    String numericPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

    if (numericPhoneNumber.startsWith('0')) {
      numericPhoneNumber = '+84${numericPhoneNumber.substring(1)}';
    }

    return numericPhoneNumber;
  }


  void registerUser (String email, password) {
    String? error = AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  void phoneAuthentication(String phoneNumber) {
    AuthenticationRepository.instance.phoneAuthentication(formatPhoneNumber(phoneNumber));
  }
}
