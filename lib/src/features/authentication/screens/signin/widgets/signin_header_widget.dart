import 'package:ez_grader/src/constants/image_string.dart';
import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:flutter/material.dart';

class SignInHeaderWidget extends StatelessWidget {
  const SignInHeaderWidget({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Image(
            image: const AssetImage(
                tWelcomeScreenImage),
            height: size.height * 0.25),
        const SizedBox(
          height: tFormHeight - 10,
        ),
        Text(tLoginTitle,
            style: Theme.of(context)
                .textTheme
                .displayLarge),
        const SizedBox(
          height: tFormHeight - 20,
        ),
        Text(tLoginSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall),
      ],
    );
  }
}
