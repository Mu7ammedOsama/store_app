// helpers
import 'package:store_app/helpers/api.dart';

// models
import 'package:store_app/models/productModel.dart';

class GetAllProductsServices {
  Future<List<ProductModel>> getAllProductsServices() async {
    List<dynamic> data = await API().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productsList = [];
    for (int i = 0; i < productsList.length; i++) {
      productsList.add(ProductModel.fromJSON(data[i]));
    }
    return productsList;
  }
}
