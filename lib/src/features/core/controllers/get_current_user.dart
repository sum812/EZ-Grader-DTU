import 'package:firebase_auth/firebase_auth.dart';

class GetCurrentUser {
  static User? GetInfo() {
    final _auth = FirebaseAuth.instance;
    return _auth.currentUser;
  }
}