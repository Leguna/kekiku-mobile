// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_mdl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String?,
      label: json['label'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
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
      address: _$JsonConverterFromJson<Map<String, dynamic>, Address>(
              json['address'], const MyJsonConverter().fromJson) ??
          const Address(),
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      variants: json['variants'] == null
          ? const []
          : _variantListFromJson(json['variants'] as List?),
      reviews: json['reviews'] == null
          ? const []
          : _reviewListFromJson(json['reviews'] as List?),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'label': instance.label,
      'price': instance.price,
      'description': instance.description,
      'tags': instance.tags,
      'ingredients': instance.ingredients,
      'discount': instance.discount,
      'rating': instance.rating,
      'stock': instance.stock,
      'sold': instance.sold,
      'isFavorite': instance.isFavorite,
      'video': instance.video,
      'image': instance.image,
      'address': _$JsonConverterToJson<Map<String, dynamic>, Address>(
          instance.address, const MyJsonConverter().toJson),
      'categories': instance.categories,
      'variants': _variantListToJson(instance.variants),
      'reviews': _reviewListToJson(instance.reviews),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$VariantImpl _$$VariantImplFromJson(Map<String, dynamic> json) =>
    _$VariantImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      stock: (json['stock'] as num?)?.toInt(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$VariantImplToJson(_$VariantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'stock': instance.stock,
      'image': instance.image,
    };

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rating': instance.rating,
      'comment': instance.comment,
    };

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      long: (json['long'] as num?)?.toDouble() ?? 0.0,
      name: json['name'] as String? ?? '',
      physicalAddress: json['physicalAddress'] as String? ?? '',
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
      'name': instance.name,
      'physicalAddress': instance.physicalAddress,
    };
