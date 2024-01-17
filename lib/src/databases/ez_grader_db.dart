import 'package:ez_grader/src/databases/database_service.dart';
import 'package:ez_grader/src/models/users.dart';
import 'package:sqflite/sqflite.dart';

import '../models/exams.dart';

class EZGradeDB {
  final tableUsers = 'users';
  final tableExams = 'exams';

  Future<void> createTable(Database database) async {
    await database.execute('''
    CREATE TABLE $tableUsers (
      "user_id" INTEGER PRIMARY KEY AUTOINCREMENT,
      "email" TEXT,
    );
  ''');

    await database.execute('''
    CREATE TABLE $tableExams (
      "user_id" INTEGER,
      "exam_id" INTEGER PRIMARY KEY AUTOINCREMENT,
      "exam_name" TEXT,
      "exam_score" REAL,
      "exam_form" TEXT,
      "exam_type" TEXT,
      "num_of_questions" INTEGER
    );
  ''');
  }

  Future<int> createUser({required String email}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableUsers (email) VALUES (?)
    ''', [email]);
  }

  Future<int> createExam({required int user_id, required String exam_name, required double score, required int exam_form, required int exam_type, required int exam_ques}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableExams (user_id, 
      exam_name, score, exam_form, exam_type, 
      exam_ques) 
      VALUES (?, ?, ?, ?, ?, ?)
    ''', [user_id, exam_name, score, exam_form, exam_type, exam_ques]);
  }

  Future<List<Users>> fetchAllUsers() async {
    final database = await DatabaseService().database;
    final users = await database.rawQuery('''
      SELECT * FROM $tableUsers
    ''');

    return users.map((user) => Users.fromSqfliteDatabase(user)).toList();
  }

  Future<List<Exams>> fetchAllExams() async {
    final database = await DatabaseService().database;
    final exams = await database.rawQuery(
      '''
      SELECT * FROM $tableExams 
    ''',
    );

    return exams.map((exam) => Exams.fromSqfliteDatabase(exam)).toList();
  }

  Future<Users> fetchByUserId(int user_id) async {
    final database = await DatabaseService().database;
    final user = await database.rawQuery('''
        SELECT * FROM $tableUsers WHERE user_id
         = ?
      ''', [user_id]);

    return Users.fromSqfliteDatabase(user.first);
  }

  Future<Users> fetchByEmail(String email) async {
    final database = await DatabaseService().database;
    final user = await database.rawQuery('''
        SELECT * FROM $tableUsers WHERE email = ?
      ''', [email]);

    return Users.fromSqfliteDatabase(user.first);
  }

  Future<int> updateUser({String? email, required int user_id}) async {
    final database = await DatabaseService().database;
    return await database.update(
      tableUsers,
      {if (email != null) 'email': email},
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [user_id],
    );
  }

  Future<void> deleteUser(int user_id) async {
    final database = await DatabaseService().database;
    await database.rawDelete('''
        DELETE FROM $tableUsers WHERE user_id = ?
      ''', [user_id]);
  }

  Future<void> deleteExam(int exam_id) async {
    final database = await DatabaseService().database;
    await database.rawDelete('''
        DELETE FROM $tableExams WHERE exam_id = ?
      ''', [exam_id]);
  }
}
