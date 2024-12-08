import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class SecureStorageManager {
  final _storage = const FlutterSecureStorage();

  static const tokenKey = 'token';
  static const refreshTokenKey = 'refresh_token';
  static const accessTokenKey = 'access_token';
  static const fingerprintKey = 'fingerprint';

  Future<void> writeData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> readData(String key) async {
    return await _storage.read(key: key);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: tokenKey);
  }

  Future<void> setToken(String token) async {
    await _storage.write(key: tokenKey, value: token);
  }

  Future<void> deleteData(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
