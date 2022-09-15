// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: json['price'] as num?,
      category: json['category'] as String?,
      rating: (json['rating'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      description: json['description'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'category': instance.category,
      'rating': instance.rating,
      'description': instance.description,
      'image': instance.image,
    };
