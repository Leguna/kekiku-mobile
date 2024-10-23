import 'strings.dart';

class Validators {
  static String? emailOrPhone(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.requiredField;
    }
    if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(value) &&
        !RegExp(r'^[0-9]{10,14}$').hasMatch(value)) {
      return Strings.invalidEmailOrPhone;
    }
    return null;
  }
}
