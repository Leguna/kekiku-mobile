import 'dart:convert';

import 'package:flutter/services.dart';

getProducts() async {
  String data = await rootBundle.loadString('assets/products.json');
  return json.decode(data);
}
