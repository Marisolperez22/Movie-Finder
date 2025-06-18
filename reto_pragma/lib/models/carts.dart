class Carts {
    final int id;
    final int userId;
    final DateTime date;
    final List<CartProduct> products;

    Carts({
        required this.id,
        required this.userId,
        required this.date,
        required this.products,
    });

    factory Carts.fromJson(Map<String, dynamic> json) => Carts(
        id: json["id"],
        userId: json["userId"],
        date: DateTime.parse(json["date"]),
        products: List<CartProduct>.from(json["products"].map((x) => CartProduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "date": date.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class CartProduct {
    final int productId;
    final int quantity;

    CartProduct({
        required this.productId,
        required this.quantity,
    });

    factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        productId: json["productId"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
    };
}
