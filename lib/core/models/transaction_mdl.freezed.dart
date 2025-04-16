// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_mdl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Transaction {
  String get id;
  double? get amount;
  String? get date;
  String? get type;
  String? get description;
  String? get status;
  String? get userId;
  String? get userName;
  Address? get destinationAddress;
  @JsonKey(fromJson: _productListFromJson, toJson: _productListToJson)
  List<Product> get products;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<Transaction> get copyWith =>
      _$TransactionCopyWithImpl<Transaction>(this as Transaction, _$identity);

  /// Serializes this Transaction to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Transaction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.destinationAddress, destinationAddress) ||
                other.destinationAddress == destinationAddress) &&
            const DeepCollectionEquality().equals(other.products, products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      amount,
      date,
      type,
      description,
      status,
      userId,
      userName,
      destinationAddress,
      const DeepCollectionEquality().hash(products));

  @override
  String toString() {
    return 'Transaction(id: $id, amount: $amount, date: $date, type: $type, description: $description, status: $status, userId: $userId, userName: $userName, destinationAddress: $destinationAddress, products: $products)';
  }
}

/// @nodoc
abstract mixin class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) _then) =
      _$TransactionCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      double? amount,
      String? date,
      String? type,
      String? description,
      String? status,
      String? userId,
      String? userName,
      Address? destinationAddress,
      @JsonKey(fromJson: _productListFromJson, toJson: _productListToJson)
      List<Product> products});

  $AddressCopyWith<$Res>? get destinationAddress;
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res> implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._self, this._then);

  final Transaction _self;
  final $Res Function(Transaction) _then;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = freezed,
    Object? date = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? userId = freezed,
    Object? userName = freezed,
    Object? destinationAddress = freezed,
    Object? products = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: freezed == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationAddress: freezed == destinationAddress
          ? _self.destinationAddress
          : destinationAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      products: null == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get destinationAddress {
    if (_self.destinationAddress == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_self.destinationAddress!, (value) {
      return _then(_self.copyWith(destinationAddress: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Transaction implements Transaction {
  const _Transaction(
      {this.id = '',
      this.amount,
      this.date,
      this.type,
      this.description,
      this.status,
      this.userId,
      this.userName,
      this.destinationAddress,
      @JsonKey(fromJson: _productListFromJson, toJson: _productListToJson)
      final List<Product> products = const []})
      : _products = products;
  factory _Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final double? amount;
  @override
  final String? date;
  @override
  final String? type;
  @override
  final String? description;
  @override
  final String? status;
  @override
  final String? userId;
  @override
  final String? userName;
  @override
  final Address? destinationAddress;
  final List<Product> _products;
  @override
  @JsonKey(fromJson: _productListFromJson, toJson: _productListToJson)
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TransactionCopyWith<_Transaction> get copyWith =>
      __$TransactionCopyWithImpl<_Transaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TransactionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Transaction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.destinationAddress, destinationAddress) ||
                other.destinationAddress == destinationAddress) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      amount,
      date,
      type,
      description,
      status,
      userId,
      userName,
      destinationAddress,
      const DeepCollectionEquality().hash(_products));

  @override
  String toString() {
    return 'Transaction(id: $id, amount: $amount, date: $date, type: $type, description: $description, status: $status, userId: $userId, userName: $userName, destinationAddress: $destinationAddress, products: $products)';
  }
}

/// @nodoc
abstract mixin class _$TransactionCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(
          _Transaction value, $Res Function(_Transaction) _then) =
      __$TransactionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      double? amount,
      String? date,
      String? type,
      String? description,
      String? status,
      String? userId,
      String? userName,
      Address? destinationAddress,
      @JsonKey(fromJson: _productListFromJson, toJson: _productListToJson)
      List<Product> products});

  @override
  $AddressCopyWith<$Res>? get destinationAddress;
}

/// @nodoc
class __$TransactionCopyWithImpl<$Res> implements _$TransactionCopyWith<$Res> {
  __$TransactionCopyWithImpl(this._self, this._then);

  final _Transaction _self;
  final $Res Function(_Transaction) _then;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? amount = freezed,
    Object? date = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? userId = freezed,
    Object? userName = freezed,
    Object? destinationAddress = freezed,
    Object? products = null,
  }) {
    return _then(_Transaction(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: freezed == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      date: freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationAddress: freezed == destinationAddress
          ? _self.destinationAddress
          : destinationAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      products: null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get destinationAddress {
    if (_self.destinationAddress == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_self.destinationAddress!, (value) {
      return _then(_self.copyWith(destinationAddress: value));
    });
  }
}

// dart format on
