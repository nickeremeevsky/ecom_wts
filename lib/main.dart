import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/category_grid_page.dart';
import 'screens/product_list_page.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: CategoryGridPage.routeName,
      routes: {
        CategoryGridPage.routeName: (context) => const CategoryGridPage(),
        ProductListPage.routeName: (context) => const ProductListPage(),

      },
    );
  }
}
