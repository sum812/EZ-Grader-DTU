class AddManuallyValidator {
  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Cannot be empty';
    }

    try {
      int intValue = int.parse(value);
      if (intValue < 0) {
        return 'Not less than 0.';
      } else if (intValue > 999) {
        return 'No more than 999';
      }
    } catch (e) {
      return 'Please enter an integer value.';
    }

    return null;
  }
}