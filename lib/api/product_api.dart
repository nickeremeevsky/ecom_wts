
import '../api/base_api.dart';
import '../models/product.dart';
import '../models/product_detail.dart';

class ProductsApi extends BaseApi {
  Future<List<Product>> getProducts(int id, int offset) async {
    final response = await get('common/product/list', params: {
      'categoryId': id.toString(),
      'offset': offset.toString(),
    });
    final List<dynamic> data = response.data;

    return data.map((e) => Product.fromJson(e)).toList();
  }

  Future<List<ProductDetail>> getProductDetails(int productId) async {
    final response = await get('common/product/details', params: {
      'productId': productId.toString(),

    });
    final List<dynamic> data = response.data;

    return data.map((e) => ProductDetail.fromJson(e)).toList();
  }
}
