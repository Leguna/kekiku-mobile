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
  TransactionStatus get transactionStatus {
    if (status == null) return TransactionStatus.none;
    return TransactionStatus.values.firstWhere(
        (e) => e.toString().split('.').last == status,
        orElse: () => TransactionStatus.completed);
  }

  TransactionType get transactionType {
    if (type == null) return TransactionType.none;
    return TransactionType.values.firstWhere(
        (e) => e.toString().split('.').last == type,
        orElse: () => TransactionType.other);
  }

  String getPrice() {
    return amount?.toCurrency() ?? '';
  }

  String getType() {
    return (type ?? '').capitalize();
  }

  String getStatus() {
    return (status ?? '').capitalize();
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

enum TransactionType {
  none,
  purchase,
  gift,
  payment,
  refund,
  other,
}

enum TransactionStatus {
  none,
  pending,
  processing,
  completed,
  failed,
  cancelled,
  ongoing,
}

extension TransactionTypeExtension on TransactionType {
  String get value => mapTypeTransactionString[this] ?? '';

  String get text {
    if (value.isEmpty) return 'All Type';
    return value.capitalize();
  }
}

extension TransactionStatusExtension on TransactionStatus {
  String get value => mapStatusTransactionString[this] ?? '';

  String get text {
    if (value.isEmpty) return 'All Status';
    return value.capitalize();
  }
}

const Map<TransactionType, String> mapTypeTransactionString = {
  TransactionType.none: '',
  TransactionType.purchase: 'purchase',
  TransactionType.gift: 'gift',
  TransactionType.payment: 'payment',
  TransactionType.refund: 'refund',
  TransactionType.other: 'other',
};

const Map<TransactionStatus, String> mapStatusTransactionString = {
  TransactionStatus.none: '',
  TransactionStatus.pending: 'pending',
  TransactionStatus.processing: 'processing',
  TransactionStatus.completed: 'completed',
  TransactionStatus.failed: 'failed',
  TransactionStatus.cancelled: 'cancelled',
  TransactionStatus.ongoing: 'ongoing',
};

const Map<String, IconData> mapTypeIcon = {
  'purchase': Icons.shopping_cart,
  "gift": Icons.card_giftcard,
  'payment': Icons.payment,
  'refund': Icons.refresh,
  'other': Icons.shopping_bag,
};

const Map<String, Color> mapStatusColor = {
  "pending": Colors.orange,
  "completed": Colors.green,
  "failed": Colors.red,
  "cancelled": Colors.red,
  "ongoing": Colors.yellow,
};
