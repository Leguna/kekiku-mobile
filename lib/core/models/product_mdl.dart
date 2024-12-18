import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_mdl.freezed.dart';
part 'product_mdl.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    @Default('') String id,
    String? name,
    String? label,
    double? price,
    String? description,
    @Default([]) List<String>? tags,
    @Default([]) List<String>? ingredients,
    @Default(0) double discount,
    @Default(0) double? rating,
    @Default(0) int stock,
    @Default(0) int sold,
    @Default(false) bool isFavorite,
    String? video,
    String? image,
    String? address,
    @Default([]) List<String>? categories,
    @JsonKey(fromJson: _variantListFromJson, toJson: _variantListToJson)
    @Default([])
    List<Variant> variants,
    String? tag,
  }) = _Product;

  const Product._();

  double get discountedPrice => (price ?? 0) * (1 - discount / 100);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  factory Product.fromJsonString(String jsonString) =>
      _$ProductFromJson(json.decode(jsonString));
}

List<Variant> _variantListFromJson(List<dynamic>? jsonList) {
  if (jsonList == null) return [];
  return jsonList
      .map((e) => Variant.fromJson(e as Map<String, dynamic>))
      .toList();
}

List<Map<String, dynamic>> _variantListToJson(List<Variant>? variants) {
  if (variants == null) return [];
  return variants.map((e) => e.toJson()).toList();
}

@freezed
class Variant with _$Variant {
  const factory Variant({
    @Default('') String id,
    String? name,
    double? price,
    int? stock,
    String? image,
  }) = _Variant;

  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);
}
