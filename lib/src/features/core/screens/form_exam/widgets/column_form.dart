import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/features/core/controllers/link_builder/link_builder.dart';
import 'package:flutter/material.dart';

class ColumnForm extends StatelessWidget {
  const ColumnForm({
    super.key,
    required this.size,
    required this.image,
    required this.url,
    required this.buttonText,
  });

  final Size size;
  final String image, url, buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage(
              image),
          width: size.width * 0.4,
        ),
        Container(
          padding: const EdgeInsets
              .symmetric(
              horizontal:
              tFormExamPadding * 2),
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius
                .circular(10),
            color: Colors.red[300],
          ),
          child: buildLink(Uri.parse(url), buttonText),
        ),
      ],
    );
  }
}
