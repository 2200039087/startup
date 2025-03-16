import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'CartScreen.dart';
import 'ProductDetailScreen.dart';

class StoreScreen extends StatefulWidget {
  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  List<Map<String, String>> cartItems = [];

  void addToCart(String name, String price, String qty) {
    setState(() {
      cartItems.add({'name': name, 'price': price, 'qty': qty});
      Fluttertoast.showToast(
        msg: "Product added to cart",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildHeader(context),
          _buildBody(context),
          _buildAddressSection(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 152,
        decoration: BoxDecoration(
          color: Color(0xFFAAD2FF),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Stack(
          children: [
            _buildBackButton(context),
            _buildTitle(),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      left: 32,
      top: 62,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: Color(0xFFAAD2FF),
            borderRadius: BorderRadius.circular(0),
          ),
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Positioned(
      left: 0,
      right: 0,
      top: 60,
      child: Center(
        child: Text(
          "Store",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Color(0xFF044997),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Positioned(
      top: 152,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFFE9F8FF)],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchBar(context),
              SizedBox(height: 20),
              _buildProductList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      height: 37,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            offset: Offset(-2, 2),
            blurRadius: 6.7,
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            offset: Offset(2, -2),
            blurRadius: 5.9,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.9),
            offset: Offset(-2, -2),
            blurRadius: 9.3,
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.0),
            offset: Offset(2, 2),
            blurRadius: 7.6,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search Store",
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildProductList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                  addToCart: addToCart,
                  cartItems: cartItems,
                ),
              ),
            );
          },
          child: _buildProductCard(context, "Name", "₹200", "1 item", () {
            addToCart("Name", "₹200", "1");
          }),
        );
      },
    );
  }

  Widget _buildProductCard(BuildContext context, String name, String price, String qty, VoidCallback onAdd) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.89),
            offset: Offset(-5, -5),
            blurRadius: 14.8,
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.87),
            offset: Offset(3, 3),
            blurRadius: 12.3,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.4),
            offset: Offset(1, 1),
            blurRadius: 2,
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(-1, -1),
            blurRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 113,
              height: 113,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0078FF),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    price,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0078FF),
                    ),
                  ),
                  Text(
                    qty,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0078FF),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: onAdd,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0078FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      "Add",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressSection(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(Icons.home, color: Colors.white),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                "Delivering to:\nFlat no. 404, Mythrinagar Behind metro, kukatpally, Hyderabad",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
