import 'package:ez_grader/src/databases/repository/answer_repository.dart';
import 'package:ez_grader/src/models/answer.dart';
import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../../../models/exams.dart';
import '../../../core/models/appbar.dart';

class ViewAllAnswer extends StatefulWidget {
  final Exams exam;

  const ViewAllAnswer({super.key, required this.exam});

  @override
  State<ViewAllAnswer> createState() => _ViewAllAnswerState();
}

class _ViewAllAnswerState extends State<ViewAllAnswer> {
  Future<List<Answers>>? futureAnswers;
  final answerRepo = AnswerRepository();

  @override
  void initState() {
    super.initState();
    fetchAnswer();
  }

  void fetchAnswer() async {
    setState(() {
      futureAnswers = answerRepo.fetchAllAnswer(user_id: widget.exam.user_id, exam_id: int.parse(widget.exam.exam_id.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(title: 'View all multiple answer'),
        body: FutureBuilder<List<Answers>>(
            future: futureAnswers,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              } else {
                final answers = snapshot.data;

                if (answers != null && answers.isNotEmpty) {
                  return ListView.builder(
                    itemCount: answers.length,
                    itemBuilder: (context, index) {
                      final answer = answers[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: tDefaultSize, left: tDefaultSize / 2, right: tDefaultSize / 2),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(0.8),
                                Colors.black.withOpacity(0.5),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Code',
                                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 24, color: Colors.white),
                                    ),
                                    Text(
                                      answer.exam_code.toString(),
                                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 20, color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          _showDeleteConfirmationDialog(answer, context);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.redAccent,
                                          size: 40,
                                        )),
                                    IconButton(
                                        onPressed: () {

                                        },
                                        icon: const Icon(
                                          Icons.build,
                                          color: Colors.greenAccent,
                                          size: 40,
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text(
                      'No answers',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  );
                }
              }
            }));
  }

  Future<void> _showDeleteConfirmationDialog(Answers answer, BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            'Delete code "${answer.exam_code}"?',
            style: const TextStyle(fontSize: 24),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 22),
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await AnswerRepository().deleteMultipleAnswer(answer: answer);
                fetchAnswer();
              },
              child: const Text(
                'Yes',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ],
        );
      },
    );
  }
}
