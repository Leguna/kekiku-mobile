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

class CartError implements CartState {
  const CartError(this.message);

  final String message;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartErrorCopyWith<CartError> get copyWith =>
      _$CartErrorCopyWithImpl<CartError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartError &&
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
abstract mixin class $CartErrorCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory $CartErrorCopyWith(CartError value, $Res Function(CartError) _then) =
      _$CartErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CartErrorCopyWithImpl<$Res> implements $CartErrorCopyWith<$Res> {
  _$CartErrorCopyWithImpl(this._self, this._then);

  final CartError _self;
  final $Res Function(CartError) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CartError(
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

class CartCheckout implements CartState {
  const CartCheckout();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CartCheckout);
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
      {required final List<CartItem> products,
      this.totalPrice = 0,
      this.totalDiscountedPrice = 0,
      this.deliveryFee = 0,
      this.totalQuantity = 0,
      this.selectedProduct,
      this.selectedQuantity = 0,
      this.totalBasePrice = 0})
      : _products = products;

  final List<CartItem> _products;
  List<CartItem> get products {
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
  final CartItem? selectedProduct;
  @JsonKey()
  final int selectedQuantity;
  @JsonKey()
  final double totalBasePrice;

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
                other.selectedQuantity == selectedQuantity) &&
            (identical(other.totalBasePrice, totalBasePrice) ||
                other.totalBasePrice == totalBasePrice));
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
      selectedQuantity,
      totalBasePrice);

  @override
  String toString() {
    return 'CartState.loaded(products: $products, totalPrice: $totalPrice, totalDiscountedPrice: $totalDiscountedPrice, deliveryFee: $deliveryFee, totalQuantity: $totalQuantity, selectedProduct: $selectedProduct, selectedQuantity: $selectedQuantity, totalBasePrice: $totalBasePrice)';
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
      {List<CartItem> products,
      double totalPrice,
      double totalDiscountedPrice,
      double deliveryFee,
      int totalQuantity,
      CartItem? selectedProduct,
      int selectedQuantity,
      double totalBasePrice});

  $CartItemCopyWith<$Res>? get selectedProduct;
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
    Object? selectedQuantity = null,
    Object? totalBasePrice = null,
  }) {
    return _then(CartLoaded(
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
      selectedProduct: freezed == selectedProduct
          ? _self.selectedProduct
          : selectedProduct // ignore: cast_nullable_to_non_nullable
              as CartItem?,
      selectedQuantity: null == selectedQuantity
          ? _self.selectedQuantity
          : selectedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalBasePrice: null == totalBasePrice
          ? _self.totalBasePrice
          : totalBasePrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CartItemCopyWith<$Res>? get selectedProduct {
    if (_self.selectedProduct == null) {
      return null;
    }

    return $CartItemCopyWith<$Res>(_self.selectedProduct!, (value) {
      return _then(_self.copyWith(selectedProduct: value));
    });
  }
}

// dart format on
