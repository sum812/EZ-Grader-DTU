import 'package:ez_grader/src/databases/ez_grader_db.dart';
import 'package:flutter/cupertino.dart';
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

  Future<void> createExam(String email, String exam_name, String exam_score, String exam_form, String exam_type, String exam_ques) async {
    try {
      Users currentUser = await EZGradeDB().fetchByEmail(email);
      EZGradeDB().createExam(user_id: currentUser.user_id!.toInt(), exam_name: exam_name, score: double.parse(exam_score), exam_form: formatExamForm(exam_form), exam_type: formatExamType(exam_type), exam_ques: int.parse(exam_ques));
    } catch (error) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
      print('Error during user creation: $error');
    }
  }
}
