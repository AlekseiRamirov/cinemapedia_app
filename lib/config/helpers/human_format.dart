import 'package:intl/intl.dart';

class HumanFormat {
  static String number(double number) {
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
      locale: 'en_US',
    ).format(number);
    return formatterNumber;
  }

  static String numberDecimal(double number) {
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 1,
      symbol: '',
      locale: 'en_US',
    ).format(number);
    return formatterNumber;
  }
}
