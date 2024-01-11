import 'package:ez_grader/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:ez_grader/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:ez_grader/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:ez_grader/src/constants/image_string.dart';
import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/authentication/controllers/click_to_exit_controller.dart';
import 'package:ez_grader/src/features/authentication/screens/signin/signin_screen.dart';
import 'package:ez_grader/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final ClickToExit clickToExit = ClickToExit();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness =
        mediaQuery.platformBrightness;
    final isDarkMode =
        brightness == Brightness.dark;

    return Scaffold(
        backgroundColor: isDarkMode
            ? Colors.grey[900]
            : Colors.white,
        body: SafeArea(
            child: WillPopScope(
          onWillPop: () async {
            return clickToExit.onWillPop(context);
          },
          child: Stack(
            children: [
              Container(
                  padding: const EdgeInsets.all(
                      tDefaultSize),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceEvenly,
                    children: [
                      Hero(
                        tag: tWelcomeTag,
                        child: Image(
                          image: const AssetImage(
                              tWelcomeScreenImage),
                          height: height / 2.5,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            tHeading,
                            style:
                                Theme.of(context)
                                    .textTheme
                                    .displayLarge,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            tSubHeading,
                            style: Theme.of(
                                    context)
                                .textTheme
                                .labelSmall,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                onPressed: () => Get.to(() => const SigninScreen()),
                                child: Text(
                                  tLogin
                                      .toUpperCase(),
                                  style:
                                      const TextStyle(
                                    fontSize:
                                        20.0,
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                  ),
                                )),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: OutlinedButton(
                                onPressed: () => Get.to(() => const SignUpScreen()),
                                child: Text(
                                  tSignUp
                                      .toUpperCase(),
                                  style:
                                      const TextStyle(
                                    fontSize:
                                        20.0,
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                  ),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
            ],
          ),
        )));
  }
}
