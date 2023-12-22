import 'package:flutter/material.dart';

// models
import 'package:store_app/models/productModel.dart';

// services
import 'package:store_app/services/getAllProductsServices.dart';

// widgets
import 'package:store_app/widgets/customCard.dart';

class HomeViews extends StatelessWidget {
  const HomeViews({super.key});

  static String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('New Trend'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 64,
          right: 16,
          left: 16,
        ),
        child: FutureBuilder<List<ProductModel>>(
          future: GetAllProductsServices().getAllProductsServices(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 64,
                ),
                itemBuilder: (context, index) => CustomCard(product: products[index]),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
