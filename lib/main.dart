import 'package:flutter/material.dart';
import 'package:tech_store/view/accountPage.dart';
import './model/products.dart';
import './view/productItemCard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        return Center(child: Text('No Favorite products!'));
      case 2:
        return Center(child: Text('Cart is empty'));
      case 3:
        return AccountPage();
      default:
        return Container();
    }
  }

  Product product1 = Product(name: "iPhone 15 Pro", description: "The latest iPhone", price: 999.9, imagePath: 'assets/iPhone15Pro.jpeg');
  Product product2 = Product(name: "MacBook Air M3", description: "Thin and light", price: 1299.9, imagePath: 'assets/macbookAirM3.jpg');
  Product product3 = Product(name: "MacBook Air M3", description: "Thin and light", price: 1299.9, imagePath: 'assets/WatchSeries9.jpg');

  Widget _buildMainPage() {
    return ListView(
      children: [
        buildProductItem(product1),
        buildProductItem(product2),
        buildProductItem(product3)
      ]
    );
  }
  
}
