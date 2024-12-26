// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_mdl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      id: json['id'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble(),
      date: json['date'] as String?,
      type: json['type'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      userId: json['userId'] as String?,
      userName: json['userName'] as String?,
      destinationAddress: json['destinationAddress'] == null
          ? null
          : Address.fromJson(
              json['destinationAddress'] as Map<String, dynamic>),
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'date': instance.date,
      'type': instance.type,
      'description': instance.description,
      'status': instance.status,
      'userId': instance.userId,
      'userName': instance.userName,
      'destinationAddress': instance.destinationAddress,
      'product': instance.product,
    };
