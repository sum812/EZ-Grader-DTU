class Users {
  final int? user_id;
  final String email;

  Users({
    required this.email,
    this.user_id,
  });

  factory Users.fromSqfliteDatabase(Map<String, dynamic> map) => Users(
        user_id: map['user_id']?.toInt() ?? 0,
        email: map['email'] ?? '',
      );

  @override
  String toString() {
    return 'Users(user_id: $user_id, email: $email)';
  }
}
