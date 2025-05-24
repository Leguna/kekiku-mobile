import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kekiku/cart/models/cart_item_mdl.dart';

import '../index.dart';

part 'transaction_mdl.freezed.dart';
part 'transaction_mdl.g.dart';

@freezed
sealed class Transaction with _$Transaction {
  const factory Transaction({
    @Default('') String id,
    double? amount,
    @Default(0) int quantity,
    @Default("") String date,
    @JsonKey(fromJson: _typeFromJson, toJson: _typeToJson)
    @Default(TransactionType.none)
    TransactionType type,
    String? description,
    @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
    @Default(TransactionStatus.none)
    TransactionStatus status,
    String? userId,
    String? userName,
    Address? destinationAddress,
    @JsonKey(fromJson: _productListFromJson, toJson: _productListToJson)
    @Default([])
    List<CartItem> products,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  factory Transaction.fromJsonString(String jsonString) =>
      _$TransactionFromJson(json.decode(jsonString));
}

TransactionType _typeFromJson(String? type) {
  if (type == null) return TransactionType.none;
  return TransactionType.values.firstWhere(
      (e) => e.toString().split('.').last == type,
      orElse: () => TransactionType.other);
}

String _typeToJson(TransactionType? type) {
  if (type == null) return '';
  return type.value;
}

TransactionStatus _statusFromJson(String? status) {
  if (status == null) return TransactionStatus.none;
  return TransactionStatus.values.firstWhere(
      (e) => e.toString().split('.').last == status,
      orElse: () => TransactionStatus.completed);
}

String _statusToJson(TransactionStatus? status) {
  if (status == null) return '';
  return status.value;
}

List<CartItem> _productListFromJson(List<dynamic>? jsonList) {
  if (jsonList == null) return [];
  return jsonList
      .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
      .toList();
}

extension TransactionExtension on Transaction {
  TransactionStatus get transactionStatus {
    return TransactionStatus.values.firstWhere(
        (e) => e.toString().split('.').last == status,
        orElse: () => TransactionStatus.completed);
  }

  TransactionType get transactionType {
    return TransactionType.values.firstWhere(
        (e) => e.toString().split('.').last == type,
        orElse: () => TransactionType.other);
  }

  String getPrice() {
    return amount?.toCurrency() ?? '';
  }

  String getType() {
    return type.capitalize();
  }

  String getStatus() {
    return status.capitalize();
  }

  Color getStatusColor() {
    return mapStatusColor[status.value] ?? Colors.grey;
  }

  IconData getTypeIconData() {
    return mapTypeIcon[type.value] ?? Icons.shopping_bag;
  }
}

List<Map<String, dynamic>> _productListToJson(List<CartItem> products) {
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
  processing,
  completed,
  cancelled,
  ongoing,
}

extension TransactionTypeExtension on TransactionType {
  String get value => mapTypeTransactionString[this] ?? '';

  String get text {
    if (value.isEmpty) return 'All Type';
    return value.capitalize();
  }

  String capitalize() {
    return value.isEmpty ? '' : value[0].toUpperCase() + value.substring(1);
  }
}

extension TransactionStatusExtension on TransactionStatus {
  String get value => mapStatusTransactionString[this] ?? '';

  String get text {
    if (value.isEmpty) return 'All Status';
    return value.capitalize();
  }

  String capitalize() {
    return value.isEmpty ? '' : value[0].toUpperCase() + value.substring(1);
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
  TransactionStatus.processing: 'processing',
  TransactionStatus.completed: 'completed',
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
  "completed": Colors.green,
  "processing": Colors.blue,
  "cancelled": Colors.red,
  "ongoing": Colors.yellow,
};
