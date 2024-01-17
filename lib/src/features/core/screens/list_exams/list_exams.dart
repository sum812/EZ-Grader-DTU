import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/databases/ez_grader_db.dart';
import 'package:ez_grader/src/features/core/models/appbar.dart';
import 'package:ez_grader/src/features/core/screens/list_exams/widgets/create_exam_widget.dart';
import 'package:flutter/material.dart';

import '../../../../models/exams.dart';

class ListExamsScreen extends StatefulWidget {
  const ListExamsScreen({super.key});

  @override
  State<ListExamsScreen> createState() => _ListExamsScreenState();
}

class _ListExamsScreenState extends State<ListExamsScreen> {
  Future<List<Exams>>? futureExams;
  final ezGraderDB = EZGradeDB();

  @override
  void initState() {
    super.initState();
    fetchExams();
  }

  void fetchExams() {
    setState(() {
      futureExams = ezGraderDB.fetchAllExams();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: tListExamAppBar),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(context: context, builder:
              (_) => const CreateExamWidget());
        },
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
