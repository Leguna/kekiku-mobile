import 'package:intl/intl.dart';

extension NumberUtils on double? {
  String toCurrency() {
    return NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$',
      decimalDigits: 2,
    ).format(this);
  }
}
