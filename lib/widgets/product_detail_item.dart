import 'package:flutter/material.dart';
import '../models/product_detail.dart';
import '../widgets/network_error.dart';


class ProductDetailItem extends StatelessWidget {
  final ProductDetail product;

  const ProductDetailItem({Key? key, required this.product}) : super(key: key);

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
            NetworkError(imageUrl: product.imageUrl),
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
