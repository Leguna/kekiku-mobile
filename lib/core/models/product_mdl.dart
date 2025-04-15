import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_mdl.freezed.dart';
part 'product_mdl.g.dart';

@freezed
sealed class Product with _$Product {
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
    @Default(Address()) Address? address,
    @Default([]) List<String>? categories,
    @JsonKey(fromJson: _variantListFromJson, toJson: _variantListToJson)
    @Default([])
    List<Variant> variants,
    @JsonKey(fromJson: _reviewListFromJson, toJson: _reviewListToJson)
    @Default([])
    List<Review> reviews,
  }) = _Product;

  const Product._();

  double get discountedPrice => (price ?? 0) * (1 - discount / 100);

  int get totalReviews => reviews.length;

  double get averageRating {
    if (reviews.isEmpty) return 0;
    return reviews.map((e) => e.rating ?? 0).reduce((a, b) => a + b) /
        reviews.length;
  }

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

List<Review> _reviewListFromJson(List<dynamic>? jsonList) {
  if (jsonList == null) return [];
  return jsonList
      .map((e) => Review.fromJson(e as Map<String, dynamic>))
      .toList();
}

List<Map<String, dynamic>> _reviewListToJson(List<Review>? reviews) {
  if (reviews == null) return [];
  return reviews.map((e) => e.toJson()).toList();
}

@freezed
sealed class Variant with _$Variant {
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

@freezed
sealed class Review with _$Review {
  const factory Review({
    @Default('') String id,
    String? name,
    double? rating,
    String? comment,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

@freezed
sealed class Address with _$Address {
  const factory Address({
    @Default(0.0) double? lat,
    @Default(0.0) double? long,
    @Default('') String? name,
    @Default('') String? physicalAddress,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

class MyJsonConverter extends JsonConverter<Address, Map<String, dynamic>> {
  const MyJsonConverter();

  @override
  Address fromJson(Map<String, dynamic> json) {
    return Address.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Address object) {
    return object.toJson();
  }
}
