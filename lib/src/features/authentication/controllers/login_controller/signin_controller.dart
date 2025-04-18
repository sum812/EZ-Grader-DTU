import 'package:ez_grader/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  void loginUser (String email, password) {
    AuthenticationRepository.instance.signInWithEmailAndPassword(email, password);
  }
}
