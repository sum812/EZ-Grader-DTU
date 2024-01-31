class Answers {
  final int? answer_id;
  final int user_id;
  final int exam_id;
  final int exam_type;
  final int exam_code;
  final String? multiple_answer;
  final String? short_ques1;
  final String? short_ques2;
  final String? short_ques3;
  final String? short_ques4;
  final String? short_ques5;
  final String? short_ans1;
  final String? short_ans2;
  final String? short_ans3;
  final String? short_ans4;
  final String? short_ans5;

  Answers({
    this.answer_id,
    required this.user_id,
    required this.exam_id,
    required this.exam_type,
    required this.exam_code,
    this.multiple_answer,
    this.short_ques1,
    this.short_ques2,
    this.short_ques3,
    this.short_ques4,
    this.short_ques5,
    this.short_ans1,
    this.short_ans2,
    this.short_ans3,
    this.short_ans4,
    this.short_ans5,
  });

  factory Answers.fromSqfliteDatabase(Map<String, dynamic> map) => Answers(
      answer_id: map['answer_id']?.toInt() ?? -1,
      user_id: map['user_id']?.toInt() ?? -1,
      exam_id: map['exam_id']?.toInt() ?? -1,
      exam_type: map['exam_type']?.toInt() ?? -1,
      exam_code: map['exam_code']?.toInt() ?? -1,
      multiple_answer: map['multiple_answer'] ?? '',
      short_ques1: map['short_ques1'] ?? '',
      short_ques2: map['short_ques2'] ?? '',
      short_ques3: map['short_ques3'] ?? '',
      short_ques4: map['short_ques4'] ?? '',
      short_ques5: map['short_ques5'] ?? '',
      short_ans1: map['short_ans1'] ?? '',
      short_ans2: map['short_ans2'] ?? '',
      short_ans3: map['short_ans3'] ?? '',
      short_ans4: map['short_ans4'] ?? '',
      short_ans5: map['short_ans5'] ?? '',
  );

  @override
  String toString() {
    return 'Answer('
        '\nanswer_id: $answer_id,'
        '\nuser_id: $user_id,'
        '\nexam_id: $exam_id,'
        '\nexam_type: $exam_type,'
        '\nexam_code: $exam_code,'
        '\nmultiple answer: $multiple_answer,'
        '\nshort question 1: $short_ques1,'
        '\nshort question 2: $short_ques2,'
        '\nshort question 3: $short_ques3,'
        '\nshort question 4: $short_ques4,'
        '\nshort question 5: $short_ques5,'
        '\nshort answer 1: $short_ans1,'
        '\nshort answer 2: $short_ans2,'
        '\nshort answer 3: $short_ans3,'
        '\nshort answer 4: $short_ans4,'
        '\nshort answer 5: $short_ans5,'
        '\n)';
  }
}
