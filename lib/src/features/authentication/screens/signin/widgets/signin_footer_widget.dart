import 'package:ez_grader/src/constants/image_string.dart';
import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:flutter/material.dart';

class SignInFooterWidget extends StatelessWidget {
  const SignInFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.center,
      children: [
        const Text(
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
          onPressed: () {},
          child: Text.rich(
            TextSpan(
                text: tDontHaveAnAccount,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall,
                children: const [
                  TextSpan(
                      text: tSignUp,
                      style: TextStyle(
                          color: Colors.blue))
                ]),
          ),
        ),
      ],
    );
  }
}
