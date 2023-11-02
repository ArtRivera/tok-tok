import 'package:intl/intl.dart';

class NumberFormatManager {
  static String readableFormat(int number) {
    return NumberFormat.compact(locale: 'en').format(number);
  }
}
