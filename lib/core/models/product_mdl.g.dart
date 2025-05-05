// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_mdl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      label: json['label'] as String?,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      description: json['description'] as String?,
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      discount: (json['discount'] as num?)?.toDouble() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      stock: (json['stock'] as num?)?.toInt() ?? 0,
      sold: (json['sold'] as num?)?.toInt() ?? 0,
      isFavorite: json['isFavorite'] as bool? ?? false,
      video: json['video'] as String?,
      image: json['image'] as String?,
      address: json['address'] == null
          ? const Address()
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      variants: json['variants'] == null
          ? const []
          : _variantListFromJson(json['variants'] as List?),
      selectedVariant: json['selectedVariant'] == null
          ? null
          : Variant.fromJson(json['selectedVariant'] as Map<String, dynamic>),
      reviews: json['reviews'] == null
          ? const []
          : _reviewListFromJson(json['reviews'] as List?),
    );

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'label': instance.label,
      'price': instance.price,
      'description': instance.description,
      'quantity': instance.quantity,
      'tags': instance.tags,
      'ingredients': instance.ingredients,
      'discount': instance.discount,
      'rating': instance.rating,
      'stock': instance.stock,
      'sold': instance.sold,
      'isFavorite': instance.isFavorite,
      'video': instance.video,
      'image': instance.image,
      'address': instance.address,
      'categories': instance.categories,
      'variants': _variantListToJson(instance.variants),
      'selectedVariant': instance.selectedVariant,
      'reviews': _reviewListToJson(instance.reviews),
    };

_Variant _$VariantFromJson(Map<String, dynamic> json) => _Variant(
      id: json['id'] as String? ?? '',
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      stock: (json['stock'] as num?)?.toInt(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$VariantToJson(_Variant instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'stock': instance.stock,
      'image': instance.image,
    };

_Review _$ReviewFromJson(Map<String, dynamic> json) => _Review(
      id: json['id'] as String? ?? '',
      name: json['name'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$ReviewToJson(_Review instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rating': instance.rating,
      'comment': instance.comment,
    };

_Address _$AddressFromJson(Map<String, dynamic> json) => _Address(
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      long: (json['long'] as num?)?.toDouble() ?? 0.0,
      name: json['name'] as String? ?? '',
      physicalAddress: json['physicalAddress'] as String? ?? '',
    );

Map<String, dynamic> _$AddressToJson(_Address instance) => <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
      'name': instance.name,
      'physicalAddress': instance.physicalAddress,
    };
