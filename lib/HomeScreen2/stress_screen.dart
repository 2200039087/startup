import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Gradient
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Color(0xFFFAF0FF)],
              ),
            ),
          ),

          // Main Content Area
          Positioned(
            top: 149,
            left: 10,
            right: 10,
            bottom: 20,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.89),
                    offset: Offset(-5, -5),
                    blurRadius: 14.8,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.87),
                    offset: Offset(3, 3),
                    blurRadius: 12.3,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.4),
                    offset: Offset(1, 1),
                    blurRadius: 2,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(-1, -1),
                    blurRadius: 2,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 10),
                children: [
                  // Blank Cards
                  for (int i = 0; i < 4; i++)
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: 70, // Adjusted height for smaller cards
                      decoration: BoxDecoration(
                        color: Color(0xFFF2DCFF), // Lavender color
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                  // Fifth Card with Question and Options
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    height: 150, // Adjusted height for content card
                    decoration: BoxDecoration(
                      color: Color(0xFFF2DCFF), // Lavender color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        children: [
                          Text(
                            "10. In the last month, how often have you been upset because of something that happened unexpectedly?",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF4E007B),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 21,
                                height: 21,
                                decoration: BoxDecoration(
                                  color: Color(0xFFA100FF),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              ...List.generate(5, (index) => Text(
                                index.toString(),
                                style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Sixth Card with Submit Button
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    height: 80, // Adjusted height for button card
                    decoration: BoxDecoration(
                      color: Color(0xFFF2DCFF), // Lavender color
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("Submit"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFA100FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: Size(113, 30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // App Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 145,
              decoration: BoxDecoration(
                color: Color(0xFFE4B6FF),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Spacer(),
                  Text(
                    "Stress",
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Color(0xFF4E007B),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
