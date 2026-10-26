class AppConfig {
  const AppConfig();

  String get port => const String.fromEnvironment('PORT', defaultValue: '5050');

  static const int passwordMinLength = int.fromEnvironment(
    'PASSWORD_MIN_LENGTH',
    defaultValue: 8,
  );

  static const int passwordMaxLength = int.fromEnvironment(
    'PASSWORD_MAX_LENGTH',
    defaultValue: 32,
  );
}
