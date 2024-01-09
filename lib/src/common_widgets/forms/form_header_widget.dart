import 'package:ez_grader/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget(
      {Key? key,
      required this.image,
      required this.title,
      required this.subTitle})
      : super(key: key);

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Image(
            image: AssetImage(
                image),
            height: size.height * 0.25),
        const SizedBox(
          height: tFormHeight - 10,
        ),
        Text(title,
            style: Theme.of(context)
                .textTheme
                .displayLarge),
        const SizedBox(
          height: tFormHeight - 20,
        ),
        Text(subTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall),
      ],
    );
  }
}
