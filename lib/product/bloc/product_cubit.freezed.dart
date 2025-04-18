// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProductState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductState()';
  }
}

/// @nodoc
class $ProductStateCopyWith<$Res> {
  $ProductStateCopyWith(ProductState _, $Res Function(ProductState) __);
}

/// @nodoc

class _Initial implements ProductState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductState.initial()';
  }
}

/// @nodoc

class _Loading implements ProductState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductState.loading()';
  }
}

/// @nodoc

class ProductSuccess implements ProductState {
  const ProductSuccess(final List<Product> products,
      {this.isLastPage = false,
      this.pagingState,
      final List<Product> popularProducts = const []})
      : _products = products,
        _popularProducts = popularProducts;

  final List<Product> _products;
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @JsonKey()
  final bool isLastPage;
  final PagingState<int, Product>? pagingState;
  final List<Product> _popularProducts;
  @JsonKey()
  List<Product> get popularProducts {
    if (_popularProducts is EqualUnmodifiableListView) return _popularProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_popularProducts);
  }

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductSuccessCopyWith<ProductSuccess> get copyWith =>
      _$ProductSuccessCopyWithImpl<ProductSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductSuccess &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.isLastPage, isLastPage) ||
                other.isLastPage == isLastPage) &&
            (identical(other.pagingState, pagingState) ||
                other.pagingState == pagingState) &&
            const DeepCollectionEquality()
                .equals(other._popularProducts, _popularProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      isLastPage,
      pagingState,
      const DeepCollectionEquality().hash(_popularProducts));

  @override
  String toString() {
    return 'ProductState.success(products: $products, isLastPage: $isLastPage, pagingState: $pagingState, popularProducts: $popularProducts)';
  }
}

/// @nodoc
abstract mixin class $ProductSuccessCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory $ProductSuccessCopyWith(
          ProductSuccess value, $Res Function(ProductSuccess) _then) =
      _$ProductSuccessCopyWithImpl;
  @useResult
  $Res call(
      {List<Product> products,
      bool isLastPage,
      PagingState<int, Product>? pagingState,
      List<Product> popularProducts});
}

/// @nodoc
class _$ProductSuccessCopyWithImpl<$Res>
    implements $ProductSuccessCopyWith<$Res> {
  _$ProductSuccessCopyWithImpl(this._self, this._then);

  final ProductSuccess _self;
  final $Res Function(ProductSuccess) _then;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? products = null,
    Object? isLastPage = null,
    Object? pagingState = freezed,
    Object? popularProducts = null,
  }) {
    return _then(ProductSuccess(
      null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      isLastPage: null == isLastPage
          ? _self.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
      pagingState: freezed == pagingState
          ? _self.pagingState
          : pagingState // ignore: cast_nullable_to_non_nullable
              as PagingState<int, Product>?,
      popularProducts: null == popularProducts
          ? _self._popularProducts
          : popularProducts // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class ProductDetail implements ProductState {
  const ProductDetail(this.product);

  final Product product;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductDetailCopyWith<ProductDetail> get copyWith =>
      _$ProductDetailCopyWithImpl<ProductDetail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductDetail &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'ProductState.detail(product: $product)';
  }
}

/// @nodoc
abstract mixin class $ProductDetailCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory $ProductDetailCopyWith(
          ProductDetail value, $Res Function(ProductDetail) _then) =
      _$ProductDetailCopyWithImpl;
  @useResult
  $Res call({Product product});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$ProductDetailCopyWithImpl<$Res>
    implements $ProductDetailCopyWith<$Res> {
  _$ProductDetailCopyWithImpl(this._self, this._then);

  final ProductDetail _self;
  final $Res Function(ProductDetail) _then;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(ProductDetail(
      null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}

/// @nodoc

class _Error implements ProductState {
  const _Error(this.message);

  final String message;

  /// Create a copy of ProductState
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
    return 'ProductState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
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

  /// Create a copy of ProductState
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

class SelectedProduct implements ProductState {
  const SelectedProduct(this.product);

  final Product product;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectedProductCopyWith<SelectedProduct> get copyWith =>
      _$SelectedProductCopyWithImpl<SelectedProduct>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectedProduct &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'ProductState.selectedProduct(product: $product)';
  }
}

/// @nodoc
abstract mixin class $SelectedProductCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory $SelectedProductCopyWith(
          SelectedProduct value, $Res Function(SelectedProduct) _then) =
      _$SelectedProductCopyWithImpl;
  @useResult
  $Res call({Product product});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$SelectedProductCopyWithImpl<$Res>
    implements $SelectedProductCopyWith<$Res> {
  _$SelectedProductCopyWithImpl(this._self, this._then);

  final SelectedProduct _self;
  final $Res Function(SelectedProduct) _then;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(SelectedProduct(
      null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}

/// @nodoc

class SelectedVariant implements ProductState {
  const SelectedVariant(this.variant);

  final Variant variant;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectedVariantCopyWith<SelectedVariant> get copyWith =>
      _$SelectedVariantCopyWithImpl<SelectedVariant>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectedVariant &&
            (identical(other.variant, variant) || other.variant == variant));
  }

  @override
  int get hashCode => Object.hash(runtimeType, variant);

  @override
  String toString() {
    return 'ProductState.selectedVariant(variant: $variant)';
  }
}

/// @nodoc
abstract mixin class $SelectedVariantCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory $SelectedVariantCopyWith(
          SelectedVariant value, $Res Function(SelectedVariant) _then) =
      _$SelectedVariantCopyWithImpl;
  @useResult
  $Res call({Variant variant});

  $VariantCopyWith<$Res> get variant;
}

/// @nodoc
class _$SelectedVariantCopyWithImpl<$Res>
    implements $SelectedVariantCopyWith<$Res> {
  _$SelectedVariantCopyWithImpl(this._self, this._then);

  final SelectedVariant _self;
  final $Res Function(SelectedVariant) _then;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? variant = null,
  }) {
    return _then(SelectedVariant(
      null == variant
          ? _self.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as Variant,
    ));
  }

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VariantCopyWith<$Res> get variant {
    return $VariantCopyWith<$Res>(_self.variant, (value) {
      return _then(_self.copyWith(variant: value));
    });
  }
}

/// @nodoc

class _OutOfStock implements ProductState {
  const _OutOfStock();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _OutOfStock);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductState.outOfStock()';
  }
}

// dart format on
