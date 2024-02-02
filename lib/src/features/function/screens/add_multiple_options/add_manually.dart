import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/databases/repository/exam_repository.dart';
import 'package:ez_grader/src/features/function/models/appbar.dart';
import 'package:ez_grader/src/features/function/screens/add_multiple_options/validator/add_manually_validator.dart';
import 'package:ez_grader/src/features/function/screens/add_multiple_options/view_all_answer.dart';
import 'package:ez_grader/src/models/exams.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../databases/repository/answer_repository.dart';
import '../../../../models/answer.dart';
import '../../models/radio_custom.dart';

class AddManually extends StatefulWidget {
  final Exams exam;

  const AddManually({super.key, required this.exam});

  @override
  State<AddManually> createState() => _AddManuallyState();
}

class _AddManuallyState extends State<AddManually> {
  int? numOfQues = 0;
  Map<int, String?> selectedAnswers = {};
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fetchAnswer();
  }

  void fetchAnswer() async {
    numOfQues = await ExamRepository().getExamQuestions(int.parse(widget.exam.exam_id.toString()));
    setState(() {});
  }

  void _updateAnswer(int index, String? value) {
    setState(() {
      selectedAnswers[index] = value;
    });
  }

  Future<void> _showFinalResults() async {
    if (_formKey.currentState!.validate()) {
      String code = _codeController.text;
      print('Giá trị của code: $code');

      bool allQuestionsAnswered = selectedAnswers.length == numOfQues;

      if (allQuestionsAnswered) {
        List<Map<String, dynamic>> sortedResults = [];

        selectedAnswers.forEach((index, answer) {
          sortedResults.add({
            'question': index + 1,
            'answer': answer,
          });
        });

        sortedResults.sort((a, b) => a['question'].compareTo(b['question']));

        String listAnswer = '';
        for (var result in sortedResults) {
          listAnswer = listAnswer + result['answer'];
        }
        print('List Answer: $listAnswer');

        Answers myAnswer = Answers(
            user_id: widget.exam.user_id,
            exam_id: int.parse(widget.exam.exam_id.toString()),
            exam_code: int.parse(code),
            exam_type: widget.exam.exam_type,
            multiple_answer: listAnswer
        );

        if (await AnswerRepository().isExamCodeExists(
            user_id: widget.exam.user_id,
            exam_id: int.parse(widget.exam.exam_id.toString()),
            exam_code: int.parse(code))) {
          await AnswerRepository().updateMultiple(answer: myAnswer);
        } else {
          await AnswerRepository().addMultipleAnswer(answer: myAnswer);
        }

        Get.off(() => ViewAllAnswer(exam: widget.exam));
      } else {
        _showUnansweredQuestions();
      }
    }
  }

  void _showUnansweredQuestions() {
    List<int> unansweredQuestions = [];
    for (int i = 0; i < numOfQues!; i++) {
      if (!selectedAnswers.containsKey(i)) {
        unansweredQuestions.add(i + 1);
      }
    }

    if (unansweredQuestions.isNotEmpty) {
      print('Các câu chưa được chọn: ${unansweredQuestions.join(', ')}');
      Get.snackbar(
        'Warning',
        'You have not selected enough: ${unansweredQuestions.join(', ')}',
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.yellowAccent.withOpacity(.3),
        colorText: Colors.yellowAccent,
      );
    } else {
      print('Tất cả các câu đã được chọn!');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Add Manually',
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Code',
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: size.width * 0.3,
                    child: TextFormField(
                      controller: _codeController,
                      validator: (value) => AddManuallyValidator().validateInput(value),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        errorStyle: TextStyle(fontSize: 12.0, color: Colors.red),
                      ),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              color: Colors.black,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: numOfQues,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            margin: const EdgeInsets.only(right: tDefaultSize - 10),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.5),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Row(children: [
                            MyRadioListTile<String>(
                              value: 'A',
                              groupValue: selectedAnswers[index] ?? '',
                              leading: 'A',
                              onChanged: (value) => _updateAnswer(index, value),
                            ),
                            MyRadioListTile<String>(
                              value: 'B',
                              groupValue: selectedAnswers[index] ?? '',
                              leading: 'B',
                              onChanged: (value) => _updateAnswer(index, value),
                            ),
                            MyRadioListTile<String>(
                              value: 'C',
                              groupValue: selectedAnswers[index] ?? '',
                              leading: 'C',
                              onChanged: (value) => _updateAnswer(index, value),
                            ),
                            MyRadioListTile<String>(
                              value: 'D',
                              groupValue: selectedAnswers[index] ?? '',
                              leading: 'D',
                              onChanged: (value) => _updateAnswer(index, value),
                            ),
                          ]),
                        ],
                      ),
                      const SizedBox(
                        height: tFormHeight - 10,
                      )
                    ],
                  );
                },
              ),
            ),
            const Divider(
              thickness: 2,
              color: Colors.black,
            ),
            Center(
              child: ElevatedButton(
                onPressed: _showFinalResults,
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 100), backgroundColor: Colors.blueAccent.withOpacity(0.2), foregroundColor: Colors.blue, side: BorderSide.none),
                child: const Text(
                  'SAVE',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
