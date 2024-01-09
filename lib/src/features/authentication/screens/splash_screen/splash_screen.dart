import 'package:ez_grader/src/constants/colors.dart';
import 'package:ez_grader/src/constants/image_string.dart';
import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/authentication/controllers/click_to_exit_controller.dart';
import 'package:ez_grader/src/features/authentication/controllers/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController =
      Get.put(SplashScreenController());
  final ClickToExit clickToExit = ClickToExit();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    splashController.startAnimation();

    return Scaffold(
        body: SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return clickToExit.onWillPop(context);
        },
        child: Stack(
          children: [
            Obx(
              () => AnimatedPositioned(
                  duration: const Duration(
                      milliseconds: 1500),
                  top: splashController
                          .animate.value
                      ? 0
                      : -200,
                  right: splashController
                          .animate.value
                      ? 0
                      : -100,
                  child: const Image(
                    image: AssetImage(
                        tSplashTopRight),
                  )),
            ),
            Obx(
              () => AnimatedPositioned(
                  duration: const Duration(
                      milliseconds: 1500),
                  top: 80,
                  left: splashController
                          .animate.value
                      ? tDefaultSize
                      : 0,
                  child: AnimatedOpacity(
                    duration: const Duration(
                        milliseconds: 1500),
                    opacity: splashController
                            .animate.value
                        ? 1
                        : 0,
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [
                        Text(
                          tAppName,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge,
                        ),
                        Text(
                          tAppTag,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge,
                        )
                      ],
                    ),
                  )),
            ),
            Obx(
              () => AnimatedPositioned(
                  duration: const Duration(
                      milliseconds: 1500),
                  bottom: splashController
                          .animate.value
                      ? 200
                      : 0,
                  child: AnimatedOpacity(
                    duration: const Duration(
                        milliseconds: 1500),
                    opacity: splashController
                            .animate.value
                        ? 1
                        : 0,
                    child: Image(
                      image: const AssetImage(
                          tSplashScreen),
                      height: size.height / 2.2,
                    ),
                  )),
            ),
            Obx(
              () => AnimatedPositioned(
                  duration: const Duration(
                      milliseconds: 1500),
                  bottom: 40,
                  right: splashController
                          .animate.value
                      ? tDefaultSize
                      : -80,
                  child: Container(
                    width: tSplashContainerSize,
                    height: tSplashContainerSize,
                    decoration: BoxDecoration(
                      color:
                          tSplashContainerColor,
                      borderRadius:
                          BorderRadius.circular(
                              100),
                    ),
                  )),
            ),
            Obx(
              () => AnimatedPositioned(
                  duration: const Duration(
                      milliseconds: 1500),
                  bottom: 60,
                  left: splashController
                          .animate.value
                      ? tDefaultSize - 10
                      : -80,
                  child: Container(
                    width: tSplashContainerSize,
                    height: tSplashContainerSize,
                    decoration: BoxDecoration(
                      color:
                          tSplashContainerColor,
                      borderRadius:
                          BorderRadius.circular(
                              100),
                    ),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
