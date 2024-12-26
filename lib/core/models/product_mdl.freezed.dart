// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_mdl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  List<String>? get ingredients => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  int get stock => throw _privateConstructorUsedError;
  int get sold => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  String? get video => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  @MyJsonConverter()
  Address? get address => throw _privateConstructorUsedError;
  List<String>? get categories => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _variantListFromJson, toJson: _variantListToJson)
  List<Variant> get variants => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _reviewListFromJson, toJson: _reviewListToJson)
  List<Review> get reviews => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {String id,
      String? name,
      String? label,
      double? price,
      String? description,
      List<String>? tags,
      List<String>? ingredients,
      double discount,
      double? rating,
      int stock,
      int sold,
      bool isFavorite,
      String? video,
      String? image,
      @MyJsonConverter() Address? address,
      List<String>? categories,
      @JsonKey(fromJson: _variantListFromJson, toJson: _variantListToJson)
      List<Variant> variants,
      @JsonKey(fromJson: _reviewListFromJson, toJson: _reviewListToJson)
      List<Review> reviews});

  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? label = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? tags = freezed,
    Object? ingredients = freezed,
    Object? discount = null,
    Object? rating = freezed,
    Object? stock = null,
    Object? sold = null,
    Object? isFavorite = null,
    Object? video = freezed,
    Object? image = freezed,
    Object? address = freezed,
    Object? categories = freezed,
    Object? variants = null,
    Object? reviews = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      ingredients: freezed == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      sold: null == sold
          ? _value.sold
          : sold // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      variants: null == variants
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<Variant>,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
    ) as $Val);
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? name,
      String? label,
      double? price,
      String? description,
      List<String>? tags,
      List<String>? ingredients,
      double discount,
      double? rating,
      int stock,
      int sold,
      bool isFavorite,
      String? video,
      String? image,
      @MyJsonConverter() Address? address,
      List<String>? categories,
      @JsonKey(fromJson: _variantListFromJson, toJson: _variantListToJson)
      List<Variant> variants,
      @JsonKey(fromJson: _reviewListFromJson, toJson: _reviewListToJson)
      List<Review> reviews});

  @override
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? label = freezed,
    Object? price = freezed,
    Object? description = freezed,
    Object? tags = freezed,
    Object? ingredients = freezed,
    Object? discount = null,
    Object? rating = freezed,
    Object? stock = null,
    Object? sold = null,
    Object? isFavorite = null,
    Object? video = freezed,
    Object? image = freezed,
    Object? address = freezed,
    Object? categories = freezed,
    Object? variants = null,
    Object? reviews = null,
  }) {
    return _then(_$ProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      ingredients: freezed == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      sold: null == sold
          ? _value.sold
          : sold // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      variants: null == variants
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<Variant>,
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl extends _Product {
  const _$ProductImpl(
      {this.id = '',
      this.name,
      this.label,
      this.price,
      this.description,
      final List<String>? tags = const [],
      final List<String>? ingredients = const [],
      this.discount = 0,
      this.rating = 0,
      this.stock = 0,
      this.sold = 0,
      this.isFavorite = false,
      this.video,
      this.image,
      @MyJsonConverter() this.address = const Address(),
      final List<String>? categories = const [],
      @JsonKey(fromJson: _variantListFromJson, toJson: _variantListToJson)
      final List<Variant> variants = const [],
      @JsonKey(fromJson: _reviewListFromJson, toJson: _reviewListToJson)
      final List<Review> reviews = const []})
      : _tags = tags,
        _ingredients = ingredients,
        _categories = categories,
        _variants = variants,
        _reviews = reviews,
        super._();

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final String? name;
  @override
  final String? label;
  @override
  final double? price;
  @override
  final String? description;
  final List<String>? _tags;
  @override
  @JsonKey()
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _ingredients;
  @override
  @JsonKey()
  List<String>? get ingredients {
    final value = _ingredients;
    if (value == null) return null;
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final double discount;
  @override
  @JsonKey()
  final double? rating;
  @override
  @JsonKey()
  final int stock;
  @override
  @JsonKey()
  final int sold;
  @override
  @JsonKey()
  final bool isFavorite;
  @override
  final String? video;
  @override
  final String? image;
  @override
  @JsonKey()
  @MyJsonConverter()
  final Address? address;
  final List<String>? _categories;
  @override
  @JsonKey()
  List<String>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Variant> _variants;
  @override
  @JsonKey(fromJson: _variantListFromJson, toJson: _variantListToJson)
  List<Variant> get variants {
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variants);
  }

  final List<Review> _reviews;
  @override
  @JsonKey(fromJson: _reviewListFromJson, toJson: _reviewListToJson)
  List<Review> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, label: $label, price: $price, description: $description, tags: $tags, ingredients: $ingredients, discount: $discount, rating: $rating, stock: $stock, sold: $sold, isFavorite: $isFavorite, video: $video, image: $image, address: $address, categories: $categories, variants: $variants, reviews: $reviews)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.sold, sold) || other.sold == sold) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._variants, _variants) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      label,
      price,
      description,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_ingredients),
      discount,
      rating,
      stock,
      sold,
      isFavorite,
      video,
      image,
      address,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_variants),
      const DeepCollectionEquality().hash(_reviews));

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product extends Product {
  const factory _Product(
      {final String id,
      final String? name,
      final String? label,
      final double? price,
      final String? description,
      final List<String>? tags,
      final List<String>? ingredients,
      final double discount,
      final double? rating,
      final int stock,
      final int sold,
      final bool isFavorite,
      final String? video,
      final String? image,
      @MyJsonConverter() final Address? address,
      final List<String>? categories,
      @JsonKey(fromJson: _variantListFromJson, toJson: _variantListToJson)
      final List<Variant> variants,
      @JsonKey(fromJson: _reviewListFromJson, toJson: _reviewListToJson)
      final List<Review> reviews}) = _$ProductImpl;
  const _Product._() : super._();

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  String? get label;
  @override
  double? get price;
  @override
  String? get description;
  @override
  List<String>? get tags;
  @override
  List<String>? get ingredients;
  @override
  double get discount;
  @override
  double? get rating;
  @override
  int get stock;
  @override
  int get sold;
  @override
  bool get isFavorite;
  @override
  String? get video;
  @override
  String? get image;
  @override
  @MyJsonConverter()
  Address? get address;
  @override
  List<String>? get categories;
  @override
  @JsonKey(fromJson: _variantListFromJson, toJson: _variantListToJson)
  List<Variant> get variants;
  @override
  @JsonKey(fromJson: _reviewListFromJson, toJson: _reviewListToJson)
  List<Review> get reviews;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Variant _$VariantFromJson(Map<String, dynamic> json) {
  return _Variant.fromJson(json);
}

/// @nodoc
mixin _$Variant {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  int? get stock => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this Variant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Variant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VariantCopyWith<Variant> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantCopyWith<$Res> {
  factory $VariantCopyWith(Variant value, $Res Function(Variant) then) =
      _$VariantCopyWithImpl<$Res, Variant>;
  @useResult
  $Res call(
      {String id, String? name, double? price, int? stock, String? image});
}

/// @nodoc
class _$VariantCopyWithImpl<$Res, $Val extends Variant>
    implements $VariantCopyWith<$Res> {
  _$VariantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Variant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? price = freezed,
    Object? stock = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VariantImplCopyWith<$Res> implements $VariantCopyWith<$Res> {
  factory _$$VariantImplCopyWith(
          _$VariantImpl value, $Res Function(_$VariantImpl) then) =
      __$$VariantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String? name, double? price, int? stock, String? image});
}

/// @nodoc
class __$$VariantImplCopyWithImpl<$Res>
    extends _$VariantCopyWithImpl<$Res, _$VariantImpl>
    implements _$$VariantImplCopyWith<$Res> {
  __$$VariantImplCopyWithImpl(
      _$VariantImpl _value, $Res Function(_$VariantImpl) _then)
      : super(_value, _then);

  /// Create a copy of Variant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? price = freezed,
    Object? stock = freezed,
    Object? image = freezed,
  }) {
    return _then(_$VariantImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VariantImpl implements _Variant {
  const _$VariantImpl(
      {this.id = '', this.name, this.price, this.stock, this.image});

  factory _$VariantImpl.fromJson(Map<String, dynamic> json) =>
      _$$VariantImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final String? name;
  @override
  final double? price;
  @override
  final int? stock;
  @override
  final String? image;

  @override
  String toString() {
    return 'Variant(id: $id, name: $name, price: $price, stock: $stock, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VariantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price, stock, image);

  /// Create a copy of Variant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VariantImplCopyWith<_$VariantImpl> get copyWith =>
      __$$VariantImplCopyWithImpl<_$VariantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VariantImplToJson(
      this,
    );
  }
}

abstract class _Variant implements Variant {
  const factory _Variant(
      {final String id,
      final String? name,
      final double? price,
      final int? stock,
      final String? image}) = _$VariantImpl;

  factory _Variant.fromJson(Map<String, dynamic> json) = _$VariantImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  double? get price;
  @override
  int? get stock;
  @override
  String? get image;

  /// Create a copy of Variant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VariantImplCopyWith<_$VariantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;

  /// Serializes this Review to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call({String id, String? name, double? rating, String? comment});
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? rating = freezed,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewImplCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$ReviewImplCopyWith(
          _$ReviewImpl value, $Res Function(_$ReviewImpl) then) =
      __$$ReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? name, double? rating, String? comment});
}

/// @nodoc
class __$$ReviewImplCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$ReviewImpl>
    implements _$$ReviewImplCopyWith<$Res> {
  __$$ReviewImplCopyWithImpl(
      _$ReviewImpl _value, $Res Function(_$ReviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? rating = freezed,
    Object? comment = freezed,
  }) {
    return _then(_$ReviewImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewImpl implements _Review {
  const _$ReviewImpl({this.id = '', this.name, this.rating, this.comment});

  factory _$ReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final String? name;
  @override
  final double? rating;
  @override
  final String? comment;

  @override
  String toString() {
    return 'Review(id: $id, name: $name, rating: $rating, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, rating, comment);

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      __$$ReviewImplCopyWithImpl<_$ReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewImplToJson(
      this,
    );
  }
}

abstract class _Review implements Review {
  const factory _Review(
      {final String id,
      final String? name,
      final double? rating,
      final String? comment}) = _$ReviewImpl;

  factory _Review.fromJson(Map<String, dynamic> json) = _$ReviewImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  double? get rating;
  @override
  String? get comment;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  double? get lat => throw _privateConstructorUsedError;

  double? get long => throw _privateConstructorUsedError;

  String? get name => throw _privateConstructorUsedError;

  String? get physicalAddress => throw _privateConstructorUsedError;

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;

  @useResult
  $Res call({double? lat, double? long, String? name, String? physicalAddress});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? long = freezed,
    Object? name = freezed,
    Object? physicalAddress = freezed,
  }) {
    return _then(_value.copyWith(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      physicalAddress: freezed == physicalAddress
          ? _value.physicalAddress
          : physicalAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
          _$AddressImpl value, $Res Function(_$AddressImpl) then) =
      __$$AddressImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({double? lat, double? long, String? name, String? physicalAddress});
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
      _$AddressImpl _value, $Res Function(_$AddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? long = freezed,
    Object? name = freezed,
    Object? physicalAddress = freezed,
  }) {
    return _then(_$AddressImpl(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      physicalAddress: freezed == physicalAddress
          ? _value.physicalAddress
          : physicalAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl implements _Address {
  const _$AddressImpl(
      {this.lat = 0.0,
      this.long = 0.0,
      this.name = '',
      this.physicalAddress = ''});

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  @JsonKey()
  final double? lat;
  @override
  @JsonKey()
  final double? long;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final String? physicalAddress;

  @override
  String toString() {
    return 'Address(lat: $lat, long: $long, name: $name, physicalAddress: $physicalAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.physicalAddress, physicalAddress) ||
                other.physicalAddress == physicalAddress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lat, long, name, physicalAddress);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  const factory _Address(
      {final double? lat,
      final double? long,
      final String? name,
      final String? physicalAddress}) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  double? get lat;

  @override
  double? get long;

  @override
  String? get name;

  @override
  String? get physicalAddress;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
