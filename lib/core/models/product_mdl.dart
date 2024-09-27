import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_mdl.freezed.dart';
part 'product_mdl.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    String? id,
    String? name,
    int? price,
    List<String>? categories,
    String? tag,
    String? description,
    String? image,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  factory Product.fromJsonString(String jsonString) =>
      _$ProductFromJson(json.decode(jsonString));

}
