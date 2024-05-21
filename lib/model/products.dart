class Product {
  final String name;
  final String description;
  final double price;
  final String imagePath;
  bool isInCart; // New property to track if the product is in the cart

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    this.isInCart = false, // Default value for isInCart is false
  });
}
