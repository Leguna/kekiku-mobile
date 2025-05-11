// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_mdl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Product {
  String get id;
  String get name;
  String? get label;
  double get price;
  String? get description;
  int get quantity;
  List<String>? get tags;
  List<String>? get ingredients;
  double get discount;
  double? get rating;
  int get stock;
  int get sold;
  bool get isFavorite;
  String? get video;
  String? get image;
  Address? get address;
  List<String>? get categories;
  @JsonKey(fromJson: _variantListFromJson, toJson: _variantListToJson)
  List<Variant> get variants;
  @JsonKey(fromJson: _reviewListFromJson, toJson: _reviewListToJson)
  List<Review> get reviews;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductCopyWith<Product> get copyWith =>
      _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Product &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality()
                .equals(other.ingredients, ingredients) &&
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
                .equals(other.categories, categories) &&
            const DeepCollectionEquality().equals(other.variants, variants) &&
            const DeepCollectionEquality().equals(other.reviews, reviews));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        label,
        price,
        description,
        quantity,
        const DeepCollectionEquality().hash(tags),
        const DeepCollectionEquality().hash(ingredients),
        discount,
        rating,
        stock,
        sold,
        isFavorite,
        video,
        image,
        address,
        const DeepCollectionEquality().hash(categories),
        const DeepCollectionEquality().hash(variants),
        const DeepCollectionEquality().hash(reviews)
      ]);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, label: $label, price: $price, description: $description, quantity: $quantity, tags: $tags, ingredients: $ingredients, discount: $discount, rating: $rating, stock: $stock, sold: $sold, isFavorite: $isFavorite, video: $video, image: $image, address: $address, categories: $categories, variants: $variants, reviews: $reviews)';
  }
}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) =
      _$ProductCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String? label,
      double price,
      String? description,
      int quantity,
      List<String>? tags,
      List<String>? ingredients,
      double discount,
      double? rating,
      int stock,
      int sold,
      bool isFavorite,
      String? video,
      String? image,
      Address? address,
      List<String>? categories,
      @JsonKey(fromJson: _variantListFromJson, toJson: _variantListToJson)
      List<Variant> variants,
      @JsonKey(fromJson: _reviewListFromJson, toJson: _reviewListToJson)
      List<Review> reviews});

  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? label = freezed,
    Object? price = null,
    Object? description = freezed,
    Object? quantity = null,
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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: freezed == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      ingredients: freezed == ingredients
          ? _self.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      stock: null == stock
          ? _self.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      sold: null == sold
          ? _self.sold
          : sold // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      video: freezed == video
          ? _self.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      categories: freezed == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      variants: null == variants
          ? _self.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<Variant>,
      reviews: null == reviews
          ? _self.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
    ));
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_self.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_self.address!, (value) {
      return _then(_self.copyWith(address: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Product extends Product {
  const _Product(
      {this.id = '',
      this.name = '',
      this.label,
      this.price = 0,
      this.description,
      this.quantity = 1,
      final List<String>? tags = const [],
      final List<String>? ingredients = const [],
      this.discount = 0,
      this.rating = 0,
      this.stock = 0,
      this.sold = 0,
      this.isFavorite = false,
      this.video,
      this.image,
      this.address = const Address(),
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
  factory _Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  final String? label;
  @override
  @JsonKey()
  final double price;
  @override
  final String? description;
  @override
  @JsonKey()
  final int quantity;
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

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductCopyWith<_Product> get copyWith =>
      __$ProductCopyWithImpl<_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Product &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
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
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        label,
        price,
        description,
        quantity,
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
        const DeepCollectionEquality().hash(_reviews)
      ]);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, label: $label, price: $price, description: $description, quantity: $quantity, tags: $tags, ingredients: $ingredients, discount: $discount, rating: $rating, stock: $stock, sold: $sold, isFavorite: $isFavorite, video: $video, image: $image, address: $address, categories: $categories, variants: $variants, reviews: $reviews)';
  }
}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) =
      __$ProductCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? label,
      double price,
      String? description,
      int quantity,
      List<String>? tags,
      List<String>? ingredients,
      double discount,
      double? rating,
      int stock,
      int sold,
      bool isFavorite,
      String? video,
      String? image,
      Address? address,
      List<String>? categories,
      @JsonKey(fromJson: _variantListFromJson, toJson: _variantListToJson)
      List<Variant> variants,
      @JsonKey(fromJson: _reviewListFromJson, toJson: _reviewListToJson)
      List<Review> reviews});

  @override
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$ProductCopyWithImpl<$Res> implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? label = freezed,
    Object? price = null,
    Object? description = freezed,
    Object? quantity = null,
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
    return _then(_Product(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: freezed == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      tags: freezed == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      ingredients: freezed == ingredients
          ? _self._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      stock: null == stock
          ? _self.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      sold: null == sold
          ? _self.sold
          : sold // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      video: freezed == video
          ? _self.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      categories: freezed == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      variants: null == variants
          ? _self._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<Variant>,
      reviews: null == reviews
          ? _self._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
    ));
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_self.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_self.address!, (value) {
      return _then(_self.copyWith(address: value));
    });
  }
}

/// @nodoc
mixin _$Variant {
  String get id;
  String? get name;
  double get price;
  int? get stock;
  String? get image;

  /// Create a copy of Variant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VariantCopyWith<Variant> get copyWith =>
      _$VariantCopyWithImpl<Variant>(this as Variant, _$identity);

  /// Serializes this Variant to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Variant &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price, stock, image);

  @override
  String toString() {
    return 'Variant(id: $id, name: $name, price: $price, stock: $stock, image: $image)';
  }
}

/// @nodoc
abstract mixin class $VariantCopyWith<$Res> {
  factory $VariantCopyWith(Variant value, $Res Function(Variant) _then) =
      _$VariantCopyWithImpl;
  @useResult
  $Res call({String id, String? name, double price, int? stock, String? image});
}

/// @nodoc
class _$VariantCopyWithImpl<$Res> implements $VariantCopyWith<$Res> {
  _$VariantCopyWithImpl(this._self, this._then);

  final Variant _self;
  final $Res Function(Variant) _then;

  /// Create a copy of Variant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? price = null,
    Object? stock = freezed,
    Object? image = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      stock: freezed == stock
          ? _self.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Variant implements Variant {
  const _Variant(
      {this.id = '', this.name, this.price = 0, this.stock, this.image});
  factory _Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final String? name;
  @override
  @JsonKey()
  final double price;
  @override
  final int? stock;
  @override
  final String? image;

  /// Create a copy of Variant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VariantCopyWith<_Variant> get copyWith =>
      __$VariantCopyWithImpl<_Variant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VariantToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Variant &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price, stock, image);

  @override
  String toString() {
    return 'Variant(id: $id, name: $name, price: $price, stock: $stock, image: $image)';
  }
}

/// @nodoc
abstract mixin class _$VariantCopyWith<$Res> implements $VariantCopyWith<$Res> {
  factory _$VariantCopyWith(_Variant value, $Res Function(_Variant) _then) =
      __$VariantCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String? name, double price, int? stock, String? image});
}

/// @nodoc
class __$VariantCopyWithImpl<$Res> implements _$VariantCopyWith<$Res> {
  __$VariantCopyWithImpl(this._self, this._then);

  final _Variant _self;
  final $Res Function(_Variant) _then;

  /// Create a copy of Variant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? price = null,
    Object? stock = freezed,
    Object? image = freezed,
  }) {
    return _then(_Variant(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      stock: freezed == stock
          ? _self.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$Review {
  String get id;
  String? get name;
  double? get rating;
  String? get comment;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewCopyWith<Review> get copyWith =>
      _$ReviewCopyWithImpl<Review>(this as Review, _$identity);

  /// Serializes this Review to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Review &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, rating, comment);

  @override
  String toString() {
    return 'Review(id: $id, name: $name, rating: $rating, comment: $comment)';
  }
}

/// @nodoc
abstract mixin class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) _then) =
      _$ReviewCopyWithImpl;
  @useResult
  $Res call({String id, String? name, double? rating, String? comment});
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res> implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._self, this._then);

  final Review _self;
  final $Res Function(Review) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Review implements Review {
  const _Review({this.id = '', this.name, this.rating, this.comment});
  factory _Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final String? name;
  @override
  final double? rating;
  @override
  final String? comment;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewCopyWith<_Review> get copyWith =>
      __$ReviewCopyWithImpl<_Review>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Review &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, rating, comment);

  @override
  String toString() {
    return 'Review(id: $id, name: $name, rating: $rating, comment: $comment)';
  }
}

/// @nodoc
abstract mixin class _$ReviewCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$ReviewCopyWith(_Review value, $Res Function(_Review) _then) =
      __$ReviewCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String? name, double? rating, String? comment});
}

/// @nodoc
class __$ReviewCopyWithImpl<$Res> implements _$ReviewCopyWith<$Res> {
  __$ReviewCopyWithImpl(this._self, this._then);

  final _Review _self;
  final $Res Function(_Review) _then;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? rating = freezed,
    Object? comment = freezed,
  }) {
    return _then(_Review(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$Address {
  double? get lat;
  double? get long;
  String? get name;
  String? get physicalAddress;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddressCopyWith<Address> get copyWith =>
      _$AddressCopyWithImpl<Address>(this as Address, _$identity);

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Address &&
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

  @override
  String toString() {
    return 'Address(lat: $lat, long: $long, name: $name, physicalAddress: $physicalAddress)';
  }
}

/// @nodoc
abstract mixin class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) _then) =
      _$AddressCopyWithImpl;
  @useResult
  $Res call({double? lat, double? long, String? name, String? physicalAddress});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res> implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._self, this._then);

  final Address _self;
  final $Res Function(Address) _then;

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
    return _then(_self.copyWith(
      lat: freezed == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      long: freezed == long
          ? _self.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      physicalAddress: freezed == physicalAddress
          ? _self.physicalAddress
          : physicalAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Address implements Address {
  const _Address(
      {this.lat = 0.0,
      this.long = 0.0,
      this.name = '',
      this.physicalAddress = ''});
  factory _Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

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

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddressCopyWith<_Address> get copyWith =>
      __$AddressCopyWithImpl<_Address>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AddressToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Address &&
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

  @override
  String toString() {
    return 'Address(lat: $lat, long: $long, name: $name, physicalAddress: $physicalAddress)';
  }
}

/// @nodoc
abstract mixin class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) _then) =
      __$AddressCopyWithImpl;
  @override
  @useResult
  $Res call({double? lat, double? long, String? name, String? physicalAddress});
}

/// @nodoc
class __$AddressCopyWithImpl<$Res> implements _$AddressCopyWith<$Res> {
  __$AddressCopyWithImpl(this._self, this._then);

  final _Address _self;
  final $Res Function(_Address) _then;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lat = freezed,
    Object? long = freezed,
    Object? name = freezed,
    Object? physicalAddress = freezed,
  }) {
    return _then(_Address(
      lat: freezed == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      long: freezed == long
          ? _self.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      physicalAddress: freezed == physicalAddress
          ? _self.physicalAddress
          : physicalAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
