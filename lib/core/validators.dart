import 'strings.dart';

class Validators {
  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.requiredField;
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.requiredField;
    }
    if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
        .hasMatch(value)) {
      return Strings.invalidEmail;
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.requiredField;
    }
    if ((value.length) < 6) {
      return Strings.invalidPassword;
    }
    return null;
  }

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

  static bool isEmail(String value) {
    return RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(value);
  }
}
