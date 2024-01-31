import 'package:sqflite/sqflite.dart';

class EZGradeDB {
  final tableUsers = 'users';
  final tableExams = 'exams';
  final tableAnswer = 'answer';
  final tableScore = 'score';

  Future<void> createTable(Database database) async {
    await database.execute('''
      CREATE TABLE $tableUsers (
        "user_id" INTEGER PRIMARY KEY AUTOINCREMENT,
        "email" TEXT
      );
    ''');

    await database.execute('''
      CREATE TABLE $tableExams (
        "user_id" INTEGER,
        "exam_id" INTEGER PRIMARY KEY AUTOINCREMENT,
        "exam_name" TEXT UNIQUE,
        "exam_score" REAL,
        "exam_form" INTEGER,
        "exam_type" INTEGER,
        "num_of_questions" INTEGER,
        "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY ("user_id") REFERENCES $tableUsers ("user_id") ON DELETE CASCADE ON UPDATE NO ACTION
      );
    ''');

    await database.execute('''
      CREATE TABLE $tableAnswer (
        "answer_id" INTEGER PRIMARY KEY AUTOINCREMENT,
        "user_id" INTEGER,
        "exam_id" INTEGER,
        "exam_type" INTEGER,
        "exam_code" INTEGER,
        "multiple_answer" TEXT,
        "short_ques1" TEXT,
        "short_ques2" TEXT,
        "short_ques3" TEXT,
        "short_ques4" TEXT,
        "short_ques5" TEXT,
        "short_ans1" TEXT,
        "short_ans2" TEXT,
        "short_ans3" TEXT,
        "short_ans4" TEXT,
        "short_ans5" TEXT,
        FOREIGN KEY ("user_id") REFERENCES $tableUsers ("user_id") ON DELETE CASCADE ON UPDATE NO ACTION,
        FOREIGN KEY ("exam_id") REFERENCES $tableExams ("exam_id") ON DELETE CASCADE ON UPDATE NO ACTION
      );
    ''');

    await database.execute('''
      CREATE TABLE $tableScore (
        "score_id" INTEGER PRIMARY KEY AUTOINCREMENT,
        "user_id" INTEGER,
        "exam_id" INTEGER,
        "student_code" TEXT,
        "student_score" REAL,
        "image" TEXT,
        FOREIGN KEY ("user_id") REFERENCES $tableUsers ("user_id") ON DELETE CASCADE ON UPDATE NO ACTION,
        FOREIGN KEY ("exam_id") REFERENCES $tableExams ("exam_id") ON DELETE CASCADE ON UPDATE NO ACTION            
      );
    ''');
  }
}
