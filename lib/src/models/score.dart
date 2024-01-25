class Score {
  final int user_id;
  final int exam_id;
  final String student_code;
  final double student_score;
  final String image;

  Score({
    required this.user_id,
    required this.exam_id,
    required this.student_code,
    required this.student_score,
    required this.image,
  });

  factory Score.fromSqfliteDatabase(Map<String, dynamic> map) => Score(
    user_id: map['user_id']?.toInt() ?? 0,
    exam_id: map['exam_id']?.toInt() ?? 0,
    student_code: map['student_code'] ?? '######',
    student_score: map['student_score']?.toDouble() ?? 0,
    image: map['image'] ?? '',
  );

  @override
  String toString() {
    return 'Score('
        '\nuser_id: $user_id,'
        '\nexam_id: $exam_id,'
        '\nstudent_code: $student_code,'
        '\nstudent_score: $student_score,'
        '\nimage: $image'
        '\n)';
  }
}
