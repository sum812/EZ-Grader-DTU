import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/function/models/appbar.dart';
import 'package:ez_grader/src/features/function/screens/exam_func/widgets/exam_menu_widgets.dart';
import 'package:ez_grader/src/models/exams.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../add_multiple/add_multiple_model_bottom_sheet.dart';
import '../grading/grading_screen.dart';

class ExamFunction extends StatelessWidget {
  final Exams exam;

  const ExamFunction({Key? key, required this.exam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: exam.exam_name),
      body: Container(
        padding: const EdgeInsets.only(top: tDefaultSize),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              margin: const EdgeInsets.only(bottom: 20),
              child: ExamMenuWidget(
                title: tMultipleTitle,
                icon: Icons.question_answer_outlined,
                endIcon: false,
                onPress: () {
                  AddMultiple.buildShowModalBottomSheet(context, exam);
                },
              ),
            ),
            Visibility(
              visible: exam.exam_type == 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                margin: const EdgeInsets.only(bottom: 20),
                child: ExamMenuWidget(
                  title: tShortTitle,
                  icon: Icons.question_answer_outlined,
                  endIcon: false,
                  onPress: () {},
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              margin: const EdgeInsets.only(bottom: 20),
              child: ExamMenuWidget(
                title: tGradingTitle,
                icon: Icons.score,
                onPress: () {
                  Get.to(() => GradingScreen(exam: exam,));
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              margin: const EdgeInsets.only(bottom: 20),
              child: ExamMenuWidget(
                title: tGradedTitle,
                icon: Icons.reviews,
                onPress: () {},
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              margin: const EdgeInsets.only(bottom: 20),
              child: ExamMenuWidget(
                title: tStatisticalTitle,
                icon: Icons.analytics,
                onPress: () {},
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ExamMenuWidget(
                title: tExportTitle,
                icon: Icons.import_export,
                endIcon: false,
                onPress: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
