class ProductModel {
  final dynamic id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final ProductRatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJSON(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rating: ProductRatingModel.fromJSON(jsonData['rating']),
    );
  }
}

class ProductRatingModel {
  final dynamic rate;
  final int count;

  ProductRatingModel({
    required this.rate,
    required this.count,
  });

  factory ProductRatingModel.fromJSON(jsonData) {
    return ProductRatingModel(
      rate: jsonData['rate'],
      count: jsonData['count'],
    );
  }
}
