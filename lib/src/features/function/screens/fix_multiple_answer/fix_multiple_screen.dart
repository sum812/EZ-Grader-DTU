import 'package:ez_grader/src/models/answer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/sizes.dart';
import '../../../../databases/repository/answer_repository.dart';
import '../../../core/models/appbar.dart';
import '../../models/radio_custom.dart';

class FixMultipleScreen extends StatefulWidget {
  final Answers answer;
  const FixMultipleScreen({super.key, required this.answer});

  @override
  State<FixMultipleScreen> createState() => _FixMultipleScreenState();
}

class _FixMultipleScreenState extends State<FixMultipleScreen> {
  late int? numOfQues;
  late Map<int, String?> selectedAnswers;
  Map<int, String?> updatedAnswers = {};
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
    _codeController.text = widget.answer.exam_code.toString();
    fetchAnswer();
  }

  void fetchAnswer() async {
    numOfQues = widget.answer.multiple_answer?.length;
    String? strMultipleAnswer = widget.answer.multiple_answer;

    if (strMultipleAnswer != null && strMultipleAnswer.isNotEmpty && strMultipleAnswer.length == numOfQues) {
      List<String> characterList = strMultipleAnswer.split('');
      selectedAnswers = characterList.asMap();
    }

    if (numOfQues == null) {
      print('Answer is empty!');
    }

    setState(() {});
  }

  void _updateAnswer(int index, String? value) {
    setState(() {
      updatedAnswers = Map.from(selectedAnswers);
      updatedAnswers[index] = value;
      selectedAnswers = updatedAnswers;
    });
  }

  Future<void> _showFinalResults() async {
    try {
      print('List answer: $selectedAnswers');
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

        Answers myAnswer = Answers(
            user_id: widget.answer.user_id,
            exam_id: int.parse(widget.answer.exam_id.toString()),
            exam_code: widget.answer.exam_code,
            exam_type: widget.answer.exam_type,
            multiple_answer: listAnswer
        );

        await AnswerRepository().updateMultiple(answer: myAnswer);

        Get.back();
      }
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Change Multiple Answer',
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
                  Opacity(
                    opacity: 0.5,
                    child: Text(
                      'Code',
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: size.width * 0.3,
                    child: TextFormField(
                      enabled: false,
                      controller: _codeController,
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
                  'CHANGE',
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

