// helpers
import 'package:store_app/helpers/api.dart';

// models
import 'package:store_app/models/productModel.dart';

class CategoriesServices {
  Future<List<ProductModel>> categoriesServices({required String categoryName}) async {
    List<dynamic> data = await API().get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> productsList = [];
    for (int i = 0; i < productsList.length; i++) {
      productsList.add(ProductModel.fromJSON(data[i]));
    }
    return productsList;
  }
}
