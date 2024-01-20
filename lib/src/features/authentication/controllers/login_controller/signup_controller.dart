import 'package:ez_grader/src/features/authentication/models/users_model.dart';
import 'package:ez_grader/src/features/authentication/screens/forget_password/forget_password_otp/opt_screen.dart';
import 'package:ez_grader/src/repository/authentication_repository/authentication_repository.dart';
import 'package:ez_grader/src/repository/user_repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  final userRepo = Get.put(UserRepository());

  var checkRegisterEmail = true;
  var checkRegisterPhone = true;

  void registerUser(String email, String password) async {
    try {
      await AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
    } catch (e) {
      checkRegisterEmail = false;
      Get.back();
      print('Error during user registration: $e');
    }
  }

  static String formatPhoneNumber(String phoneNumber) {
    String numericPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

    if (numericPhoneNumber.startsWith('0')) {
      numericPhoneNumber = '+84${numericPhoneNumber.substring(1)}';
    }

    return numericPhoneNumber;
  }

  Future<void> createUser(UsersModel user) async {
    try {
      registerUser(user.email, user.password);
      if (checkRegisterEmail) {
        await userRepo.createUser(user);
      } else {
        return;
      }
    } catch (error) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
      print('Error during user creation: $error');
    }
  }

  void phoneAuthentication(String phoneNumber) {
    try {
      AuthenticationRepository.instance.phoneAuthentication(formatPhoneNumber(phoneNumber));
    } catch (e) {
      checkRegisterPhone = false;
      print('Error during user registration: $e');
    }
  }
}
