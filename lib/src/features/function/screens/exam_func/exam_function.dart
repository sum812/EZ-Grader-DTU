import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/function/models/appbar.dart';
import 'package:ez_grader/src/features/function/screens/exam_func/widgets/exam_menu_widgets.dart';
import 'package:ez_grader/src/models/exams.dart';
import 'package:flutter/material.dart';

import '../add_multiple/add_multiple_model_bottom_sheet.dart';

class ExamFunction extends StatelessWidget {
  final Exams exam;

  const ExamFunction({Key? key, required this.exam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: exam.exam_name),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: tDefaultSize, horizontal: tDefaultSize - 10),
        child: Column(
          children: [
            ExamMenuWidget(
              title: tMultipleTitle,
              icon: Icons.question_answer_outlined,
              endIcon: false,
              onPress: () {
                AddMultiple.buildShowModalBottomSheet(context, exam);
              },
            ),
            const SizedBox(
              height: tFormHeight,
            ),
            Visibility(
              visible: exam.exam_type == 1,
              child: ExamMenuWidget(
                title: tShortTitle,
                icon: Icons.question_answer_outlined,
                endIcon: false,
                onPress: () {},
              ),
            ),
            Visibility(
              visible: exam.exam_type == 1,
              child: const SizedBox(
                height: tFormHeight,
              ),
            ),
            ExamMenuWidget(
              title: tGradingTitle,
              icon: Icons.score,
              onPress: () {},
            ),
            const SizedBox(
              height: tFormHeight,
            ),
            ExamMenuWidget(
              title: tGradedTitle,
              icon: Icons.reviews,
              onPress: () {},
            ),
            const SizedBox(
              height: tFormHeight,
            ),
            ExamMenuWidget(
              title: tStatisticalTitle,
              icon: Icons.analytics,
              onPress: () {},
            ),
            const SizedBox(
              height: tFormHeight,
            ),
            ExamMenuWidget(
              title: tExportTitle,
              icon: Icons.import_export,
              endIcon: false,
              onPress: () {},
            ),
            const SizedBox(
              height: tFormHeight,
            ),
          ],
        ),
      )),
    );
  }
}
