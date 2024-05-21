import 'package:flutter/material.dart';
import 'package:tech_store/controller/favorite_controller.dart';
import '../model/products.dart';

// Widget to build product item
Widget buildProductItem(Product product, Function() onAddToCart, Function() toggleFavorite) {
  return Card(
    color: Color.fromARGB(255, 241, 249, 253),
    elevation: 4,
    margin: EdgeInsets.all(16), // Add margin for spacing
    child: ListTile(
      contentPadding: EdgeInsets.all(16),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                product.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Price: \$${product.price.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: onAddToCart, // Call onAddToCart function when button is pressed
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Text(product.isInCart ? "Remove from Cart" : "Add to Cart"), // Change button text based on product status
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: toggleFavorite, // Call the provided toggleFavorite callback function when favorite button is pressed
                  icon: Icon(
                    FavoriteController.isInFavorites(product) ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}



