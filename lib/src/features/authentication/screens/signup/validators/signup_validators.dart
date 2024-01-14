class SignUpValidators {
  static String? validateName(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required.';
    } else if (value.trim().length < 2) {
      return '$fieldName must have at least 2 characters.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email or phone number.';
    }

    RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email format.';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number.';
    }

    RegExp phoneRegex = RegExp(r'^[0-9]+$');

    if (!phoneRegex.hasMatch(value)) {
      return 'Invalid phone number format.';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    RegExp passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+{}|<>?]).{6,}$');

    if (!passwordRegex.hasMatch(value)) {
      return 'Password must be at least 6 characters.';
    }

    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value != password) {
      return 'Passwords do not match.';
    }

    return null;
  }
}