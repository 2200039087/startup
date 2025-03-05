import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui'; // For BackdropFilter

class RecipeViewScreen extends StatefulWidget {
  final String recipeName;

  RecipeViewScreen({required this.recipeName});

  @override
  _RecipeViewScreenState createState() => _RecipeViewScreenState();
}

class _RecipeViewScreenState extends State<RecipeViewScreen> {
  bool _isCardVisible = false;

  void _toggleCardVisibility() {
    setState(() {
      _isCardVisible = !_isCardVisible;
    });
  }

  void _showRecipeCard(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return _buildRecipeCard(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Rectangles
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 440,
              height: 338,
              decoration: BoxDecoration(
                color: Color(0xFFFFDAC3),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 338,
            child: Container(
              width: 440,
              height: 819,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Color(0xFFFFEBDF)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                ),
              ),
            ),
          ),
          // Header
          Positioned(
            top: 62,
            left: 27,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0xFFFF6000)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 65,
            left: 140,
            child: Text(
              "Recipe",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB04200),
              ),
            ),
          ),
          // Recipe Name
          Positioned(
            top: 370,
            left: 20,
            child: Text(
              widget.recipeName,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF6000),
              ),
            ),
          ),
          // Recipe Content Placeholder
          Positioned(
            top: 410,
            left: 10,
            child: GestureDetector(
              onTap: () => _showRecipeCard(context),
              child: Container(
                width: 340,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x89FFFFFF),
                      offset: Offset(-5, -5),
                      blurRadius: 14.8,
                    ),
                    BoxShadow(
                      color: Color(0x87C7C7C7),
                      offset: Offset(3, 3),
                      blurRadius: 12.3,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Recipe Content Here",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFB04200),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeCard(BuildContext context) {
    return Center(
      child: Container(
        width: 300, // Adjusted width
        height: 500, // Adjusted height
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Lorem ipsum odor amet, consectetuer adipiscing elit. Aptent quis pulvinar praesent; varius malesuada amet. Parturient ac fringilla senectus curabitur curae, varius vehicula. Vehicula dignissim gravida morbi convallis vehicula eget. Quisque convallis maecenas ante morbi sodales lobortis ipsum. Rutrum erat ac, sed mollis nam risus cubilia ex pretium.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Color(0xFFFFDAC3), // Header color
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Center(
        child: Text(
          "Recipe",
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFFB04200),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Color(0xFFFFDAC3), // Footer color
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
