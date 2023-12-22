// api
import 'package:store_app/helpers/api.dart';

// models
import 'package:store_app/models/productModel.dart';

class UpdateProductsServices {
  Future<ProductModel> updateProductsServices({
    required int id,
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await API().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromJSON(data);
  }
}
