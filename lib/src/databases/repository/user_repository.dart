import 'package:sqflite/sqflite.dart';

import '../../models/users.dart';
import '../database_service.dart';

class UsersRepository {
  final tableUsers = 'users';

  Future<bool> isEmailExists(String email) async {
    final database = await DatabaseService().database;
    final result = await database.rawQuery(
      '''
    SELECT EXISTS (
      SELECT 1 FROM $tableUsers WHERE email = ? LIMIT 1
    ) AS isExists
    ''',
      [email],
    );

    return Sqflite.firstIntValue(result) == 1;
  }

  Future<int> createUser({required String email}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableUsers (email) VALUES (?)
    ''', [email]);
  }

  Future<List<Users>> fetchAllUsers() async {
    final database = await DatabaseService().database;
    final users = await database.rawQuery('''
      SELECT * FROM $tableUsers
    ''');

    return users.map((user) => Users.fromSqfliteDatabase(user)).toList();
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
}