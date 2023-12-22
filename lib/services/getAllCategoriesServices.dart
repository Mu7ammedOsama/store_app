// helpers
import 'package:store_app/helpers/api.dart';

class GetAllCategoriesServices {
  Future<List<dynamic>> getAllCategoriesServices() async {
    List<dynamic> data = await API().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
