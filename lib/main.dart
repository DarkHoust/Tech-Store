import 'package:flutter/material.dart';
import 'package:tech_store/view/accountPage.dart';
import './model/products.dart';
import './view/productItemCard.dart';
import 'model/categories.dart';
import './view/catergoryItemCard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.white,
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
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 241, 249, 253),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.blueGrey, width: 1.0),
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.blueGrey),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.blueGrey),
              contentPadding: EdgeInsets.all(10.0),
            ),
            style: TextStyle(color: Colors.black, fontSize: 16.0),
            onChanged: (query) {
              setState(() {
                _searchQuery = query;
              });
            },
          ),
        ),
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.blueGrey,
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

  Widget _buildMainPage() {
    List<Category> categories = [
      Category(name: "Smartphones", imagePath: 'assets/category4.jpeg'),
      Category(name: "Appliances", imagePath: 'assets/category1.jpeg'),
      Category(name: "Videos, audios", imagePath: 'assets/category2.jpeg'),
      Category(name: "Laptops, PCs", imagePath: 'assets/category3.jpeg'),
    ];

    List<Product> products = [
      Product(name: "iPhone 15 Pro", description: "The latest iPhone", price: 999.9, imagePath: 'assets/iPhone15Pro.jpeg'),
      Product(name: "MacBook Air M3", description: "Thin and light", price: 1299.9, imagePath: 'assets/macbookAirM3.jpg'),
      Product(name: "Apple Watch Series 9", description: "Latest in the series", price: 399.9, imagePath: 'assets/WatchSeries9.jpg')
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 280, // Adjust the height as needed
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 3 / 2,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return buildCategoryCard(categories[index]);
              },
            ),
          ),
          SizedBox(height: 10.0), // Add spacing between categories and products
          ...products.map((product) => buildProductItem(product)).toList(),
        ],
      ),
    );
  }
}


