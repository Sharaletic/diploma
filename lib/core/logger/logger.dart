import 'package:logger/logger.dart';

class LoggerSettings {
  static Logger initLogger() {
    final logger = Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
    );
    return logger;
  }
}

extension LoggerExtension on Logger {
  void debug(dynamic message) => log(.debug, message);

  void info(dynamic message) => log(.info, message);

  void error(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      log(.error, message, error: error, stackTrace: stackTrace);

  void severe(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      log(.error, message, error: error, stackTrace: stackTrace);
}
