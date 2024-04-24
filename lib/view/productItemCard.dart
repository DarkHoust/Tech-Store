import 'package:flutter/material.dart';
import '../model/products.dart';

Widget buildProductItem(Product product) {
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
                onPressed: () {}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Text("Buy"),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {}, 
                  icon: Icon(Icons.favorite),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}