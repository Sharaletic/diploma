class PinCodeValidator {
  const PinCodeValidator();

  static bool validate(String value) {
    return RegExp(r'^\d{6}$').hasMatch(value);
  }
}
