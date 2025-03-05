import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HeartRateDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String todayDate = DateFormat('d/M/yyyy').format(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Heart Rate",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFAAD2FF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Color(0xFFAAD2FF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Blue circle background
                  Center(
                    child: Container(
                      width: 229,
                      height: 229,
                      decoration: BoxDecoration(
                        color: Color(0xFF419AFF),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 185,
                      height: 185,
                      decoration: BoxDecoration(
                        color: Color(0xFF70B3FF),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 139,
                      height: 139,
                      decoration: BoxDecoration(
                        color: Color(0xFFA2CEFF),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/heart.png', // Ensure this path is correct
                      width: 80,
                      height: 105,
                      errorBuilder: (context, error, stackTrace) {
                        print("Error loading heart image: $error");
                        return Icon(Icons.error, size: 80, color: Colors.red);
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Heart Rate Details Section
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Color(0xFFE9F8FF)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Combined Detail Card
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildDetailText("Average", "120/80"),
                        _buildDetailText("Maximum", "130/90"),
                        _buildDetailText("Minimum", "110/70"),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  // Chart Placeholder
                  Stack(
                    children: [
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Heart Rate Chart",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: ElevatedButton(
                          onPressed: () {
                            // Add logic for the plus button
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0078FF),
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(10),
                          ),
                          child: Icon(Icons.add, color: Colors.white, size: 20),
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

  Widget _buildDetailText(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            color: Color(0xFF044997),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          value,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
