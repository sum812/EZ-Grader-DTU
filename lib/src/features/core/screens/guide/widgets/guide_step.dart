import 'package:ez_grader/src/constants/sizes.dart';
import 'package:flutter/material.dart';


class GuideStep extends StatelessWidget {
  const GuideStep({
    super.key,
    required this.step,
    required this.detailStep,
  });

  final String step, detailStep;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Text(
          step,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(
              fontWeight:
              FontWeight.bold,
              fontSize: 22),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          detailStep,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(fontSize: 18),
        ),
        const SizedBox(height: tGuidePadding ,)
      ],
    );
  }
}