import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';

class AllProductsService {
  Future<List<ProductsModel>> allProductsService() async {
    List<dynamic> body =
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<ProductsModel> productsList = [];
    for (var element in body) {
      productsList.add(ProductsModel.fromJson(element));
    }
    return productsList;
  }
}
