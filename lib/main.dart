import 'package:flutter/material.dart';

// views
import 'package:store_app/views/homeViews.dart';
import 'package:store_app/views/updateProductViews.dart';

void main() => runApp(const StoreApp());

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        HomeViews.id: (context) => const HomeViews(),
        UpdateProductViews.id: (context) => const UpdateProductViews(),
      },
      initialRoute: HomeViews.id,
    );
  }
}
