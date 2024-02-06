import 'dart:io';

import 'package:excel_dart/excel_dart.dart';
import 'package:ez_grader/src/databases/repository/answer_repository.dart';
import 'package:ez_grader/src/models/answer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../databases/repository/exam_repository.dart';
import '../../../../models/exams.dart';

class AddByFile {
  static void openFile(BuildContext context, Exams exam) async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
      allowMultiple: false,
    );

    if (resultFile!.files.isNotEmpty) {
      if (resultFile.files.single.extension != 'xlsx') {
        showErrorSnackbar('File is not an xlsx file');
      } else {
        if (await readFileExcel(resultFile, exam)) {
          showSuccessSnackbar('Read file successfully🎉🎉🎉');
        }
      }
    } else {
      showErrorSnackbar('No file selector!');
    }
  }

  static Future<bool> readFileExcel(FilePickerResult pickedFile, Exams exam) async {
    try {
      bool status = true;
      List<String> data = [];

      var bytes = File(pickedFile.files.first.path.toString()).readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);

      for (var table in excel.tables.keys) {
        String codeAnswer = "";
        for (var row in excel.tables[table]!.rows) {
          if (row[1]!.value != null) {
            codeAnswer += row[1]!.value.toString().replaceAll(".0", "");
          }
        }
        data.add(codeAnswer);
      }

      if (data.isNotEmpty) {
        for (String dt in data) {
          String code = dt.substring(0, 3);
          String answer = dt.substring(3);

          ExamRepository examRepository = ExamRepository();
          int? examQuestions = await examRepository.getExamQuestions(int.parse(exam.exam_id.toString()));

          if (answer.length < examQuestions!) {
            showErrorSnackbar('The file does not have enough answers!');
            return false;
          } else if (answer.length > examQuestions!) {
            showErrorSnackbar('File with extra answers!');
            return false;
          } else {
            Answers myAnswer = Answers(user_id: exam.user_id, exam_id: int.parse(exam.exam_id.toString()), exam_code: int.parse(code), exam_type: exam.exam_type, multiple_answer: answer);
            if (await AnswerRepository().isExamCodeExists(user_id: myAnswer.user_id, exam_id: myAnswer.exam_id, exam_code: myAnswer.exam_code)) {
              await AnswerRepository().updateMultiple(answer: myAnswer);
            } else {
              await AnswerRepository().addMultipleAnswer(answer: myAnswer);
            }
          }
        }
      } else {
        return false;
      }

      return status;
    } catch (error) {
      print('Read File Excel Error: ${error.toString()}');
      return false;
    }
  }

  static void showErrorSnackbar(String errorMessage) {
    Get.snackbar(
      'Error',
      errorMessage,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      colorText: Colors.red,
    );
  }

  static void showSuccessSnackbar(String successMessage) {
    Get.snackbar(
      'Success',
      successMessage,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      colorText: Colors.green,
    );
  }
}
