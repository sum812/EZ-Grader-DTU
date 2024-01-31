import 'package:ez_grader/src/models/answer.dart';
import 'package:sqflite/sqflite.dart';

import '../database_service.dart';

class AnswerRepository {
  final tableAnswer = 'answer';

  Future<List<Answers>> fetchAllAnswer(Answers answer) async {
    final database = await DatabaseService().database;
    final answers = await database.rawQuery('''
      SELECT * FROM $tableAnswer WHERE user_id = ? AND exam_id = ?
    ''', [answer.user_id, answer.exam_id]);

    return answers.map((answer) => Answers.fromSqfliteDatabase(answer)).toList();
  }

  Future<int> addMultipleAnswer({required Answers answer}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableAnswer (
      user_id, 
      exam_id, 
      exam_type, 
      exam_code, 
      multiple_answer) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      answer.user_id,
      answer.exam_id,
      answer.exam_type,
      answer.exam_code,
      answer.multiple_answer,
    ]);
  }

  Future<int> addShortAnswer({required Answers answers}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableAnswer (
      user_id, 
      exam_id, 
      exam_type, 
      exam_code, 
      short_ques1, 
      short_ques2, 
      short_ques3, 
      short_ques4, 
      short_ques5,
      short_ans1, 
      short_ans2, 
      short_ans3, 
      short_ans4, 
      short_ans5) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', [
      answers.user_id,
      answers.exam_id,
      answers.exam_type,
      answers.exam_code,
      answers.short_ques1,
      answers.short_ques2,
      answers.short_ques3,
      answers.short_ques4,
      answers.short_ques5,
      answers.short_ans1,
      answers.short_ans2,
      answers.short_ans3,
      answers.short_ans4,
      answers.short_ans5,
    ]);
  }

  Future<bool> isExamCodeExists({required Answers answer}) async {
    final database = await DatabaseService().database;

    final result = await database.rawQuery('''
      SELECT COUNT(*) FROM $tableAnswer WHERE user_id = ? AND exam_id = ? AND exam_code = ?
    ''', [answer.user_id, answer.exam_id, answer.exam_code]);

    final count = Sqflite.firstIntValue(result) ?? 0;

    return count > 0;
  }

  Future<int> updateMultiple({required Answers answer}) async {
    final database = await DatabaseService().database;
    return await database.update(
      tableAnswer,
      {'multiple_answer': answer.multiple_answer},
      where: 'user_id = ? AND exam_id = ? AND exam_code = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [answer.user_id, answer.exam_id, answer.exam_code],
    );
  }

  Future<void> deleteAllAnswer() async {
    final database = await DatabaseService().database;
    await database.rawDelete('''
        DELETE FROM $tableAnswer
      ''');
  }

  Future<void> deleteMultiple({required Answers answer}) async {
    final database = await DatabaseService().database;
    await database.rawDelete('''
        DELETE FROM $tableAnswer WHERE answer_id = ? AND user_id = ? AND exam_id = ? AND exam_code = ?
      ''', [answer.answer_id, answer.user_id, answer.exam_id, answer.exam_code]);
  }
}
