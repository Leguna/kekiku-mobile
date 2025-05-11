// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_mdl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Cart {
  List<CartItem> get products;
  double get totalPrice;
  double get totalDiscountedPrice;
  double get deliveryFee;
  int get totalQuantity;

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartCopyWith<Cart> get copyWith =>
      _$CartCopyWithImpl<Cart>(this as Cart, _$identity);

  /// Serializes this Cart to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Cart &&
            const DeepCollectionEquality().equals(other.products, products) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.totalDiscountedPrice, totalDiscountedPrice) ||
                other.totalDiscountedPrice == totalDiscountedPrice) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(products),
      totalPrice,
      totalDiscountedPrice,
      deliveryFee,
      totalQuantity);

  @override
  String toString() {
    return 'Cart(products: $products, totalPrice: $totalPrice, totalDiscountedPrice: $totalDiscountedPrice, deliveryFee: $deliveryFee, totalQuantity: $totalQuantity)';
  }
}

/// @nodoc
abstract mixin class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) _then) =
      _$CartCopyWithImpl;
  @useResult
  $Res call(
      {List<CartItem> products,
      double totalPrice,
      double totalDiscountedPrice,
      double deliveryFee,
      int totalQuantity});
}

/// @nodoc
class _$CartCopyWithImpl<$Res> implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._self, this._then);

  final Cart _self;
  final $Res Function(Cart) _then;

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? totalPrice = null,
    Object? totalDiscountedPrice = null,
    Object? deliveryFee = null,
    Object? totalQuantity = null,
  }) {
    return _then(_self.copyWith(
      products: null == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      totalPrice: null == totalPrice
          ? _self.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalDiscountedPrice: null == totalDiscountedPrice
          ? _self.totalDiscountedPrice
          : totalDiscountedPrice // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _self.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      totalQuantity: null == totalQuantity
          ? _self.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Cart extends Cart {
  const _Cart(
      {final List<CartItem> products = const [],
      this.totalPrice = 0,
      this.totalDiscountedPrice = 0,
      this.deliveryFee = 0,
      this.totalQuantity = 0})
      : _products = products,
        super._();
  factory _Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  final List<CartItem> _products;
  @override
  @JsonKey()
  List<CartItem> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @JsonKey()
  final double totalPrice;
  @override
  @JsonKey()
  final double totalDiscountedPrice;
  @override
  @JsonKey()
  final double deliveryFee;
  @override
  @JsonKey()
  final int totalQuantity;

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CartCopyWith<_Cart> get copyWith =>
      __$CartCopyWithImpl<_Cart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CartToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Cart &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.totalDiscountedPrice, totalDiscountedPrice) ||
                other.totalDiscountedPrice == totalDiscountedPrice) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      totalPrice,
      totalDiscountedPrice,
      deliveryFee,
      totalQuantity);

  @override
  String toString() {
    return 'Cart(products: $products, totalPrice: $totalPrice, totalDiscountedPrice: $totalDiscountedPrice, deliveryFee: $deliveryFee, totalQuantity: $totalQuantity)';
  }
}

/// @nodoc
abstract mixin class _$CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$CartCopyWith(_Cart value, $Res Function(_Cart) _then) =
      __$CartCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<CartItem> products,
      double totalPrice,
      double totalDiscountedPrice,
      double deliveryFee,
      int totalQuantity});
}

/// @nodoc
class __$CartCopyWithImpl<$Res> implements _$CartCopyWith<$Res> {
  __$CartCopyWithImpl(this._self, this._then);

  final _Cart _self;
  final $Res Function(_Cart) _then;

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? products = null,
    Object? totalPrice = null,
    Object? totalDiscountedPrice = null,
    Object? deliveryFee = null,
    Object? totalQuantity = null,
  }) {
    return _then(_Cart(
      products: null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      totalPrice: null == totalPrice
          ? _self.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalDiscountedPrice: null == totalDiscountedPrice
          ? _self.totalDiscountedPrice
          : totalDiscountedPrice // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _self.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      totalQuantity: null == totalQuantity
          ? _self.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
