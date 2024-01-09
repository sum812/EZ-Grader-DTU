import 'package:ez_grader/src/constants/image_string.dart';
import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/authentication/screens/signin/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [const Text(
        "OR",
        style: TextStyle(
            fontWeight: FontWeight.bold),
      ),
        const SizedBox(height: tFormHeight),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(
                image: AssetImage(tGoogleIcon),
                width: 20.0),
            onPressed: () {},
            label: const Text(
              tSignInWithGoogle,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: tFormHeight - 20),
        TextButton(
          onPressed: () => Get.off(() => const SigninScreen()),
          child: Text.rich(
            TextSpan(
                text: tAlreadyHaveAnAccount,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall,
                children: const [
                  TextSpan(
                      text: tLogin,
                      style: TextStyle(
                          color: Colors.blue))
                ]),
          ),
        ),
      ],
    );
  }
}
