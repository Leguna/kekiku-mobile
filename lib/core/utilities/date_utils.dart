import 'package:intl/intl.dart';

extension DatetimeUtils on DateTime {
  String toDateString() {
    return DateFormat('dd MMM yyyy').format(this);
  }
}
