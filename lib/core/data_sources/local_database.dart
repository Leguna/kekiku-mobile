// Hive
import 'package:hive/hive.dart';

const String mainBox = 'local_database';
const String roleKey = 'role';
const String roleNameKey = 'roleName';

const String userDataBox = 'userDataBox';
const String userDataKey = 'userData';
const String usernameKey = 'username';
const String lastLoginKey = 'lastLogin';
const String chatNotifKey = 'chatNotifSetting';
const String otherNotifKey = 'otherNotifSetting';

const String firstTimeKey = 'firstTime';

const tokenKey = 'token';

class LocalDatabase {
  Future<String?> getUserData() async =>
      await getString(userDataKey, boxKey: userDataBox);

  Future<String?> getString(String key, {String boxKey = mainBox}) async {
    final box = await Hive.openBox(boxKey);
    return box.get(key) as String?;
  }

  Future<void> setString(String key, String? value,
      {String boxKey = mainBox}) async {
    final box = await Hive.openBox(boxKey);
    await box.put(key, value);
  }

  Future<int?> getInt(String key, {String boxKey = mainBox}) async {
    final box = await Hive.openBox(boxKey);
    return box.get(key) as int?;
  }

  Future<void> setInt(String key, int? value, {String boxKey = mainBox}) async {
    final box = await Hive.openBox(boxKey);
    await box.put(key, value);
  }

  Future<bool?> getBool(
    String key, {
    String boxKey = mainBox,
  }) async {
    final box = await Hive.openBox(boxKey);
    return (box.get(key)) as bool?;
  }

  Future<void> setBool(
    String key,
    bool? value, {
    String boxKey = mainBox,
  }) async {
    final box = await Hive.openBox(boxKey);
    await box.put(key, value);
  }

  Future<double?> getDouble(String key, {String boxKey = mainBox}) async {
    final box = await Hive.openBox(boxKey);
    return box.get(key) as double?;
  }

  Future<void> setDouble(String key, double? value,
      {String boxKey = mainBox}) async {
    final box = await Hive.openBox(boxKey);
    await box.put(key, value);
  }

  Future<void> clearKey(String key, {String boxKey = mainBox}) async {
    final box = await Hive.openBox(boxKey);
    await box.delete(key);
  }

  Future<void> clearBox({String boxKey = mainBox}) async {
    final box = await Hive.openBox(boxKey);
    await box.clear();
  }

  Future<String?> getToken() async =>
      await getString(tokenKey, boxKey: userDataBox);

  Future<void> setToken(String token) async =>
      await setString(tokenKey, token, boxKey: userDataBox);
}
