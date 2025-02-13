import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/index.dart';

part 'cart_mdl.freezed.dart';
part 'cart_mdl.g.dart';

@freezed
class Cart with _$Cart {
  const factory Cart({required List<Product> products}) = _Cart;

  const factory Cart.empty() = _Empty;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  factory Cart.fromJsonString(String jsonString) =>
      _$CartFromJson(json.decode(jsonString));
}
