// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get loginTitle => 'Sign In or create your account';

  @override
  String get phoneLoginDescription =>
      'Enter your phone number to continue. We will send a verification code to this number for sign-in or registration. Make sure you have access to the number provided';

  @override
  String get phoneNumberHint => 'Enter phone number';

  @override
  String get phoneNumberExample => '+71234567890';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get personalDataConsent =>
      'I agree to the processing of personal data';

  @override
  String get getCode => 'Get code';

  @override
  String get enterVerificationCode =>
      'Enter the code sent to the specified phone number';

  @override
  String resendCodeIn(String time) {
    return 'Get a new code in $time';
  }

  @override
  String get resendCode => 'Get a new code';

  @override
  String get continueButton => 'Continue';

  @override
  String get useAnotherPhoneNumber => 'Use another phone number';

  @override
  String invalidCodeAttemptsRemaining(int attempts) {
    return 'Incorrect code. Attempts remaining: $attempts';
  }

  @override
  String tooManyAttemptsCallAvailableIn(String time) {
    return 'Too many attempts. You can request a new call in $time';
  }

  @override
  String get start => 'Start';
}
