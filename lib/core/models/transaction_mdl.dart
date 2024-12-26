import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'product_mdl.dart';

part 'transaction_mdl.freezed.dart';
part 'transaction_mdl.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    @Default('') String id,
    double? amount,
    String? date,
    String? type,
    String? description,
    String? status,
    String? userId,
    String? userName,
    Address? destinationAddress,
    Product? product,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  factory Transaction.fromJsonString(String jsonString) =>
      _$TransactionFromJson(json.decode(jsonString));
}

class MyJsonConverter extends JsonConverter<Transaction, Map<String, dynamic>> {
  const MyJsonConverter();

  @override
  Transaction fromJson(Map<String, dynamic> json) {
    return Transaction.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Transaction object) {
    return object.toJson();
  }
}
