// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get helloWorld => 'Привет, мир!';

  @override
  String get loginTitle => 'Войдите или создайте свой аккаунт';

  @override
  String get phoneLoginDescription =>
      'Введите номер телефона, чтобы продолжить. Мы отправим на него код подтверждения для входа или регистрации. Убедитесь, что у вас есть доступ к указанному номеру';

  @override
  String get phoneNumberHint => 'Введите номер телефона';

  @override
  String get phoneNumberExample => '+71234567890';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get personalDataConsent => 'Согласен с обработкой персональных данных';

  @override
  String get getCode => 'Получить код';

  @override
  String get enterVerificationCode =>
      'Введите код, отправленный на указанный номер телефона';

  @override
  String resendCodeIn(String time) {
    return 'Получить новый код через $time';
  }

  @override
  String get resendCode => 'Получить новый код';

  @override
  String get continueButton => 'Продолжить';

  @override
  String get useAnotherPhoneNumber => 'Использовать другой номер';

  @override
  String invalidCodeAttemptsRemaining(int attempts) {
    return 'Код неверный. Осталось попыток: $attempts';
  }

  @override
  String tooManyAttemptsCallAvailableIn(String time) {
    return 'Слишком много попыток. Заказать новый звонок можно через $time';
  }

  @override
  String get start => 'Начать';
}
