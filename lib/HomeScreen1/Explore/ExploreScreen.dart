import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'StoreScreen.dart';
import 'WorkoutScreen.dart'; // Import the new WorkoutScreen

class ExploreScreen extends StatelessWidget {
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
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xFFAAD2FF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 47.0, left: 6.0),
                    child: Text(
                      "Explore",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Body Section
          Positioned(
            top: 160,
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
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First Card (Store)
                    _buildCard(context, "Store"),
                    SizedBox(height: 16),
                    // Second Card (Workout)
                    _buildCard(context, "Workout"),
                    SizedBox(height: 16),
                    // Third Card (Empty)
                    _buildCard(context, ""),
                  ],
                ),
              ),
            ),
          ),
          // Back Button
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back ,color: Colors.black,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        if (title == "Store") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StoreScreen()),
          );
        } else if (title == "Workout") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WorkoutScreen()),
          );
        }
      },
      child: Container(
        width: 400, // Adjusted width
        height: 200, // Adjusted height
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.89),
              offset: Offset(-3, -3),
              blurRadius: 8,
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.87),
              offset: Offset(3, 3),
              blurRadius: 6,
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
            title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
