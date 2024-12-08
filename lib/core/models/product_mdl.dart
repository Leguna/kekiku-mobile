import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_mdl.freezed.dart';
part 'product_mdl.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    @Default('') String id,
    String? name,
    int? price,
    List<String>? categories,
    String? tag,
    String? description,
    String? image,
    @Default(0) double? rating,
    @Default(0) double? discount,
    @Default(0) int? stock,
    @Default(0) int? sold,
    String? label,
    String? address,
    @Default(false) bool isFavorite,
  }) = _Product;

  const Product._();

  double get discountedPrice => (price ?? 0) * (1 - (discount ?? 0) / 100);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  factory Product.fromJsonString(String jsonString) =>
      _$ProductFromJson(json.decode(jsonString));

  // Generate id random string
  static String generateId() =>
      DateTime.now().millisecondsSinceEpoch.toString();
}
