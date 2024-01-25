class Exams {
  final int user_id;
  final int? exam_id;
  final String exam_name;
  final double exam_score;
  final int exam_form;
  final int exam_type;
  final int exam_ques;
  final DateTime? created_at;

  Exams({
    required this.user_id,
    this.exam_id,
    required this.exam_name,
    required this.exam_score,
    required this.exam_form,
    required this.exam_type,
    required this.exam_ques,
    this.created_at,
  });

  factory Exams.fromSqfliteDatabase(Map<String, dynamic> map) => Exams(
        user_id: map['user_id']?.toInt() ?? 0,
        exam_id: map['exam_id']?.toInt() ?? 0,
        exam_name: map['exam_name'] ?? '',
        exam_score: map['score']?.toDouble() ?? 10.0,
        exam_form: map['exam_form']?.toInt() ?? 50,
        exam_type: map['exam_type']?.toInt() ?? 1,
        exam_ques: map['exam_ques']?.toInt() ?? 50,
        created_at: DateTime.parse(map['created_at'] ?? ''),
      );

  @override
  String toString() {
    return 'Exam('
        '\nuser_id: $user_id,'
        '\nexam_id: $exam_id,'
        '\nexam_name: $exam_name,'
        '\nscore: $exam_score,'
        '\nexam_form: $exam_form,'
        '\nexam_type: $exam_type,'
        '\nexam_ques: $exam_ques,'
        '\ncreated_at: $created_at'
        '\n)';
  }
}
