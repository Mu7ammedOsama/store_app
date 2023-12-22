// api
import 'package:store_app/helpers/api.dart';

// models
import 'package:store_app/models/productModel.dart';

class AddProducts {
  Future<ProductModel> addProducts({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await API().post(
      url: 'https://fakestoreapi.com/products',
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
