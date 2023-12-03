import 'package:flutter/material.dart';
import '../provider/category_grid_provider.dart';
import '../models/category.dart';
import '../widgets/category_item.dart';
import '../screens/product_list_page.dart';

class CategoryGridPage extends StatefulWidget {
  const CategoryGridPage({Key? key}) : super(key: key);

  static const routeName = '/categories';

  @override
  State<CategoryGridPage> createState() => _CategoryGridPageState();
}

class _CategoryGridPageState extends State<CategoryGridPage> {
  late CategoryGridProvider provider;

  @override
  void initState() {
    super.initState();
    provider = CategoryGridProvider();
    provider.loadItems();
  }

  @override
  void dispose() {
    provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('КАТАЛОГ ТОВАРОВ'),
      ),
      body: ValueListenableBuilder(
        valueListenable: provider,
        builder: (context, List<Category> categories, child) {
          if (categories.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategoryGridItem(
                category: category,
                onTap: () => Navigator.pushNamed(
                  context,
                  ProductListPage.routeName,
                  arguments: ProductListPageArgs(
                    category.title,
                    category.categoryId,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
