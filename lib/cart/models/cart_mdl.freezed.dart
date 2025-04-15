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
Cart _$CartFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _CartMdl.fromJson(json);
    case 'empty':
      return _Empty.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Cart',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Cart {
  /// Serializes this Cart to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Cart);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Cart()';
  }
}

/// @nodoc
class $CartCopyWith<$Res> {
  $CartCopyWith(Cart _, $Res Function(Cart) __);
}

/// @nodoc
@JsonSerializable()
class _CartMdl implements Cart {
  const _CartMdl({required final List<Product> products, final String? $type})
      : _products = products,
        $type = $type ?? 'default';

  factory _CartMdl.fromJson(Map<String, dynamic> json) =>
      _$CartMdlFromJson(json);

  final List<Product> _products;
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CartMdlCopyWith<_CartMdl> get copyWith =>
      __$CartMdlCopyWithImpl<_CartMdl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CartMdlToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartMdl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @override
  String toString() {
    return 'Cart(products: $products)';
  }
}

/// @nodoc
abstract mixin class _$CartMdlCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$CartMdlCopyWith(_CartMdl value, $Res Function(_CartMdl) _then) =
      __$CartMdlCopyWithImpl;

  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class __$CartMdlCopyWithImpl<$Res> implements _$CartMdlCopyWith<$Res> {
  __$CartMdlCopyWithImpl(this._self, this._then);

  final _CartMdl _self;
  final $Res Function(_CartMdl) _then;

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? products = null,
  }) {
    return _then(_CartMdl(
      products: null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Empty implements Cart {
  const _Empty({final String? $type}) : $type = $type ?? 'empty';

  factory _Empty.fromJson(Map<String, dynamic> json) => _$EmptyFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  Map<String, dynamic> toJson() {
    return _$EmptyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Empty);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Cart.empty()';
  }
}

// dart format on
