// product_list_provider.dart
import 'package:flutter/material.dart';
import '../api/product_api.dart';
import '../models/product.dart';

class ProductListProvider extends ValueNotifier<List<Product>> {
  ProductListProvider({required this.categoryId}) : super([]);

  ProductsApi api = ProductsApi();

  int categoryId;
  bool isLoading = false;
  bool isLoadedAll = false;

  Future<void> loadMoreItems() async {
    if (isLoading || isLoadedAll) return;

    isLoading = true;

    List<Product> products = await api.getProducts(categoryId, value.length);
    value.addAll(products);

    isLoading = false;

    if (products.isEmpty) {
      isLoadedAll = true;
    }

    notifyListeners();
  }

  Future<void> reload() async {
    if (isLoading) return;

    value.clear();
    isLoadedAll = false;
    notifyListeners();
    await loadMoreItems();
  }
}
