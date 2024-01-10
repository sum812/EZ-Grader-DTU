import 'package:ez_grader/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    Key? key,
    this.imageColor,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subTitle,
    this.crossAxisAlignment =
        CrossAxisAlignment.start,
    this.imageHeight = 0.25,
    this.textAlign,
  }) : super(key: key);

  final String image, title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final double? heightBetween;
  final double imageHeight;
  final Color? imageColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
            image: AssetImage(image),
            color: imageColor,
            height: size.height * imageHeight),
        SizedBox(
          height: heightBetween,
        ),
        Text(title, textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge),
        const SizedBox(
          height: tFormHeight - 20,
        ),
        Text(subTitle, textAlign: textAlign,
            style: Theme.of(context)
                .textTheme
                .headlineSmall),
      ],
    );
  }
}
