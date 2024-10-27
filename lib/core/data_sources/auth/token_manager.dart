import 'dart:convert';
import 'dart:math';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageManager {
  final _storage = const FlutterSecureStorage();

  static const _tokenKey = 'token';
  static const refreshTokenKey = 'refresh_token';
  static const accessTokenKey = 'access_token';
  static const fingerPrintKey = 'fingerprint';

  Future<void> writeData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> readData(String key) async {
    return await _storage.read(key: key);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> setToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<void> deleteData(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  String generateKey({int length = 32}) {
    final random = Random.secure();
    final values = List<int>.generate(length, (i) => random.nextInt(256));
    writeData(fingerPrintKey, base64UrlEncode(values));
    return base64Url.encode(values);
  }
}
