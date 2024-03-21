import 'package:intl/intl.dart';

class DateHelper {
  static String ddMMYYYY(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static String ddMMYYYYHHMMSS(DateTime date) {
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(date);
  }

  static String YYYYMMdd(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static DateTime parse(String date) {
    return DateFormat('dd/MM/yyyy HH:mm:ss').parse(date);
  }

  static DateTime parseExtra(String date) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSSZ').parse(date);
  }
}
