// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products, bool isLastPage) success,
    required TResult Function(Product product) detail,
    required TResult Function(String message) error,
    required TResult Function(Product product) selectedProduct,
    required TResult Function(Variant variant) selectedVariant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products, bool isLastPage)? success,
    TResult? Function(Product product)? detail,
    TResult? Function(String message)? error,
    TResult? Function(Product product)? selectedProduct,
    TResult? Function(Variant variant)? selectedVariant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products, bool isLastPage)? success,
    TResult Function(Product product)? detail,
    TResult Function(String message)? error,
    TResult Function(Product product)? selectedProduct,
    TResult Function(Variant variant)? selectedVariant,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Detail value) detail,
    required TResult Function(_Error value) error,
    required TResult Function(_SelectedProduct value) selectedProduct,
    required TResult Function(_SelectedVariant value) selectedVariant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Detail value)? detail,
    TResult? Function(_Error value)? error,
    TResult? Function(_SelectedProduct value)? selectedProduct,
    TResult? Function(_SelectedVariant value)? selectedVariant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Detail value)? detail,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedProduct value)? selectedProduct,
    TResult Function(_SelectedVariant value)? selectedVariant,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res, ProductState>;
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProductState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products, bool isLastPage) success,
    required TResult Function(Product product) detail,
    required TResult Function(String message) error,
    required TResult Function(Product product) selectedProduct,
    required TResult Function(Variant variant) selectedVariant,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products, bool isLastPage)? success,
    TResult? Function(Product product)? detail,
    TResult? Function(String message)? error,
    TResult? Function(Product product)? selectedProduct,
    TResult? Function(Variant variant)? selectedVariant,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products, bool isLastPage)? success,
    TResult Function(Product product)? detail,
    TResult Function(String message)? error,
    TResult Function(Product product)? selectedProduct,
    TResult Function(Variant variant)? selectedVariant,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Detail value) detail,
    required TResult Function(_Error value) error,
    required TResult Function(_SelectedProduct value) selectedProduct,
    required TResult Function(_SelectedVariant value) selectedVariant,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Detail value)? detail,
    TResult? Function(_Error value)? error,
    TResult? Function(_SelectedProduct value)? selectedProduct,
    TResult? Function(_SelectedVariant value)? selectedVariant,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Detail value)? detail,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedProduct value)? selectedProduct,
    TResult Function(_SelectedVariant value)? selectedVariant,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProductState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ProductState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products, bool isLastPage) success,
    required TResult Function(Product product) detail,
    required TResult Function(String message) error,
    required TResult Function(Product product) selectedProduct,
    required TResult Function(Variant variant) selectedVariant,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products, bool isLastPage)? success,
    TResult? Function(Product product)? detail,
    TResult? Function(String message)? error,
    TResult? Function(Product product)? selectedProduct,
    TResult? Function(Variant variant)? selectedVariant,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products, bool isLastPage)? success,
    TResult Function(Product product)? detail,
    TResult Function(String message)? error,
    TResult Function(Product product)? selectedProduct,
    TResult Function(Variant variant)? selectedVariant,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Detail value) detail,
    required TResult Function(_Error value) error,
    required TResult Function(_SelectedProduct value) selectedProduct,
    required TResult Function(_SelectedVariant value) selectedVariant,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Detail value)? detail,
    TResult? Function(_Error value)? error,
    TResult? Function(_SelectedProduct value)? selectedProduct,
    TResult? Function(_SelectedVariant value)? selectedVariant,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Detail value)? detail,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedProduct value)? selectedProduct,
    TResult Function(_SelectedVariant value)? selectedVariant,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ProductState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Product> products, bool isLastPage});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? isLastPage = null,
  }) {
    return _then(_$SuccessImpl(
      null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(final List<Product> products, {this.isLastPage = false})
      : _products = products;

  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @JsonKey()
  final bool isLastPage;

  @override
  String toString() {
    return 'ProductState.success(products: $products, isLastPage: $isLastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.isLastPage, isLastPage) ||
                other.isLastPage == isLastPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_products), isLastPage);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products, bool isLastPage) success,
    required TResult Function(Product product) detail,
    required TResult Function(String message) error,
    required TResult Function(Product product) selectedProduct,
    required TResult Function(Variant variant) selectedVariant,
  }) {
    return success(products, isLastPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products, bool isLastPage)? success,
    TResult? Function(Product product)? detail,
    TResult? Function(String message)? error,
    TResult? Function(Product product)? selectedProduct,
    TResult? Function(Variant variant)? selectedVariant,
  }) {
    return success?.call(products, isLastPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products, bool isLastPage)? success,
    TResult Function(Product product)? detail,
    TResult Function(String message)? error,
    TResult Function(Product product)? selectedProduct,
    TResult Function(Variant variant)? selectedVariant,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(products, isLastPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Detail value) detail,
    required TResult Function(_Error value) error,
    required TResult Function(_SelectedProduct value) selectedProduct,
    required TResult Function(_SelectedVariant value) selectedVariant,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Detail value)? detail,
    TResult? Function(_Error value)? error,
    TResult? Function(_SelectedProduct value)? selectedProduct,
    TResult? Function(_SelectedVariant value)? selectedVariant,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Detail value)? detail,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedProduct value)? selectedProduct,
    TResult Function(_SelectedVariant value)? selectedVariant,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ProductState {
  const factory _Success(final List<Product> products,
      {final bool isLastPage}) = _$SuccessImpl;

  List<Product> get products;
  bool get isLastPage;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailImplCopyWith<$Res> {
  factory _$$DetailImplCopyWith(
          _$DetailImpl value, $Res Function(_$DetailImpl) then) =
      __$$DetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$DetailImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$DetailImpl>
    implements _$$DetailImplCopyWith<$Res> {
  __$$DetailImplCopyWithImpl(
      _$DetailImpl _value, $Res Function(_$DetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$DetailImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$DetailImpl implements _Detail {
  const _$DetailImpl(this.product);

  @override
  final Product product;

  @override
  String toString() {
    return 'ProductState.detail(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailImplCopyWith<_$DetailImpl> get copyWith =>
      __$$DetailImplCopyWithImpl<_$DetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products, bool isLastPage) success,
    required TResult Function(Product product) detail,
    required TResult Function(String message) error,
    required TResult Function(Product product) selectedProduct,
    required TResult Function(Variant variant) selectedVariant,
  }) {
    return detail(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products, bool isLastPage)? success,
    TResult? Function(Product product)? detail,
    TResult? Function(String message)? error,
    TResult? Function(Product product)? selectedProduct,
    TResult? Function(Variant variant)? selectedVariant,
  }) {
    return detail?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products, bool isLastPage)? success,
    TResult Function(Product product)? detail,
    TResult Function(String message)? error,
    TResult Function(Product product)? selectedProduct,
    TResult Function(Variant variant)? selectedVariant,
    required TResult orElse(),
  }) {
    if (detail != null) {
      return detail(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Detail value) detail,
    required TResult Function(_Error value) error,
    required TResult Function(_SelectedProduct value) selectedProduct,
    required TResult Function(_SelectedVariant value) selectedVariant,
  }) {
    return detail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Detail value)? detail,
    TResult? Function(_Error value)? error,
    TResult? Function(_SelectedProduct value)? selectedProduct,
    TResult? Function(_SelectedVariant value)? selectedVariant,
  }) {
    return detail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Detail value)? detail,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedProduct value)? selectedProduct,
    TResult Function(_SelectedVariant value)? selectedVariant,
    required TResult orElse(),
  }) {
    if (detail != null) {
      return detail(this);
    }
    return orElse();
  }
}

abstract class _Detail implements ProductState {
  const factory _Detail(final Product product) = _$DetailImpl;

  Product get product;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailImplCopyWith<_$DetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ProductState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products, bool isLastPage) success,
    required TResult Function(Product product) detail,
    required TResult Function(String message) error,
    required TResult Function(Product product) selectedProduct,
    required TResult Function(Variant variant) selectedVariant,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products, bool isLastPage)? success,
    TResult? Function(Product product)? detail,
    TResult? Function(String message)? error,
    TResult? Function(Product product)? selectedProduct,
    TResult? Function(Variant variant)? selectedVariant,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products, bool isLastPage)? success,
    TResult Function(Product product)? detail,
    TResult Function(String message)? error,
    TResult Function(Product product)? selectedProduct,
    TResult Function(Variant variant)? selectedVariant,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Detail value) detail,
    required TResult Function(_Error value) error,
    required TResult Function(_SelectedProduct value) selectedProduct,
    required TResult Function(_SelectedVariant value) selectedVariant,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Detail value)? detail,
    TResult? Function(_Error value)? error,
    TResult? Function(_SelectedProduct value)? selectedProduct,
    TResult? Function(_SelectedVariant value)? selectedVariant,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Detail value)? detail,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedProduct value)? selectedProduct,
    TResult Function(_SelectedVariant value)? selectedVariant,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ProductState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectedProductImplCopyWith<$Res> {
  factory _$$SelectedProductImplCopyWith(_$SelectedProductImpl value,
          $Res Function(_$SelectedProductImpl) then) =
      __$$SelectedProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$SelectedProductImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$SelectedProductImpl>
    implements _$$SelectedProductImplCopyWith<$Res> {
  __$$SelectedProductImplCopyWithImpl(
      _$SelectedProductImpl _value, $Res Function(_$SelectedProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$SelectedProductImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$SelectedProductImpl implements _SelectedProduct {
  const _$SelectedProductImpl(this.product);

  @override
  final Product product;

  @override
  String toString() {
    return 'ProductState.selectedProduct(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedProductImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedProductImplCopyWith<_$SelectedProductImpl> get copyWith =>
      __$$SelectedProductImplCopyWithImpl<_$SelectedProductImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products, bool isLastPage) success,
    required TResult Function(Product product) detail,
    required TResult Function(String message) error,
    required TResult Function(Product product) selectedProduct,
    required TResult Function(Variant variant) selectedVariant,
  }) {
    return selectedProduct(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products, bool isLastPage)? success,
    TResult? Function(Product product)? detail,
    TResult? Function(String message)? error,
    TResult? Function(Product product)? selectedProduct,
    TResult? Function(Variant variant)? selectedVariant,
  }) {
    return selectedProduct?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products, bool isLastPage)? success,
    TResult Function(Product product)? detail,
    TResult Function(String message)? error,
    TResult Function(Product product)? selectedProduct,
    TResult Function(Variant variant)? selectedVariant,
    required TResult orElse(),
  }) {
    if (selectedProduct != null) {
      return selectedProduct(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Detail value) detail,
    required TResult Function(_Error value) error,
    required TResult Function(_SelectedProduct value) selectedProduct,
    required TResult Function(_SelectedVariant value) selectedVariant,
  }) {
    return selectedProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Detail value)? detail,
    TResult? Function(_Error value)? error,
    TResult? Function(_SelectedProduct value)? selectedProduct,
    TResult? Function(_SelectedVariant value)? selectedVariant,
  }) {
    return selectedProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Detail value)? detail,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedProduct value)? selectedProduct,
    TResult Function(_SelectedVariant value)? selectedVariant,
    required TResult orElse(),
  }) {
    if (selectedProduct != null) {
      return selectedProduct(this);
    }
    return orElse();
  }
}

abstract class _SelectedProduct implements ProductState {
  const factory _SelectedProduct(final Product product) = _$SelectedProductImpl;

  Product get product;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectedProductImplCopyWith<_$SelectedProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectedVariantImplCopyWith<$Res> {
  factory _$$SelectedVariantImplCopyWith(_$SelectedVariantImpl value,
          $Res Function(_$SelectedVariantImpl) then) =
      __$$SelectedVariantImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Variant variant});

  $VariantCopyWith<$Res> get variant;
}

/// @nodoc
class __$$SelectedVariantImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$SelectedVariantImpl>
    implements _$$SelectedVariantImplCopyWith<$Res> {
  __$$SelectedVariantImplCopyWithImpl(
      _$SelectedVariantImpl _value, $Res Function(_$SelectedVariantImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
  }) {
    return _then(_$SelectedVariantImpl(
      null == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as Variant,
    ));
  }

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VariantCopyWith<$Res> get variant {
    return $VariantCopyWith<$Res>(_value.variant, (value) {
      return _then(_value.copyWith(variant: value));
    });
  }
}

/// @nodoc

class _$SelectedVariantImpl implements _SelectedVariant {
  const _$SelectedVariantImpl(this.variant);

  @override
  final Variant variant;

  @override
  String toString() {
    return 'ProductState.selectedVariant(variant: $variant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedVariantImpl &&
            (identical(other.variant, variant) || other.variant == variant));
  }

  @override
  int get hashCode => Object.hash(runtimeType, variant);

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedVariantImplCopyWith<_$SelectedVariantImpl> get copyWith =>
      __$$SelectedVariantImplCopyWithImpl<_$SelectedVariantImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products, bool isLastPage) success,
    required TResult Function(Product product) detail,
    required TResult Function(String message) error,
    required TResult Function(Product product) selectedProduct,
    required TResult Function(Variant variant) selectedVariant,
  }) {
    return selectedVariant(variant);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products, bool isLastPage)? success,
    TResult? Function(Product product)? detail,
    TResult? Function(String message)? error,
    TResult? Function(Product product)? selectedProduct,
    TResult? Function(Variant variant)? selectedVariant,
  }) {
    return selectedVariant?.call(variant);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products, bool isLastPage)? success,
    TResult Function(Product product)? detail,
    TResult Function(String message)? error,
    TResult Function(Product product)? selectedProduct,
    TResult Function(Variant variant)? selectedVariant,
    required TResult orElse(),
  }) {
    if (selectedVariant != null) {
      return selectedVariant(variant);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Detail value) detail,
    required TResult Function(_Error value) error,
    required TResult Function(_SelectedProduct value) selectedProduct,
    required TResult Function(_SelectedVariant value) selectedVariant,
  }) {
    return selectedVariant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Detail value)? detail,
    TResult? Function(_Error value)? error,
    TResult? Function(_SelectedProduct value)? selectedProduct,
    TResult? Function(_SelectedVariant value)? selectedVariant,
  }) {
    return selectedVariant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Detail value)? detail,
    TResult Function(_Error value)? error,
    TResult Function(_SelectedProduct value)? selectedProduct,
    TResult Function(_SelectedVariant value)? selectedVariant,
    required TResult orElse(),
  }) {
    if (selectedVariant != null) {
      return selectedVariant(this);
    }
    return orElse();
  }
}

abstract class _SelectedVariant implements ProductState {
  const factory _SelectedVariant(final Variant variant) = _$SelectedVariantImpl;

  Variant get variant;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectedVariantImplCopyWith<_$SelectedVariantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
