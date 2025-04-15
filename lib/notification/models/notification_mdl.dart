import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_mdl.freezed.dart';
part 'notification_mdl.g.dart';

List<NotificationMdl> notificationFromJson(String str) =>
    List<NotificationMdl>.from(
        json.decode(str).map((x) => NotificationMdl.fromJson(x)));

String notificationToJson(List<NotificationMdl> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
sealed class NotificationMdl with _$NotificationMdl {
  const factory NotificationMdl({
    @Default('') String notificationId,
    String? title,
    String? body,
    String? type,
    DateTime? timestamp,
    Data? data,
    @Default(false) bool read,
  }) = _Notification;

  factory NotificationMdl.fromJson(Map<String, dynamic> json) =>
      _$NotificationMdlFromJson(json);
}

@freezed
sealed class Data with _$Data {
  const factory Data({
    String? orderId,
    String? status,
    DateTime? estimatedDelivery,
    int? cartItems,
    String? cartTotal,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
