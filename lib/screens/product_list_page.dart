// product_list_page.dart
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/product_detail.dart';
import '../provider/product_list_provider.dart';
import '../widgets/product_item.dart';
import '../widgets/product_detail_item.dart';

class ProductListPageArgs {
  final String title;
  final int id;

  ProductListPageArgs(this.title, this.id);
}

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  static const routeName = "/products";

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late String title;
  late int categoryId;
  late ProductListProvider provider;
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final settings = ModalRoute.of(context)!.settings;
    final args = settings.arguments as ProductListPageArgs;

    title = args.title;
    categoryId = args.id;

    provider = ProductListProvider(categoryId: categoryId);
    provider.loadMoreItems();

    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      // Пользователь достиг конца списка, загружаем дополнительные товары
      provider.loadMoreItems();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title.toUpperCase()),
      ),
      body: ValueListenableBuilder(
        valueListenable: provider,
        builder: (context, List<Product> products, child) {
          if (products.isEmpty) {
            return const CircularProgressIndicator();
          }

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                // Navigate to the product details page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailItem(product: ProductDetail(
                      imageUrl: products[index].imageUrl,
                      productId: products[index].productId,
                      title: products[index].title,
                      productDescription: products[index].title,
                    )),
                  ),
                );
              },
              child: ProductItem(
                product: products[index],
              ),
            ),
            controller: _scrollController,
          );
        },
      ),
    );
  }
}

