import 'package:flutter/material.dart';
import 'ProductDetailScreen.dart';
import 'CartScreen.dart';

class CartManager extends StatefulWidget {
  @override
  _CartManagerState createState() => _CartManagerState();
}

class _CartManagerState extends State<CartManager> {
  List<Map<String, String>> cartItems = [];

  void addToCart(String name, String price, String qty) {
    setState(() {
      cartItems.add({'name': name, 'price': price, 'qty': qty});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Product Detail"),
        ),
        body: ProductDetailScreen(
          addToCart: addToCart,
          cartItems: cartItems,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartScreen(cartItems: cartItems),
              ),
            );
          },
          child: Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}

void main() {
  runApp(CartManager());
}
