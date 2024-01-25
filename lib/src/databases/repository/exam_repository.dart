import 'package:sqflite/sqflite.dart';

import '../../models/exams.dart';
import '../database_service.dart';

class ExamRepository {
  final tableExams = 'exams';

  Future<int> createExam({required int user_id, required String exam_name, required double score, required int exam_form, required int exam_type, required int exam_ques}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableExams (user_id, 
      exam_name, exam_score, exam_form, exam_type, 
      num_of_questions) 
      VALUES (?, ?, ?, ?, ?, ?)
    ''', [user_id, exam_name, score, exam_form, exam_type, exam_ques]);
  }

  Future<List<Exams>> fetchAllExams({required int user_id}) async {
    final database = await DatabaseService().database;
    final exams = await database.rawQuery(
        '''
      SELECT * FROM $tableExams WHERE user_id = ? ORDER BY created_at DESC
    ''', [user_id]
    );

    return exams.map((exam) => Exams.fromSqfliteDatabase(exam)).toList();
  }

  Future<bool> isExamNameExists(String examName) async {
    final database = await DatabaseService().database;
    final result = await database.rawQuery(
      '''
    SELECT EXISTS (
      SELECT 1 FROM $tableExams WHERE exam_name = ? LIMIT 1
    ) AS isExists
    ''',
      [examName],
    );

    return Sqflite.firstIntValue(result) == 1;
  }

  Future<Exams?> fetchExamByName(String exam_name) async {
    final database = await DatabaseService().database;
    final exam = await database.rawQuery('''
        SELECT * FROM $tableExams WHERE exam_name
         = ?
      ''', [exam_name]);
    if (exam.isNotEmpty) {
      return Exams.fromSqfliteDatabase(exam.first);
    } else {
      return null;
    }
  }

  Future<void> deleteExam(int exam_id) async {
    final database = await DatabaseService().database;
    await database.rawDelete('''
        DELETE FROM $tableExams WHERE exam_id = ?
      ''', [exam_id]);
  }
}