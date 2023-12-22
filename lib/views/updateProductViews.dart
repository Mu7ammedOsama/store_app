import 'package:flutter/material.dart';

// dependencies
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// models
import 'package:store_app/models/productModel.dart';

// services
import 'package:store_app/services/updateProducts.dart';

// widgets
import 'package:store_app/widgets/customTextField.dart';
import 'package:store_app/widgets/customButton.dart';

class UpdateProductViews extends StatefulWidget {
  const UpdateProductViews({super.key});

  static String id = 'updateProduct';

  @override
  State<UpdateProductViews> createState() => _UpdateProductViewsState();
}

class _UpdateProductViewsState extends State<UpdateProductViews> {
  String? name, description, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel? product = ModalRoute.of(context)!.settings.arguments as ProductModel?;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 96),
                CustomTextField(
                  onChange: (data) => name = data,
                  hintText: 'Product Name....',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  onChange: (data) => description = data,
                  hintText: 'Product Description....',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  onChange: (data) => image = data,
                  hintText: 'Product Image....',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  onChange: (data) => price = data,
                  hintText: 'Product Price....',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 64),
                CustomButton(
                  text: 'Update',
                  onTap: () async {
                    setState(() => isLoading = true);
                    try {
                      await updateProduct(product!);
                    } catch (e) {
                      throw e.toString();
                    }
                    setState(() => isLoading = false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductsServices().updateProductsServices(
      title: name == null ? product.title : name!,
      price: price == null ? product.price.toString() : price!,
      description: description == null ? product.description : description!,
      image: image == null ? product.image : image!,
      category: product.category,
      id: product.id,
    );
  }
}
