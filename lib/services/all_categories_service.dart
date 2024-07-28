import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> allCategoriesService() async {
    List<dynamic> body =
        await Api().get(url: 'https://fakestoreapi.com/products');
    return body;
  }
}
