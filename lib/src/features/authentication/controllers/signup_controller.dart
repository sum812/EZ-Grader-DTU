import 'package:ez_grader/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  void registerUser (String email, password) {
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }
}
