import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'CartScreen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Function(String, String, String) addToCart;
  final List<Map<String, String>> cartItems;

  ProductDetailScreen({required this.addToCart, required this.cartItems});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildHeader(context),
          _buildBody(context),
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
            bottomLeft: Radius.circular(60),
          ),
        ),
        child: Stack(
          children: [
            _buildBackButton(context),
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
            color: Color(0xFF0078FF),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Positioned(
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
              _buildProductDetails(),
              SizedBox(height: 20),
              _buildQuantityControl(),
              SizedBox(height: 20),
              _buildAddButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Name",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0078FF),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Price: ₹100/kg",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0078FF),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Lorem ipsum odor amet, consectetuer adipiscing elit. Aliquam velit vitae quis tellus blandit augue. Nisi curae ut aliquam euismod efficitur diam. Nec nisi est lacinia himenaeos venenatis eu. Cras duis bibendum pretium luctus integer finibus at. Quis ex iaculis justo laoreet congue cursus vel.",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityControl() {
    return Row(
      children: [
        _buildQuantityButton('-', decrementQuantity),
        SizedBox(width: 10),
        Text(
          "$quantity",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 10),
        _buildQuantityButton('+', incrementQuantity),
        Spacer(),
        Text(
          "Total Price: ",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF044997),
          ),
        ),
        Text(
          "₹${100 * quantity}",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0078FF),
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityButton(String label, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
      ),
    );
  }

  Widget _buildAddButton() {
    return ElevatedButton(
      onPressed: () {
        widget.addToCart("Name", "₹100/kg", "$quantity");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartScreen(cartItems: widget.cartItems),
          ),
        );
      },
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
    );
  }
}
