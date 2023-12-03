import 'package:json_annotation/json_annotation.dart';

part 'product_detail.g.dart';

@JsonSerializable()
class ProductDetail {
  String imageUrl;
  int productId;
  String title;
  String productDescription;

  ProductDetail({
    required this.imageUrl,
    required this.productId,
    required this.title,
    required this.productDescription,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailToJson(this);
}