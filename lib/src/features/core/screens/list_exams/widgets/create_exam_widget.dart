import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../databases/ez_grader_db.dart';
import '../../../../../models/users.dart';

class CreateExamWidget extends StatefulWidget {
  const CreateExamWidget({Key? key}) : super(key: key);

  @override
  _CreateExamWidgetState createState() => _CreateExamWidgetState();
}

class _CreateExamWidgetState extends State<CreateExamWidget> {
  final TextEditingController examNameController = TextEditingController();
  final TextEditingController examScoreController = TextEditingController();
  final TextEditingController numOfQuestionsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Create Exam',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 25),
      ),
      contentPadding: const EdgeInsets.all(30),
      content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: examNameController,
                decoration: InputDecoration(
                    label: Text(
                  tExamName,
                  style: Theme.of(context).textTheme.headlineSmall,
                )),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: tFormHeight,
              ),
              TextField(
                controller: examScoreController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    tExamScore,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: tFormHeight,
              ),
              DropdownButtonFormField<String>(
                value: selectedForm,
                items: formOptions.map((form) {
                  return DropdownMenuItem(
                    value: form,
                    child: Text(form),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedForm = value!;
                  });
                },
                decoration: InputDecoration(
                    label: Text(
                  tExamForm,
                  style: Theme.of(context).textTheme.headlineSmall,
                )),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: tFormHeight,
              ),
              DropdownButtonFormField<String>(
                value: selectedType,
                items: typeOptions.map((form) {
                  return DropdownMenuItem(
                    value: form,
                    child: Text(form),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedType = value!;
                  });
                },
                decoration: InputDecoration(
                    label: Text(
                  tExamType,
                  style: Theme.of(context).textTheme.headlineSmall,
                )),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: tFormHeight,
              ),
              TextField(
                controller: numOfQuestionsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    label: Text(
                  tExamQues,
                  style: Theme.of(context).textTheme.headlineSmall,
                )),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                tExamCancel,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                String examName = examNameController.text;
                String examScore = examScoreController.text;
                String numQuestions = numOfQuestionsController.text;

                print('Exam Name: $examName');
                print('Exam Score: $examScore');
                print('Selected Form: $selectedForm');
                print('Selected Type: $selectedType');
                print('Number of Questions: $numQuestions');

                final _auth = FirebaseAuth.instance;
                String? email = _auth.currentUser?.email;
                if (email != null) {
                  Users currentUser = await EZGradeDB().fetchByEmail(email);
                  print('current user + ${currentUser.toString()}');
                } else {
                  print('khong lay duoc info');
                }

                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15)),
              child: const Text(
                tExamSubmit,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
