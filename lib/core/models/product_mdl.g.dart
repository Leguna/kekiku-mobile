// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_mdl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toInt(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tag: json['tag'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0,
      stock: (json['stock'] as num?)?.toInt() ?? 0,
      sold: (json['sold'] as num?)?.toInt() ?? 0,
      label: json['label'] as String?,
      address: json['address'] as String?,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'categories': instance.categories,
      'tag': instance.tag,
      'description': instance.description,
      'image': instance.image,
      'rating': instance.rating,
      'discount': instance.discount,
      'stock': instance.stock,
      'sold': instance.sold,
      'label': instance.label,
      'address': instance.address,
      'isFavorite': instance.isFavorite,
    };
