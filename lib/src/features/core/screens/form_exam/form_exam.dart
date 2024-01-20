import 'package:ez_grader/src/constants/image_string.dart';
import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/core/models/appbar.dart';
import 'package:ez_grader/src/features/core/screens/form_exam/widgets/row_form.dart';
import 'package:flutter/material.dart';

import '../../../../constants/link.dart';

class FormExamScreen extends StatelessWidget {
  const FormExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const AppBarWidget(title: tFormExamAppBar),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(
              tFormExamPadding),
          child: Column(
            children: [
              RowForm(
                size: size,
                image1: tForm20Image,
                image2: tForm40Image,
                url1: tForm20Link,
                url2: tForm40Link,
                buttonText1: tForm20Btn,
                buttonText2: tForm40Btn,
              ),
              const SizedBox(height: tFormExamPadding * 3,),
              RowForm(
                size: size,
                image1: tForm50Image,
                image2: tForm60Image,
                url1: tForm50Link,
                url2: tForm60Link,
                buttonText1: tForm50Btn,
                buttonText2: tForm60Btn,
              ),
              const SizedBox(height: tFormExamPadding * 3,),
              RowForm(
                size: size,
                image1: tForm100Image,
                image2: tForm120Image,
                url1: tForm100Link,
                url2: tForm120Link,
                buttonText1: tForm100Btn,
                buttonText2: tForm120Btn,
              ),
              const SizedBox(height: tFormExamPadding * 3,),
            ],
          ),
        ),
      ),
    );
  }
}