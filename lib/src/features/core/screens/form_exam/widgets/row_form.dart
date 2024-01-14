

import 'package:ez_grader/src/features/core/screens/form_exam/widgets/column_form.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/image_string.dart';
import '../../../../../constants/link.dart';

class RowForm extends StatelessWidget {
  const RowForm({
    super.key,
    required this.size,
    required this.image1,
    required this.image2,
    required this.url1,
    required this.url2,
    required this.buttonText1,
    required this.buttonText2,
  });

  final Size size;
  final String image1, url1, buttonText1, image2, url2, buttonText2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ColumnForm(size: size, image: image1, url: url1, buttonText: buttonText1,),
        ColumnForm(size: size, image: image2, url: url2, buttonText: buttonText2,),
      ],
    );
  }
}