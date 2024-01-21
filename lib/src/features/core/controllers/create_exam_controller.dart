import 'package:ez_grader/src/databases/ez_grader_db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/users.dart';

class CreateExamController extends GetxController {
  static CreateExamController get instance => Get.find();

  final examName = TextEditingController();
  final examScore = TextEditingController();
  final examQues = TextEditingController();

  int formatExamForm(String selectedForm) {
    if (selectedForm == 'Form 20') {
      return 20;
    } else if (selectedForm == 'Form 40') {
      return 40;
    } else if (selectedForm == 'Form 50') {
      return 50;
    } else if (selectedForm == 'Form 50') {
      return 60;
    } else if (selectedForm == 'Form 100') {
      return 100;
    } else {
      return 120;
    }
  }

  int formatExamType(String selectedType) {
    return selectedType == 'Multiple choice' ? 0 : 1;
  }

  static Future<bool> isExamNameExists(String examName) async {
    final exam = await EZGradeDB().fetchExamByName(examName);
    return exam != null;
  }

  Future<void> createExam(String email, String exam_name, String exam_score, String exam_form, String exam_type, String exam_ques) async {
    try {
      Users currentUser = await EZGradeDB().fetchByEmail(email);
      final isExists = await EZGradeDB().isExamNameExists(exam_name);
      if (isExists) {
        Get.snackbar(
          'Error',
          'Exam name already exists in the database',
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.red.withOpacity(.3),
          colorText: Colors.white,
        );
        return;
      }
      EZGradeDB().createExam(user_id: currentUser.user_id!.toInt(), exam_name: exam_name, score: double.parse(exam_score), exam_form: formatExamForm(exam_form), exam_type: formatExamType(exam_type), exam_ques: int.parse(exam_ques));
    } catch (error) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
      print('Error during user creation: $error');
    }
  }

  Future<void> deleteExam(String exam_id, BuildContext context) async {
    try {
      EZGradeDB().deleteExam(int.parse(exam_id));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
              'Exam cleared',
              style: TextStyle(fontSize: 16),
            )),
      );
    } catch (error) {
      Get.showSnackbar(GetSnackBar(message: error.toString(),));
      print('Error during user creation: $error');
    }
  }
}
