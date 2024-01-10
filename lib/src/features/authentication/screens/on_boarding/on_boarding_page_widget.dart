import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/features/authentication/models/model_on_boarding.dart';
import 'package:flutter/material.dart';

class OnBoardingPageWidget
    extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: size.height / 2.5,
          ),
          Column(
            children: [
              Text(
                model.title,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall,
                textAlign: TextAlign.center,
              ),
              Text(
                model.subTitle,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Text(model.counterText,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge,
              textAlign: TextAlign.center),
          const SizedBox(
            height: tDefaultSize,
          )
        ],
      ),
    );
  }
}
