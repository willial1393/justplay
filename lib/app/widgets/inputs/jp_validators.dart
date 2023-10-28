abstract class JpValidators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    final exp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if (!exp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    final exp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (!exp.hasMatch(value)) {
      return 'Please enter password with at least one uppercase '
          'letter, one lowercase letter, and one number';
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty || value.length < 3) {
      return 'Please enter a name';
    }
    return null;
  }
}
