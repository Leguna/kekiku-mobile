// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_mdl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationMdl _$NotificationMdlFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$NotificationMdl {
  String get notificationId => throw _privateConstructorUsedError;

  String? get title => throw _privateConstructorUsedError;

  String? get body => throw _privateConstructorUsedError;

  String? get type => throw _privateConstructorUsedError;

  DateTime? get timestamp => throw _privateConstructorUsedError;

  Data? get data => throw _privateConstructorUsedError;

  bool get read => throw _privateConstructorUsedError;

  /// Serializes this NotificationMdl to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationMdl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationMdlCopyWith<NotificationMdl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationMdlCopyWith<$Res> {
  factory $NotificationMdlCopyWith(
          NotificationMdl value, $Res Function(NotificationMdl) then) =
      _$NotificationMdlCopyWithImpl<$Res, NotificationMdl>;

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
class _$NotificationMdlCopyWithImpl<$Res, $Val extends NotificationMdl>
    implements $NotificationMdlCopyWith<$Res> {
  _$NotificationMdlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of NotificationMdl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationImplCopyWith<$Res>
    implements $NotificationMdlCopyWith<$Res> {
  factory _$$NotificationImplCopyWith(
          _$NotificationImpl value, $Res Function(_$NotificationImpl) then) =
      __$$NotificationImplCopyWithImpl<$Res>;

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
class __$$NotificationImplCopyWithImpl<$Res>
    extends _$NotificationMdlCopyWithImpl<$Res, _$NotificationImpl>
    implements _$$NotificationImplCopyWith<$Res> {
  __$$NotificationImplCopyWithImpl(
      _$NotificationImpl _value, $Res Function(_$NotificationImpl) _then)
      : super(_value, _then);

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
    return _then(_$NotificationImpl(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationImpl implements _Notification {
  const _$NotificationImpl(
      {this.notificationId = '',
      this.title,
      this.body,
      this.type,
      this.timestamp,
      this.data,
      this.read = false});

  factory _$NotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationImplFromJson(json);

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

  @override
  String toString() {
    return 'NotificationMdl(notificationId: $notificationId, title: $title, body: $body, type: $type, timestamp: $timestamp, data: $data, read: $read)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationImpl &&
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

  /// Create a copy of NotificationMdl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      __$$NotificationImplCopyWithImpl<_$NotificationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationImplToJson(
      this,
    );
  }
}

abstract class _Notification implements NotificationMdl {
  const factory _Notification(
      {final String notificationId,
      final String? title,
      final String? body,
      final String? type,
      final DateTime? timestamp,
      final Data? data,
      final bool read}) = _$NotificationImpl;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$NotificationImpl.fromJson;

  @override
  String get notificationId;

  @override
  String? get title;

  @override
  String? get body;

  @override
  String? get type;

  @override
  DateTime? get timestamp;

  @override
  Data? get data;

  @override
  bool get read;

  /// Create a copy of NotificationMdl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  String? get orderId => throw _privateConstructorUsedError;

  String? get status => throw _privateConstructorUsedError;

  DateTime? get estimatedDelivery => throw _privateConstructorUsedError;

  int? get cartItems => throw _privateConstructorUsedError;

  String? get cartTotal => throw _privateConstructorUsedError;

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;

  @useResult
  $Res call(
      {String? orderId,
      String? status,
      DateTime? estimatedDelivery,
      int? cartItems,
      String? cartTotal});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedDelivery: freezed == estimatedDelivery
          ? _value.estimatedDelivery
          : estimatedDelivery // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cartItems: freezed == cartItems
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as int?,
      cartTotal: freezed == cartTotal
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;

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
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

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
    return _then(_$DataImpl(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedDelivery: freezed == estimatedDelivery
          ? _value.estimatedDelivery
          : estimatedDelivery // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cartItems: freezed == cartItems
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as int?,
      cartTotal: freezed == cartTotal
          ? _value.cartTotal
          : cartTotal // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {this.orderId,
      this.status,
      this.estimatedDelivery,
      this.cartItems,
      this.cartTotal});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

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

  @override
  String toString() {
    return 'Data(orderId: $orderId, status: $status, estimatedDelivery: $estimatedDelivery, cartItems: $cartItems, cartTotal: $cartTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
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

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {final String? orderId,
      final String? status,
      final DateTime? estimatedDelivery,
      final int? cartItems,
      final String? cartTotal}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  String? get orderId;

  @override
  String? get status;

  @override
  DateTime? get estimatedDelivery;

  @override
  int? get cartItems;

  @override
  String? get cartTotal;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
