import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ez_grader/src/features/authentication/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance =>
      Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UsersModel user) async{
    await _db
        .collection("user")
        .add(user.toJson())
        .whenComplete(() => Get.snackbar(
              'Success',
              'You account has been created',
              snackPosition: SnackPosition.TOP,
              backgroundColor:
                  Colors.green.withOpacity(0.1),
              colorText: Colors.green,
            ),
    ).catchError((error, stackTrace) {
      Get.snackbar('Error', 'Something went wrong. Try again',
       snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,);
      print(error.toString());
    });
  }
}
