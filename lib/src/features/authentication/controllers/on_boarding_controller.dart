import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_string.dart';
import '../models/model_on_boarding.dart';
import '../screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
        model: OnBoardingModel(
          image: tOnBoarding1,
          title: "$tOnBoardingTitle1\n",
          subTitle: tOnBoardingSubTitle1,
          counterText: tOnBoardingCounter1,
          bgColor: tOnBoardingPage1Color,
        )),
    OnBoardingPageWidget(
        model: OnBoardingModel(
          image: tOnBoarding2,
          title: "$tOnBoardingTitle2\n",
          subTitle: tOnBoardingSubTitle2,
          counterText: tOnBoardingCounter2,
          bgColor: tOnBoardingPage2Color,
        )),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: tOnBoarding3,
        title: "$tOnBoardingTitle3\n",
        subTitle: tOnBoardingSubTitle3,
        counterText: tOnBoardingCounter3,
        bgColor: tOnBoardingPage3Color,
      ),
    ),
  ];

  onPageChangedCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;

  void skip(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return WelcomeScreen();
    }));
  }

  animateToNextSlide(BuildContext context) {
    if (currentPage.value == pages.length - 1) {
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return WelcomeScreen();
      }));
    } else {
      controller.animateToPage(page: controller.currentPage + 1);
    }
  }

}
