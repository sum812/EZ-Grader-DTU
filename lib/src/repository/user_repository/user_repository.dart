import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ez_grader/src/features/authentication/models/users_model.dart';
import 'package:ez_grader/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../databases/ez_grader_db.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UsersModel user) async {
    final emailExists = await _db.collection("users").where("email", isEqualTo: user.email).get();

    if (emailExists.docs.isNotEmpty) {
      Get.offAll(() => SplashScreen());
      return;
    }

    // add to local data
    final ezGradeDB = EZGradeDB();
    await ezGradeDB.createUser(email: user.email);

    // add to firebase
    await _db
        .collection("users")
        .add(user.toJson())
        .whenComplete(() => Get.snackbar(
              'Success',
              'Your account has been created',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green,
            ))
        .catchError((error, stackTrace) {
      print(error.toString());
    });
  }

  Future<UsersModel> getUserDetails(String email) async {
    final snapshot = await _db.collection("users").where("email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UsersModel.formSnapshot(e)).single;
    return userData;
  }

  Future<List<UsersModel>> getAllUser() async {
    final snapshot = await _db.collection("users").get();
    final userData = snapshot.docs.map((e) => UsersModel.formSnapshot(e)).toList();
    return userData;
  }
}
