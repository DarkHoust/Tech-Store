import 'package:flutter/material.dart';
import './model/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.white
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tech Store'),
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.blueGrey, // Set unselected item color here
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Liked',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return _buildMainPage();
      case 1:
        return Center(child: Text('Liked Page'));
      case 2:
        return Center(child: Text('Cart Page'));
      case 3:
        return Center(child: Text('Account Page'));
      default:
        return Container();
    }
  }

  Widget _buildMainPage() {
    return ListView(
      children: [
        _buildProductItem(Product(name: 'iPhone 15 Pro', description: 'The latest iPhone', price: 999.99, imagePath: Image.asset("assets/iPhone15Pro.jpeg"))),
        _buildProductItem(Product(name: 'MacBook Air M3', description: 'Thin and light notebook', price: 1199.99, imagePath: Image.asset("assets/iPhone15Pro.jpeg"))),
        _buildProductItem(Product(name: 'Apple Watch Series 9', description: 'The ultimate watch for a healthier life', price: 399.99, imagePath: Image.asset("assets/iPhone15Pro.jpeg"))),
        // Add more product items as needed
      ],
    );
  }

  Widget _buildProductItem(Product product) {
  return ListTile(
    contentPadding: EdgeInsets.all(16), // Adjust padding as needed
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8), // Add spacing between title and image
        Image.asset(
          'assets/${product.imagePath}',
          width: double.infinity, // Take full width
          height: 150, // Adjust the height as needed
          fit: BoxFit.cover, // Cover the entire space
        ),
      ],
    ),
    subtitle: Text(product.description),
    trailing: Text('\$${product.price.toStringAsFixed(2)}'),
  );
}

}

