import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/models/exams.dart';
import 'package:flutter/material.dart';

class ExamFunction extends StatelessWidget {
  final Exams exam;

  const ExamFunction({Key? key, required this.exam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Exam Info: ${exam.toString()}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}