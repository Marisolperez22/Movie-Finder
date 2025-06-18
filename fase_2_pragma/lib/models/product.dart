class Product {
  final int id;
  final String title;
  final double price;
  final String image;
  final String category;
  final String description;


  const Product( {
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.category,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        category: json['category'],
        description: json['description'],
        price: (json['price'] as num).toDouble(),
      );
}
