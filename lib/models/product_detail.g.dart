// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetail _$ProductDetailFromJson(Map<String, dynamic> json) => ProductDetail(
  imageUrl: json['imageUrl'] as String,
  productId: json['productId'] as int,
  title: json['title'] as String,
  productDescription: json['productDescription'] as String,
);

Map<String, dynamic> _$ProductDetailToJson(ProductDetail instance) => <String, dynamic>{
  'imageUrl': instance.imageUrl,
  'productId': instance.productId,
  'title': instance.title,
  'productDescription': instance.productDescription,
};