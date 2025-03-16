import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SpeedMeterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String todayDate = DateFormat('d/M/yyyy').format(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Speed Meter",
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
                      'assets/speed_meter_icon.png', // Ensure this path is correct
                      width: 80,
                      height: 105,
                      errorBuilder: (context, error, stackTrace) {
                        print("Error loading speed meter image: $error");
                        return Icon(Icons.error, size: 80, color: Colors.red);
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Cards Section
            Padding(
              padding: EdgeInsets.all(09.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCard("Calories burnt", "1278 cal"),
                      _buildCard("Distance travelled", "20 km"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCard("Steps taken", "10909 steps"),
                      _buildCard("1 week in-sights", "Lorem."),
                    ],
                  ),
                ],
              ),
            ),
            // Chart Placeholder
            Stack(
              children: [
                Container(
                  height: 230,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),

                ),
                Positioned(
                  bottom: 07,
                  right: 5,
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
    );
  }

  Widget _buildCard(String title, String value) {
    return Container(
      width: 165,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
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
        SizedBox(height: 5),
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
