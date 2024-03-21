import 'package:logger/logger.dart';

class ILogger {
  static Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );

  static void debug(String message) {
    logger.d(message);
  }

  static void error(String message) {
    logger.e(message);
  }

  static void info(String message) {
    logger.i(message);
  }

  static void warning(String message) {
    logger.w(message);
  }
}
