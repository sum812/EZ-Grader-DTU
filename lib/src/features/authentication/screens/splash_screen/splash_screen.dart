import 'package:ez_grader/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:ez_grader/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:ez_grader/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:ez_grader/src/constants/colors.dart';
import 'package:ez_grader/src/constants/image_string.dart';
import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/authentication/controllers/click_to_exit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final ClickToExit clickToExit = ClickToExit();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final controller =
        Get.put(FadeInAnimationController());
    controller.startWelcome();

    return Scaffold(
        body: SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return clickToExit.onWillPop(context);
        },
        child: Stack(
          children: [
            TFadeInAnimation(
              durationInMs: 1500,
              animate: TAnimatePosition(
                  topAfter: 0,
                  topBefore: -200,
                  rightAfter: 0,
                  rightBefore: -200),
              child: const Image(
                  image: AssetImage(
                      tSplashTopRight)),
            ),
            TFadeInAnimation(
              durationInMs: 1500,
              animate: TAnimatePosition(
                topAfter: 80,
                topBefore: 0,
                leftAfter: tDefaultSize,
                leftBefore: 0,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    tAppName,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    tAppTag,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium,
                  )
                ],
              ),
            ),
            TFadeInAnimation(
              durationInMs: 1500,
              animate: TAnimatePosition(
                  bottomAfter: 200,
                  bottomBefore: 0),
              child: Image(
                image: const AssetImage(
                    tSplashScreen),
                height: size.height / 2.2,
              ),
            ),
            TFadeInAnimation(
                durationInMs: 1500,
                animate: TAnimatePosition(
                  bottomAfter: 40,
                  bottomBefore: 0,
                  rightAfter: tDefaultSize,
                  rightBefore: -80,
                ),
                child: Container(
                  width: tSplashContainerSize,
                  height: tSplashContainerSize,
                  decoration: BoxDecoration(
                    color: tSplashContainerColor,
                    borderRadius:
                        BorderRadius.circular(
                            100),
                  ),
                )),
            TFadeInAnimation(
                durationInMs: 1500,
                animate: TAnimatePosition(
                  bottomAfter: 60,
                  bottomBefore: 0,
                  leftAfter: tDefaultSize - 10,
                  leftBefore: -80,
                ),
                child: Container(
                  width: tSplashContainerSize,
                  height: tSplashContainerSize,
                  decoration: BoxDecoration(
                    color: tSplashContainerColor,
                    borderRadius:
                        BorderRadius.circular(
                            100),
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}
