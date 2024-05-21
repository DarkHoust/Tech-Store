import '../model/products.dart';

class FavoriteController {
  static List<Product> favoriteItems = [];

  static void addToFavorites(Product product) {
    favoriteItems.add(product);
  }

  static void removeFromFavorites(Product product) {
    favoriteItems.remove(product);
  }

  static bool isInFavorites(Product product) {
    return favoriteItems.contains(product);
  }
}
