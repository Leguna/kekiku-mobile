import 'dart:convert';

import '../../core/data_sources/json_from_assets.dart';
import '../../gen/assets.gen.dart';

class NotificationLocalSource {
  Future<String> getNotifications() async {
    final json = jsonDecode(await getJson(Assets.jsons.notification));
    return jsonEncode(json);
  }
}
