// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartResponse {
  double get basePrice;
  double get deliveryFee;
  int get totalItem;
  double get totalDiscountedPrice;
  double get totalPrice;
  List<CartItem> get items;

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartResponseCopyWith<CartResponse> get copyWith =>
      _$CartResponseCopyWithImpl<CartResponse>(
          this as CartResponse, _$identity);

  /// Serializes this CartResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartResponse &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.totalItem, totalItem) ||
                other.totalItem == totalItem) &&
            (identical(other.totalDiscountedPrice, totalDiscountedPrice) ||
                other.totalDiscountedPrice == totalDiscountedPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      basePrice,
      deliveryFee,
      totalItem,
      totalDiscountedPrice,
      totalPrice,
      const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'CartResponse(basePrice: $basePrice, deliveryFee: $deliveryFee, totalItem: $totalItem, totalDiscountedPrice: $totalDiscountedPrice, totalPrice: $totalPrice, items: $items)';
  }
}

/// @nodoc
abstract mixin class $CartResponseCopyWith<$Res> {
  factory $CartResponseCopyWith(
          CartResponse value, $Res Function(CartResponse) _then) =
      _$CartResponseCopyWithImpl;
  @useResult
  $Res call(
      {double basePrice,
      double deliveryFee,
      int totalItem,
      double totalDiscountedPrice,
      double totalPrice,
      List<CartItem> items});
}

/// @nodoc
class _$CartResponseCopyWithImpl<$Res> implements $CartResponseCopyWith<$Res> {
  _$CartResponseCopyWithImpl(this._self, this._then);

  final CartResponse _self;
  final $Res Function(CartResponse) _then;

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basePrice = null,
    Object? deliveryFee = null,
    Object? totalItem = null,
    Object? totalDiscountedPrice = null,
    Object? totalPrice = null,
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      basePrice: null == basePrice
          ? _self.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _self.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      totalItem: null == totalItem
          ? _self.totalItem
          : totalItem // ignore: cast_nullable_to_non_nullable
              as int,
      totalDiscountedPrice: null == totalDiscountedPrice
          ? _self.totalDiscountedPrice
          : totalDiscountedPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _self.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CartResponse extends CartResponse {
  const _CartResponse(
      {this.basePrice = 0,
      this.deliveryFee = 0,
      this.totalItem = 0,
      this.totalDiscountedPrice = 0,
      this.totalPrice = 0,
      final List<CartItem> items = const []})
      : _items = items,
        super._();
  factory _CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  @override
  @JsonKey()
  final double basePrice;
  @override
  @JsonKey()
  final double deliveryFee;
  @override
  @JsonKey()
  final int totalItem;
  @override
  @JsonKey()
  final double totalDiscountedPrice;
  @override
  @JsonKey()
  final double totalPrice;
  final List<CartItem> _items;
  @override
  @JsonKey()
  List<CartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CartResponseCopyWith<_CartResponse> get copyWith =>
      __$CartResponseCopyWithImpl<_CartResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CartResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartResponse &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.totalItem, totalItem) ||
                other.totalItem == totalItem) &&
            (identical(other.totalDiscountedPrice, totalDiscountedPrice) ||
                other.totalDiscountedPrice == totalDiscountedPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      basePrice,
      deliveryFee,
      totalItem,
      totalDiscountedPrice,
      totalPrice,
      const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'CartResponse(basePrice: $basePrice, deliveryFee: $deliveryFee, totalItem: $totalItem, totalDiscountedPrice: $totalDiscountedPrice, totalPrice: $totalPrice, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$CartResponseCopyWith<$Res>
    implements $CartResponseCopyWith<$Res> {
  factory _$CartResponseCopyWith(
          _CartResponse value, $Res Function(_CartResponse) _then) =
      __$CartResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double basePrice,
      double deliveryFee,
      int totalItem,
      double totalDiscountedPrice,
      double totalPrice,
      List<CartItem> items});
}

/// @nodoc
class __$CartResponseCopyWithImpl<$Res>
    implements _$CartResponseCopyWith<$Res> {
  __$CartResponseCopyWithImpl(this._self, this._then);

  final _CartResponse _self;
  final $Res Function(_CartResponse) _then;

  /// Create a copy of CartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? basePrice = null,
    Object? deliveryFee = null,
    Object? totalItem = null,
    Object? totalDiscountedPrice = null,
    Object? totalPrice = null,
    Object? items = null,
  }) {
    return _then(_CartResponse(
      basePrice: null == basePrice
          ? _self.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _self.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      totalItem: null == totalItem
          ? _self.totalItem
          : totalItem // ignore: cast_nullable_to_non_nullable
              as int,
      totalDiscountedPrice: null == totalDiscountedPrice
          ? _self.totalDiscountedPrice
          : totalDiscountedPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _self.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
    ));
  }
}

// dart format on
