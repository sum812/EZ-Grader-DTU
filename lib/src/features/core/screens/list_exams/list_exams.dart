import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/databases/ez_grader_db.dart';
import 'package:ez_grader/src/features/core/controllers/get_current_user.dart';
import 'package:ez_grader/src/features/core/models/appbar.dart';
import 'package:ez_grader/src/features/core/screens/list_exams/widgets/create_exam_widget.dart';
import 'package:ez_grader/src/features/function/screens/exam_func/exam_function.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  void fetchExams() async {
    final firebaseUser = GetCurrentUser.GetInfo();
    if (firebaseUser != null) {
      final localUser = await EZGradeDB().fetchByEmail(firebaseUser.email.toString());
      int? user_id = localUser.user_id;
      if (user_id != null) {
        setState(() {
          futureExams = ezGraderDB.fetchAllExams(user_id: user_id);
        });
      } else {
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: tListExamAppBar),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          try {
            await showDialog(
              context: context,
              builder: (_) => const CreateExamWidget(),
            );
            fetchExams();
          } catch (error) {
            print('Error when adding a new exam: $error');
          }
        },
      ),
      body: FutureBuilder<List<Exams>>(
        future: futureExams,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final exams = snapshot.data;

            if (exams != null && exams.isNotEmpty) {
              return ListView.builder(
                  itemCount: exams.length,
                  itemBuilder: (context, index) {
                    final exam = exams[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: tDefaultSize, left: tDefaultSize / 2, right: tDefaultSize / 2),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.blue.withOpacity(0.7),
                              Colors.green.withOpacity(0.7),
                              Colors.orange.withOpacity(0.5),
                              Colors.purple.withOpacity(0.5),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: ListTile(
                            title: Text(
                              exam.exam_name.toUpperCase(),
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 24, color: Colors.white),
                            ),
                            subtitle: Text(
                              'Create at:  ${DateFormat('dd/MM/yyyy').format(exam.created_at!.toUtc())}',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 14, color: Colors.white),
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios_sharp, color: Colors.white,),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExamFunction(exam: exam),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
              );
            } else {
              return Center(
                child: Text(
                  'No exam',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              );
            }
          }
        },
      ),
    );
  }
}
