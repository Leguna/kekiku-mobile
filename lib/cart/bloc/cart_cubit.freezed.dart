// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CartState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CartState()';
  }
}

/// @nodoc
class $CartStateCopyWith<$Res> {
  $CartStateCopyWith(CartState _, $Res Function(CartState) __);
}

/// @nodoc

class CartInitial implements CartState {
  const CartInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CartInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CartState.initial()';
  }
}

/// @nodoc

class CartLoading implements CartState {
  const CartLoading({this.product});

  final Product? product;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartLoadingCopyWith<CartLoading> get copyWith =>
      _$CartLoadingCopyWithImpl<CartLoading>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartLoading &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'CartState.loading(product: $product)';
  }
}

/// @nodoc
abstract mixin class $CartLoadingCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory $CartLoadingCopyWith(
          CartLoading value, $Res Function(CartLoading) _then) =
      _$CartLoadingCopyWithImpl;
  @useResult
  $Res call({Product? product});

  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class _$CartLoadingCopyWithImpl<$Res> implements $CartLoadingCopyWith<$Res> {
  _$CartLoadingCopyWithImpl(this._self, this._then);

  final CartLoading _self;
  final $Res Function(CartLoading) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = freezed,
  }) {
    return _then(CartLoading(
      product: freezed == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
    ));
  }

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_self.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_self.product!, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}

/// @nodoc

class _Error implements CartState {
  const _Error(this.message);

  final String message;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CartState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_Error(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class CartEmpty implements CartState {
  const CartEmpty();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CartEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CartState.empty()';
  }
}

/// @nodoc

class Checkout implements CartState {
  const Checkout();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Checkout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CartState.checkout()';
  }
}

/// @nodoc

class CartLoaded implements CartState {
  const CartLoaded(
      {required final List<Product> products,
      this.totalPrice = 0,
      this.totalDiscountedPrice = 0,
      this.deliveryFee = 0,
      this.totalQuantity = 0,
      required this.selectedProduct,
      required this.selectedQuantity})
      : _products = products;

  final List<Product> _products;
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @JsonKey()
  final double totalPrice;
  @JsonKey()
  final double totalDiscountedPrice;
  @JsonKey()
  final double deliveryFee;
  @JsonKey()
  final int totalQuantity;
  final Product? selectedProduct;
  final int? selectedQuantity;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartLoadedCopyWith<CartLoaded> get copyWith =>
      _$CartLoadedCopyWithImpl<CartLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartLoaded &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.totalDiscountedPrice, totalDiscountedPrice) ||
                other.totalDiscountedPrice == totalDiscountedPrice) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.selectedProduct, selectedProduct) ||
                other.selectedProduct == selectedProduct) &&
            (identical(other.selectedQuantity, selectedQuantity) ||
                other.selectedQuantity == selectedQuantity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      totalPrice,
      totalDiscountedPrice,
      deliveryFee,
      totalQuantity,
      selectedProduct,
      selectedQuantity);

  @override
  String toString() {
    return 'CartState.loaded(products: $products, totalPrice: $totalPrice, totalDiscountedPrice: $totalDiscountedPrice, deliveryFee: $deliveryFee, totalQuantity: $totalQuantity, selectedProduct: $selectedProduct, selectedQuantity: $selectedQuantity)';
  }
}

/// @nodoc
abstract mixin class $CartLoadedCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory $CartLoadedCopyWith(
          CartLoaded value, $Res Function(CartLoaded) _then) =
      _$CartLoadedCopyWithImpl;
  @useResult
  $Res call(
      {List<Product> products,
      double totalPrice,
      double totalDiscountedPrice,
      double deliveryFee,
      int totalQuantity,
      Product? selectedProduct,
      int? selectedQuantity});

  $ProductCopyWith<$Res>? get selectedProduct;
}

/// @nodoc
class _$CartLoadedCopyWithImpl<$Res> implements $CartLoadedCopyWith<$Res> {
  _$CartLoadedCopyWithImpl(this._self, this._then);

  final CartLoaded _self;
  final $Res Function(CartLoaded) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? products = null,
    Object? totalPrice = null,
    Object? totalDiscountedPrice = null,
    Object? deliveryFee = null,
    Object? totalQuantity = null,
    Object? selectedProduct = freezed,
    Object? selectedQuantity = freezed,
  }) {
    return _then(CartLoaded(
      products: null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
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
      selectedProduct: freezed == selectedProduct
          ? _self.selectedProduct
          : selectedProduct // ignore: cast_nullable_to_non_nullable
              as Product?,
      selectedQuantity: freezed == selectedQuantity
          ? _self.selectedQuantity
          : selectedQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get selectedProduct {
    if (_self.selectedProduct == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_self.selectedProduct!, (value) {
      return _then(_self.copyWith(selectedProduct: value));
    });
  }
}

// dart format on
