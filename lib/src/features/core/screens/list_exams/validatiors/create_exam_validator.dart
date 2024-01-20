class CreateExamValidator {
  static String? validateExamName(String value)  {
    if (value.isEmpty) {
      return 'Exam name cannot be empty';
    }
    if (value.length <= 2) {
      return 'Exam name length should be at least 3 characters';
    }

    return null;
  }

  static String? validateExamScore(String value) {
    if (double.tryParse(value) == null || double.parse(value) < 0) {
      return 'Exam score must be a non-negative number';
    }
    return null;
  }

  static String? validateNumOfQuestions(String value, String selectedForm) {
    int? numQuestions = int.tryParse(value);
    if (numQuestions == null || numQuestions < 0) {
      return 'Number of questions must be a non-negative integer';
    }

    if (selectedForm == 'Form 20' && numQuestions > 20) {
      return 'Number of questions cannot exceed 20 for Form 20';
    } else if (selectedForm == 'Form 20' && numQuestions > 40) {
      return 'Number of questions cannot exceed 40 for Form 40';
    } else if (selectedForm == 'Form 50' && numQuestions > 50) {
      return 'Number of questions cannot exceed 50 for Form 50';
    } else if (selectedForm == 'Form 60' && numQuestions > 60) {
      return 'Number of questions cannot exceed 60 for Form 60';
    } else if (selectedForm == 'Form 100' && numQuestions > 100) {
      return 'Number of questions cannot exceed 100 for Form 100';
    } else if (selectedForm == 'Form 120' && numQuestions > 120) {
      return 'Number of questions cannot exceed 120 for Form 120';
    }

    return null;
  }
}
