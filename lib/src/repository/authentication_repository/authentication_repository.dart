import 'package:ez_grader/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:ez_grader/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:ez_grader/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:ez_grader/src/repository/authentication_repository/exceptions/signin_email_password_failure.dart';
import 'package:ez_grader/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:ez_grader/src/repository/authentication_repository/show_snackbar/show_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository
    extends GetxController {
  static AuthenticationRepository get instance =>
      Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser
        .bindStream(_auth.authStateChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user != null
        ? {
            Get.offAll(() => SplashScreen()),
            ShowSnackBar.showSuccessSnackbar(
                "Welcome Back")
          }
        : Get.offAll(
            () => const OnBoardingScreen());
  }

  void phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credentials) async {
        await _auth
            .signInWithCredential(credentials);
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value =
            verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value =
            verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'Invalid-phone-number') {
          ShowSnackBar.showErrorSnackbar(
              'The provided phone number is not valid!');
        } else {
          ShowSnackBar.showErrorSnackbar(
              'Something went wrong. Try again');
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials =
        await _auth.signInWithCredential(
            PhoneAuthProvider.credential(
                verificationId:
                    verificationId.value,
                smsCode: otp));
    return credentials.user != null
        ? true
        : false;
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
      ShowSnackBar.showErrorSnackbar(ex.message);
      throw ex;
    } catch (_) {
      const ex =
          SignUpWithEmailAndPasswordFailure();
      ShowSnackBar.showErrorSnackbar(ex.message);
      throw ex;
    }
  }

  Future<void> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? {Get.offAll(() => SplashScreen())}
          : Get.offAll(() => WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex =
          SignInWithEmailAndPasswordFailure.code(
              e.code);
      ShowSnackBar.showErrorSnackbar(ex.message);
      throw ex;
    } catch (_) {
      const ex =
          SignInWithEmailAndPasswordFailure();
      ShowSnackBar.showErrorSnackbar(ex.message);
      throw ex;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    ShowSnackBar.showSuccessSnackbar(
        "Logout Success");
  }
}
