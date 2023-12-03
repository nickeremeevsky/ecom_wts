import 'package:flutter/material.dart';
import '../models/category.dart';
import '../widgets/network_error.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  final Category category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: NetworkError(
                imageUrl: category.imageUrl,
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                category.title.toUpperCase(),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
