import 'dart:js_interop';

class UsersModel {
  final String? user_id;
  final String email;
  final String phone;
  final String first_name;
  final String last_name;
  final String? image;
  final String password;
  final String? exams_id;

  const UsersModel({
    this.user_id,
    this.image,
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
}