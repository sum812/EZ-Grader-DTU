import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ez_grader/src/features/authentication/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance =>
      Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UsersModel user) async {
    final emailExists = await _db
        .collection("users")
        .where("email", isEqualTo: user.email)
        .get();

    if (emailExists.docs.isNotEmpty) {
      return;
    }

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
      Get.snackbar('Error', 'Something went wrong. Try again',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }
}
