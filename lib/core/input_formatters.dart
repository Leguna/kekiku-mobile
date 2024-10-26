import 'package:flutter/services.dart';

class InputFormatter {
  static FilteringTextInputFormatter emailOrPhone() {
    return FilteringTextInputFormatter.allow(
      RegExp(r'[0-9a-zA-Z@.]'),
    );
  }
}
