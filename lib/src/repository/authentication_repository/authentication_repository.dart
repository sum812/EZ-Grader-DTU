import 'package:ez_grader/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:ez_grader/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:ez_grader/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:ez_grader/src/repository/authentication_repository/exceptions/signin_email_password_failure.dart';
import 'package:ez_grader/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationRepository
    extends GetxController {
  static AuthenticationRepository get instance =>
      Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.authStateChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user != null
        ? Get.offAll(() => SplashScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  void _showErrorSnackbar(String errorMessage) {
    Get.snackbar(
      'Error',
      errorMessage,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 4),
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => SplashScreen())
          : Get.offAll(() => WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex =
          SignUpWithEmailAndPasswordFailure.code(
              e.code);
      _showErrorSnackbar(ex.message);
      throw ex;
    } catch (_) {
      const ex =
          SignUpWithEmailAndPasswordFailure();
      _showErrorSnackbar(ex.message);
      throw ex;
    }
  }

  Future<void> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => SplashScreen())
          : Get.offAll(() => WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex =
          SignInWithEmailAndPasswordFailure.code(
              e.code);
      _showErrorSnackbar(ex.message);
      throw ex;
    } catch (_) {
      const ex =
          SignInWithEmailAndPasswordFailure();
      _showErrorSnackbar(ex.message);
      throw ex;
    }
  }

  Future<void> logout() async =>
      await _auth.signOut();
}
