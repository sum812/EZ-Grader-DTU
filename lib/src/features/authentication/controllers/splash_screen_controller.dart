import 'package:ez_grader/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(
        const Duration(milliseconds: 2000));
      animate.value = true;
    await Future.delayed(
        const Duration(milliseconds: 1500));
    Get.to(OnBoardingScreen());
  }
}