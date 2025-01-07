import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../index.dart';

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
    @JsonKey(fromJson: _productListFromJson, toJson: _productListToJson)
    @Default([])
    List<Product> products,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  factory Transaction.fromJsonString(String jsonString) =>
      _$TransactionFromJson(json.decode(jsonString));
}

List<Product> _productListFromJson(List<dynamic>? jsonList) {
  if (jsonList == null) return [];
  return jsonList
      .map((e) => Product.fromJson(e as Map<String, dynamic>))
      .toList();
}

extension TransactionExtension on Transaction {
  String getPrice() {
    return amount?.toCurrency() ?? '';
  }

  String getType() {
    return mapTypeTransaction[type ?? ''] ?? '';
  }

  String getStatus() {
    return mapStatusTransaction[status ?? ''] ?? '';
  }

  Color getStatusColor() {
    return mapStatusColor[status ?? ''] ?? Colors.grey;
  }

  IconData getTypeIconData() {
    return mapTypeIcon[type ?? ''] ?? Icons.shopping_bag;
  }
}

List<Map<String, dynamic>> _productListToJson(List<Product> products) {
  return products.map((e) => e.toJson()).toList();
}

const Map<String, String> mapTypeTransaction = {
  'purchase': 'Purchase',
  "gift": "Gift",
  'payment': 'Payment',
  'refund': 'Refund',
  'other': 'Other',
};

const Map<String, IconData> mapTypeIcon = {
  'purchase': Icons.shopping_cart,
  "gift": Icons.card_giftcard,
  'payment': Icons.payment,
  'refund': Icons.refresh,
  'other': Icons.shopping_bag,
};

const Map<String, String> mapStatusTransaction = {
  "pending": "Pending",
  "processing": "Processing",
  "completed": "Completed",
  "failed": "Failed",
  "cancelled": "Cancelled",
  "ongoing": "Ongoing",
};

const Map<String, Color> mapStatusColor = {
  "pending": Colors.orange,
  "completed": Colors.green,
  "failed": Colors.red,
  "cancelled": Colors.red,
  "ongoing": Colors.yellow,
};
