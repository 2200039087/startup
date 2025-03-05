import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, String>> cartItems;

  CartScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Header Section
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 132,
              decoration: BoxDecoration(
                color: Color(0xFFAAD2FF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                ),
              ),
              child: Stack(
                children: [
                  // Back Button
                  Positioned(
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
                          color: Color(0xFF0078FF),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
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
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                  ),
                  // Title
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 60,
                    child: Center(
                      child: Text(
                        "Cart",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF044997),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Body Section
          Positioned(
            top: 182,
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
                    // Search Bar
                    _buildSearchBar(context),
                    SizedBox(height: 20),
                    // Cart Items
                    ...cartItems.map((item) => _buildCartItem(context, item['name']!, item['price']!, item['qty']!)).toList(),
                    SizedBox(height: 20),
                    // Checkout Button
                    _buildCheckoutButton(context),
                  ],
                ),
              ),
            ),
          ),
        ],
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
          hintText: "Search Cart",
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, String name, String price, String qty) {
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
            // Product Image Placeholder
            Container(
              width: 113,
              height: 113,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(width: 16),
            // Product Details
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
                    '$price - Price',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0078FF),
                    ),
                  ),
                  Text(
                    '$qty - Qty',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0078FF),
                    ),
                  ),
                  Spacer(),
                  // Quantity Control
                  Row(
                    children: [
                      _buildQuantityButton('-'),
                      SizedBox(width: 10),
                      Text(
                        qty,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 10),
                      _buildQuantityButton('+'),
                      Spacer(),
                      // Remove Button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0078FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          "Remove",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckoutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showCheckoutDialog(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF0078FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        minimumSize: Size(double.infinity, 48),
      ),
      child: Text(
        "Checkout",
        style: GoogleFonts.plusJakartaSans(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  void _showCheckoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 50,
              ),
              SizedBox(height: 20),
              Text(
                "Your product has been checked out!",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "OK",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0078FF),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildQuantityButton(String label) {
    return Container(
      width: 33,
      height: 26,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.89),
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
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
