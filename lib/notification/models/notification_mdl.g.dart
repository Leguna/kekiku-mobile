// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_mdl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Notification _$NotificationFromJson(Map<String, dynamic> json) =>
    _Notification(
      notificationId: json['notificationId'] as String? ?? '',
      title: json['title'] as String?,
      body: json['body'] as String?,
      type: json['type'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      read: json['read'] as bool? ?? false,
    );

Map<String, dynamic> _$NotificationToJson(_Notification instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'title': instance.title,
      'body': instance.body,
      'type': instance.type,
      'timestamp': instance.timestamp?.toIso8601String(),
      'data': instance.data,
      'read': instance.read,
    };

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
      orderId: json['orderId'] as String?,
      status: json['status'] as String?,
      estimatedDelivery: json['estimatedDelivery'] == null
          ? null
          : DateTime.parse(json['estimatedDelivery'] as String),
      cartItems: (json['cartItems'] as num?)?.toInt(),
      cartTotal: json['cartTotal'] as String?,
    );

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
      'orderId': instance.orderId,
      'status': instance.status,
      'estimatedDelivery': instance.estimatedDelivery?.toIso8601String(),
      'cartItems': instance.cartItems,
      'cartTotal': instance.cartTotal,
    };
