import '../index.dart';

Future<String> getJson(String path) async {
  String data = await rootBundle.loadString(path);
  return (data);
}
