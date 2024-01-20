import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/core/controllers/create_exam_controller.dart';
import 'package:ez_grader/src/features/core/screens/list_exams/validatiors/create_exam_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateExamWidget extends StatefulWidget {
  const CreateExamWidget({Key? key}) : super(key: key);

  @override
  _CreateExamWidgetState createState() => _CreateExamWidgetState();
}

class _CreateExamWidgetState extends State<CreateExamWidget> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = Get.put(CreateExamController());

    return AlertDialog(
      title: Text(
        'Create Exam',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 25),
      ),
      contentPadding: const EdgeInsets.all(30),
      content: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) => CreateExamValidator.validateExamName(value!),
                controller: controller.examName,
                decoration: InputDecoration(
                  label: Text(
                    tExamName,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  prefixIcon: const Icon(
                    Icons.drive_file_rename_outline,
                  ),
                  errorStyle: const TextStyle(fontSize: 12.0, color: Colors.red),
                ),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: tFormHeight,
              ),
              TextFormField(
                validator: (value) => CreateExamValidator.validateExamScore(value!),
                controller: controller.examScore,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    tExamScore,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  prefixIcon: const Icon(
                    Icons.score,
                  ),
                  errorStyle: const TextStyle(fontSize: 12.0, color: Colors.red),
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
              TextFormField(
                validator: (value) => CreateExamValidator.validateNumOfQuestions(value!, selectedForm),
                controller: controller.examQues,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    tExamQues,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  prefixIcon: const Icon(
                    Icons.numbers,
                  ),
                  errorStyle: const TextStyle(fontSize: 12.0, color: Colors.red),
                ),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
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
                if (formKey.currentState!.validate()) {
                  final exam_name = controller.examName.text.trim();
                  final exam_score = controller.examScore.text.trim();
                  final exam_form = selectedForm;
                  final exam_type = selectedType;
                  final exam_ques = controller.examQues.text.trim();

                  final _auth = FirebaseAuth.instance;
                  String? email = _auth.currentUser?.email;
                  if (email != null) {
                    CreateExamController.instance.createExam(email, exam_name, exam_score, exam_form, exam_type, exam_ques);
                  } else {
                    print("Can't get User info");
                  }
                  Navigator.of(context).pop();
                }
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
