import 'package:cloud_firestore/cloud_firestore.dart';

class UsersModel {
  final String? id;
  final String email;
  final String phone;
  final String first_name;
  final String last_name;
  final String password;
  final String? exams_id;

  UsersModel({
    this.id,
    this.exams_id,
    required this.email,
    required this.phone,
    required this.password,
    required this.first_name,
    required this.last_name,
  });

  toJson() {
    return {
      "email": email,
      "phone": phone,
      "first_name": first_name,
      "last_name": last_name,
      "password": password,
    };
  }

  factory UsersModel.formSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return UsersModel(
      id: document.id,
      email: data?["email"],
      phone: data?["phone"],
      password: data?["password"],
      first_name: data?["first_name"],
      last_name: data?["last_name"],
    );
  }
}
