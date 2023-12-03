import '../models/category.dart';
import '../api/base_api.dart';

class CategoriesApi extends BaseApi {
  Future<List<Category>> getList() async {
    final response = await get('common/category/list');
    final List<dynamic> data = response.data['categories'];
    return data.map((e) => Category.fromJson(e)).toList();
  }
}
