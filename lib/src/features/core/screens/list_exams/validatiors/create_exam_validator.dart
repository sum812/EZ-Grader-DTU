class CreateExamValidator {
  static String? validateExamName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the exam name';
    }
    return null;
  }
}
