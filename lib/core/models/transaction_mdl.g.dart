// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_mdl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Transaction _$TransactionFromJson(Map<String, dynamic> json) => _Transaction(
      id: json['id'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      date: json['date'] as String?,
      type: json['type'] == null
          ? TransactionType.none
          : _typeFromJson(json['type'] as String?),
      description: json['description'] as String?,
      status: json['status'] == null
          ? TransactionStatus.none
          : _statusFromJson(json['status'] as String?),
      userId: json['userId'] as String?,
      userName: json['userName'] as String?,
      destinationAddress: json['destinationAddress'] == null
          ? null
          : Address.fromJson(
              json['destinationAddress'] as Map<String, dynamic>),
      products: json['products'] == null
          ? const []
          : _productListFromJson(json['products'] as List?),
    );

Map<String, dynamic> _$TransactionToJson(_Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'quantity': instance.quantity,
      'date': instance.date,
      'type': _typeToJson(instance.type),
      'description': instance.description,
      'status': _statusToJson(instance.status),
      'userId': instance.userId,
      'userName': instance.userName,
      'destinationAddress': instance.destinationAddress,
      'products': _productListToJson(instance.products),
    };
