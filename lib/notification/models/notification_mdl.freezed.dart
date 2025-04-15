// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_mdl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
NotificationMdl _$NotificationMdlFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$NotificationMdl {
  String get notificationId;

  String? get title;

  String? get body;

  String? get type;

  DateTime? get timestamp;

  Data? get data;

  bool get read;

  /// Create a copy of NotificationMdl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationMdlCopyWith<NotificationMdl> get copyWith =>
      _$NotificationMdlCopyWithImpl<NotificationMdl>(
          this as NotificationMdl, _$identity);

  /// Serializes this NotificationMdl to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationMdl &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.read, read) || other.read == read));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, notificationId, title, body, type, timestamp, data, read);

  @override
  String toString() {
    return 'NotificationMdl(notificationId: $notificationId, title: $title, body: $body, type: $type, timestamp: $timestamp, data: $data, read: $read)';
  }
}

/// @nodoc
abstract mixin class $NotificationMdlCopyWith<$Res> {
  factory $NotificationMdlCopyWith(NotificationMdl value,
      $Res Function(NotificationMdl) _then) =
  _$NotificationMdlCopyWithImpl;
  @useResult
  $Res call(
      {String notificationId,
      String? title,
      String? body,
      String? type,
      DateTime? timestamp,
      Data? data,
      bool read});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$NotificationMdlCopyWithImpl<$Res>
    implements $NotificationMdlCopyWith<$Res> {
  _$NotificationMdlCopyWithImpl(this._self, this._then);

  final NotificationMdl _self;
  final $Res Function(NotificationMdl) _then;

  /// Create a copy of NotificationMdl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? title = freezed,
    Object? body = freezed,
    Object? type = freezed,
    Object? timestamp = freezed,
    Object? data = freezed,
    Object? read = null,
  }) {
    return _then(_self.copyWith(
      notificationId: null == notificationId
          ? _self.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      read: null == read
          ? _self.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of NotificationMdl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Notification implements NotificationMdl {
  const _Notification(
      {this.notificationId = '',
      this.title,
      this.body,
      this.type,
      this.timestamp,
      this.data,
      this.read = false});

  factory _Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  @override
  @JsonKey()
  final String notificationId;
  @override
  final String? title;
  @override
  final String? body;
  @override
  final String? type;
  @override
  final DateTime? timestamp;
  @override
  final Data? data;
  @override
  @JsonKey()
  final bool read;

  /// Create a copy of NotificationMdl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationCopyWith<_Notification> get copyWith =>
      __$NotificationCopyWithImpl<_Notification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Notification &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.read, read) || other.read == read));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, notificationId, title, body, type, timestamp, data, read);

  @override
  String toString() {
    return 'NotificationMdl(notificationId: $notificationId, title: $title, body: $body, type: $type, timestamp: $timestamp, data: $data, read: $read)';
  }
}

/// @nodoc
abstract mixin class _$NotificationCopyWith<$Res>
    implements $NotificationMdlCopyWith<$Res> {
  factory _$NotificationCopyWith(
          _Notification value, $Res Function(_Notification) _then) =
      __$NotificationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String notificationId,
      String? title,
      String? body,
      String? type,
      DateTime? timestamp,
      Data? data,
      bool read});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$NotificationCopyWithImpl<$Res>
    implements _$NotificationCopyWith<$Res> {
  __$NotificationCopyWithImpl(this._self, this._then);

  final _Notification _self;
  final $Res Function(_Notification) _then;

  /// Create a copy of NotificationMdl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? notificationId = null,
    Object? title = freezed,
    Object? body = freezed,
    Object? type = freezed,
    Object? timestamp = freezed,
    Object? data = freezed,
    Object? read = null,
  }) {
    return _then(_Notification(
      notificationId: null == notificationId
          ? _self.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      read: null == read
          ? _self.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of NotificationMdl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
mixin _$Data {
  String? get orderId;

  String? get status;

  DateTime? get estimatedDelivery;

  int? get cartItems;

  String? get cartTotal;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataCopyWith<Data> get copyWith =>
      _$DataCopyWithImpl<Data>(this as Data, _$identity);

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Data &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.estimatedDelivery, estimatedDelivery) ||
                other.estimatedDelivery == estimatedDelivery) &&
            (identical(other.cartItems, cartItems) ||
                other.cartItems == cartItems) &&
            (identical(other.cartTotal, cartTotal) ||
                other.cartTotal == cartTotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, orderId, status, estimatedDelivery, cartItems, cartTotal);

  @override
  String toString() {
    return 'Data(orderId: $orderId, status: $status, estimatedDelivery: $estimatedDelivery, cartItems: $cartItems, cartTotal: $cartTotal)';
  }
}

/// @nodoc
abstract mixin class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) _then) =
      _$DataCopyWithImpl;
  @useResult
  $Res call(
      {String? orderId,
      String? status,
      DateTime? estimatedDelivery,
      int? cartItems,
      String? cartTotal});
}

/// @nodoc
class _$DataCopyWithImpl<$Res> implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._self, this._then);

  final Data _self;
  final $Res Function(Data) _then;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? status = freezed,
    Object? estimatedDelivery = freezed,
    Object? cartItems = freezed,
    Object? cartTotal = freezed,
  }) {
    return _then(_self.copyWith(
      orderId: freezed == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedDelivery: freezed == estimatedDelivery
          ? _self.estimatedDelivery
          : estimatedDelivery // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cartItems: freezed == cartItems
          ? _self.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as int?,
      cartTotal: freezed == cartTotal
          ? _self.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Data implements Data {
  const _Data(
      {this.orderId,
      this.status,
      this.estimatedDelivery,
      this.cartItems,
      this.cartTotal});

  factory _Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  @override
  final String? orderId;
  @override
  final String? status;
  @override
  final DateTime? estimatedDelivery;
  @override
  final int? cartItems;
  @override
  final String? cartTotal;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DataCopyWith<_Data> get copyWith =>
      __$DataCopyWithImpl<_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Data &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.estimatedDelivery, estimatedDelivery) ||
                other.estimatedDelivery == estimatedDelivery) &&
            (identical(other.cartItems, cartItems) ||
                other.cartItems == cartItems) &&
            (identical(other.cartTotal, cartTotal) ||
                other.cartTotal == cartTotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, orderId, status, estimatedDelivery, cartItems, cartTotal);

  @override
  String toString() {
    return 'Data(orderId: $orderId, status: $status, estimatedDelivery: $estimatedDelivery, cartItems: $cartItems, cartTotal: $cartTotal)';
  }
}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) =
      __$DataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? orderId,
      String? status,
      DateTime? estimatedDelivery,
      int? cartItems,
      String? cartTotal});
}

/// @nodoc
class __$DataCopyWithImpl<$Res> implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(this._self, this._then);

  final _Data _self;
  final $Res Function(_Data) _then;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? orderId = freezed,
    Object? status = freezed,
    Object? estimatedDelivery = freezed,
    Object? cartItems = freezed,
    Object? cartTotal = freezed,
  }) {
    return _then(_Data(
      orderId: freezed == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedDelivery: freezed == estimatedDelivery
          ? _self.estimatedDelivery
          : estimatedDelivery // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cartItems: freezed == cartItems
          ? _self.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as int?,
      cartTotal: freezed == cartTotal
          ? _self.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
