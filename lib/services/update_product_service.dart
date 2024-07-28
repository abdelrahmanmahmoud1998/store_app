import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';

class UpdateProductService {
  Future<ProductsModel> updateProductService({
    required dynamic id,
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    print('Product id = $id, price = $price');
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'image': image,
      'description': description,
      'category': category,
    });
    return ProductsModel.fromJson(data);
  }
}
