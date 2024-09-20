import 'package:flutter_dotenv/flutter_dotenv.dart';

final class Config {
  static const int parentRoleId = 1;
  static const String taskNameChat = 'chats-task-';
  static const List<String> listPageName = [
    pageNameHome,
    pageNameFeeds,
    pageNamePelanggaran,
    pageNameKesehatan,
    pageNameChat,
    pageNameSetting
  ];
  static var listPageNameWithoutPelanggaran = [
    pageNameHome,
    pageNameFeeds,
    pageNameChat,
    pageNameSetting
  ];

  static const pageNameHome = '';
  static const pageNameFeeds = 'FEEDS';
  static const pageNamePelanggaran = 'PELANGGARAN SISWA';
  static const pageNameKesehatan = 'KESEHATAN SISWA';
  static const pageNameChat = 'CHAT';
  static const pageNameSetting = 'SETTING';

  static const reminderDelayInDays = 7;

  static String get baseUrl {
    final flavor = Flavors.getCurrentFlavor;
    switch (flavor) {
      case FlavorType.dev:
        return dotenv.env['DEV_BASE_URL'] ?? '';
      case FlavorType.staging:
      case FlavorType.production:
        return dotenv.env['BASE_URL'] ??
            dotenv.env['DEV_BASE_URL'] ??
            dotenv.env['MOCK_URL'] ??
            '';
      default:
        return dotenv.env['MOCK_URL'] ?? '';
    }
  }
}

final class Flavors {
  static const String dev = 'dev';
  static const String staging = 'staging';
  static const String production = 'production';

  Flavors(FlavorType flavor) {
    currentFlavor = flavor;
  }

  static const Map<String, FlavorType> appFlavor = {
    dev: FlavorType.dev,
    staging: FlavorType.staging,
    production: FlavorType.production,
  };

  static const List<String> appFlavorList = [
    dev,
    staging,
    production,
  ];

  static FlavorType currentFlavor = FlavorType.dev;

  static FlavorType get getCurrentFlavor {
    currentFlavor = appFlavor[dotenv.env['FLAVOR']] ?? FlavorType.dev;
    return currentFlavor;
  }

  static const Map<String, String> appFlavorColor = {
    dev: '0xFFff0000',
    staging: '0xFFff00ff',
    production: '0xFF00ff00',
  };
}

enum FlavorType {
  dev,
  staging,
  production,
}
