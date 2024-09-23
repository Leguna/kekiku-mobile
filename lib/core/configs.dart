import 'package:flutter_dotenv/flutter_dotenv.dart';

final class Config {
  static const int parentRoleId = 1;
  static const String taskNameChat = 'chats-task-';

  static const reminderDelayInDays = 7;

  static String get baseUrl {
    final flavor = Flavors.getCurrentFlavor;
    switch (flavor) {
      case FlavorType.dev:
        return dotenv.env['DEV_BASE_URL'] ?? '';
      case FlavorType.stage:
      case FlavorType.prod:
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
  static const String stage = 'stage';
  static const String prod = 'prod';

  Flavors(FlavorType flavor) {
    currentFlavor = flavor;
  }

  static const Map<String, FlavorType> appFlavor = {
    dev: FlavorType.dev,
    stage: FlavorType.stage,
    prod: FlavorType.prod,
  };

  static const List<String> appFlavorList = [
    dev,
    stage,
    prod,
  ];

  static FlavorType currentFlavor = FlavorType.dev;

  static FlavorType get getCurrentFlavor {
    currentFlavor = appFlavor[dotenv.env['FLAVOR']] ?? FlavorType.dev;
    return currentFlavor;
  }

  static const Map<String, String> appFlavorColor = {
    dev: '0xFFff0000',
    stage: '0xFFff00ff',
    prod: '0xFF00ff00',
  };
}

enum FlavorType {
  dev,
  stage,
  prod,
}
