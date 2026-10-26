class PhoneInputValidator {
  const PhoneInputValidator();

  static final _pattern = RegExp(r'^9\d{9}$');

  static bool validate(String value) {
    final digits = value.replaceAll(RegExp(r'\D'), '');
    return _pattern.hasMatch(digits);
  }
}
