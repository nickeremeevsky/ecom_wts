import 'package:flutter/material.dart';
import '../models/product_detail.dart';

class ProductDetailPageArgs {
  final String title;
  final int productId;
  final String imageUrl;
  final String productDescription;

  ProductDetailPageArgs(
      this.title,
      this.productId,
      this.imageUrl,
      this.productDescription,
      );
}

class ProductDetailPage extends StatelessWidget {
  static const routeName = '/productDetail';

  final ProductDetail product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ДЕТАЛИ ТОВАРА'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUrl),
            const SizedBox(height: 16),
            Text(
              product.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('ID: ${product.productId}'),
            const SizedBox(height: 8),
            Text(product.productDescription),
          ],
        ),
      ),
    );
  }
}
