import 'package:ez_grader/src/common_widgets/forms/form_header_widget.dart';
import 'package:ez_grader/src/constants/image_string.dart';
import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/authentication/screens/signin/widgets/signin_footer_widget.dart';
import 'package:ez_grader/src/features/authentication/screens/signin/widgets/signin_form_widget.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(
                tDefaultSize),
            child: const Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                FormHeaderWidget(
                    image: tWelcomeScreenImage,
                    title: tLoginTitle,
                    subTitle: tLoginSubTitle),
                SigninForm(),
                SignInFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
