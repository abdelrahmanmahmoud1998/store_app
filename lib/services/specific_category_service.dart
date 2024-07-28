import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';

class SpecificCategoryService {
  Future<List<ProductsModel>> specificCategoryService(
      {required String category}) async {
    List<dynamic> body = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$category');
    List<ProductsModel> productsList = [];
    for (var element in body) {
      productsList.add(ProductsModel.fromJson(element));
    }
    return productsList;
  }
}
