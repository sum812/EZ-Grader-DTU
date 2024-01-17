import 'package:ez_grader/src/constants/colors.dart';
import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/features/authentication/controllers/click_to_exit_controller.dart';
import 'package:ez_grader/src/features/authentication/controllers/on_boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obController = OnBoardingController();
    final ClickToExit clickToExit = ClickToExit();

    return Scaffold(
        body: SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return clickToExit.onWillPop(context);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            LiquidSwipe(
              pages: obController.pages,
              liquidController: obController.controller,
              onPageChangeCallback: obController.onPageChangedCallback,
              slideIconWidget: const Icon(Icons.arrow_back_ios),
              enableSideReveal: true,
            ),
            Positioned(
                bottom: tDefaultSize,
                right: tDefaultSize,
                child: OutlinedButton(
                  onPressed: () => obController.animateToNextSlide(context),
                  style: ElevatedButton.styleFrom(foregroundColor: Colors.white, side: const BorderSide(color: Colors.black26), shape: const CircleBorder(), padding: const EdgeInsets.all(tDefaultSize / 2)),
                  child: Container(
                    padding: const EdgeInsets.all(tDefaultSize / 2),
                    decoration: const BoxDecoration(
                      color: tDarkColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                )),
            Positioned(
                top: tDefaultSize / 2,
                right: tDefaultSize / 2,
                child: TextButton(
                  onPressed: () => obController.skip(context),
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                )),
            Obx(
              () => Positioned(
                  bottom: tDefaultSize * 2,
                  left: tDefaultSize,
                  child: AnimatedSmoothIndicator(
                    activeIndex: obController.currentPage.value,
                    count: 3,
                    effect: const WormEffect(
                      activeDotColor: Colors.blueAccent,
                      dotHeight: 5.0,
                    ),
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
