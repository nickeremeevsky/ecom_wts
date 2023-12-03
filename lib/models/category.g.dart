// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      categoryId: json['categoryId'] as int,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'categoryId': instance.categoryId,
    };
