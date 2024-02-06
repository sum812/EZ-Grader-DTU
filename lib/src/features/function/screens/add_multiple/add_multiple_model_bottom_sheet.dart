import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/function/screens/add_multiple_options/add_by_file.dart';
import 'package:ez_grader/src/features/function/screens/add_multiple_options/add_manually.dart';
import 'package:ez_grader/src/features/function/screens/add_multiple_options/view_all_answer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/exams.dart';
import 'add_multiple_btn_widget.dart';

mixin AddMultiple {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context, Exams exam) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      builder: (context) => Container(
        padding: const EdgeInsets.all(tDefaultSize + 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tAddMultipleTitle,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 30),
            ),
            Text(
              tAddMultipleSubTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: tDefaultSize + 20,
            ),
            AddMultipleBtnWidget(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => AddManually(exam: exam,));
              },
              btnIcon: Icons.back_hand_outlined,
              title: tAddManually,
              subTitle: tAddManuallyTitle,
            ),
            const SizedBox(
              height: tDefaultSize,
            ),
            AddMultipleBtnWidget(
              onTap: () async {
                AddByFile.openFile(context, exam);
                Navigator.pop(context);
              },
              btnIcon: Icons.file_open_outlined,
              title: tAddFile,
              subTitle: tAddFileTitle,
            ),
            const SizedBox(
              height: tDefaultSize,
            ),
            AddMultipleBtnWidget(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => ViewAllAnswer(exam: exam));
              },
              btnIcon: Icons.history_edu,
              title: tAllAnswer,
              subTitle: tAllAnswerTitle,
            ),
          ],
        ),
      ),
    );
  }
}
