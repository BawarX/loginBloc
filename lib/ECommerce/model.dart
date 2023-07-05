class Product {
  int? id;
  String? name;
  double? price;
  int? quantity;
  Product({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 0,
  });
}
