import 'package:ez_grader/src/common_widgets/forms/form_header_widget.dart';
import 'package:ez_grader/src/constants/image_string.dart';
import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/authentication/screens/signup/widgets/signup_footer_widget.dart';
import 'package:ez_grader/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.all(tDefaultSize),
          child: const Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle),
              SignUpFormWidget(),
              SignUpFooterWidget()
            ],
          ),
        ),
      )),
    );
  }
}
