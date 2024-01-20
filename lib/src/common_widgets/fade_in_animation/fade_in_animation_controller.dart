import 'package:ez_grader/src/features/core/screens/home/home.dart';
import 'package:get/get.dart';

class FadeInAnimationController
    extends GetxController {
  static FadeInAnimationController get find =>
      Get.find();

  RxBool animate = false.obs;

  Future startHome() async {
    await Future.delayed(
        const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(
        const Duration(milliseconds: 2000));
    animate.value = false;
    await Future.delayed(
        const Duration(milliseconds: 2000));
    Get.offAll(HomeScreen(), transition: Transition.rightToLeftWithFade);
  }
}
