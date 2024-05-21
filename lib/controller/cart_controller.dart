import '../model/products.dart';

class CartController {
  static List<Product> _cartItems = [];

  static List<Product> get cartItems => _cartItems;

  static void addToCart(Product product) {
    _cartItems.add(product);
  }

  static void removeFromCart(Product product) {
    _cartItems.remove(product);
  }

  static bool isInCart(Product product) {
    return _cartItems.contains(product);
  }
}
