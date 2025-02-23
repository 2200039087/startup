import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background Container
            Container(
              width: double.infinity,
              height: 206,
              decoration: BoxDecoration(
                color: Color(0xFFFFDAC4),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                ),
              ),
            ),

            // Hello, PONNURI
            Positioned(
              top: 62,
              left: 34,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "HELLO,",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF6000),
                    ),
                  ),
                  Text(
                    "PONNURI",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Color(0xFFFF6000),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "4.99",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Color(0xFFFF6000),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "Premium",
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Notification Icon
            Positioned(
              top: 62,
              right: 34,
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: Color(0xFFFF6000),
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
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
            ),

            // Search Bar
            Positioned(
              top: 153,
              left: 34,
              right: 34,
              child: Container(
                height: 37,
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
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    Text(
                      "Search VitalStats",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Consumed and Target Circles
            Positioned(
              top: 264,
              left: 136,
              child: Stack(
                children: [
                  Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      color: Color(0xFFE2E2E2),
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(1),
                          offset: Offset(-2, -2),
                          blurRadius: 10.6,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: Offset(2, 2),
                          blurRadius: 13.8,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF6000),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Positioned(
                    top: 55,
                    left: 60,
                    child: Column(
                      children: [
                        Text(
                          "678",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Consumed",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 55,
                    right: 60,
                    child: Column(
                      children: [
                        Text(
                          "2,500",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Target",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Nutrient Bars
            Positioned(
              top: 447,
              left: 48,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Protiens",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "23/72g",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 104,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Container(
                      width: 73,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF6000),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Fats
            Positioned(
              top: 447,
              left: 208,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fats",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "15/20g",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 104,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Container(
                      width: 42,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF6000),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Carbs
            Positioned(
              top: 447,
              left: 342,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Carbs",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "210/220g",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 104,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Container(
                      width: 94,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF6000),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Your Weight Card
            Positioned(
              top: 527,
              left: 35,
              child: Container(
                width: 171,
                height: 178,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
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
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Your weight",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB04200),
                      ),
                    ),
                    // Add your weight graph here
                  ],
                ),
              ),
            ),

            // Diet Card
            Positioned(
              top: 527,
              right: 35,
              child: Container(
                width: 171,
                height: 178,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
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
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Diet",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB04200),
                      ),
                    ),
                    // Add diet details here
                  ],
                ),
              ),
            ),

            // About You Card
            Positioned(
              top: 734,
              left: 35,
              child: Container(
                width: 171,
                height: 113,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
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
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "About you",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB04200),
                      ),
                    ),
                    // Add about you details here
                  ],
                ),
              ),
            ),

            // Recipe Finder Card
            Positioned(
              top: 734,
              right: 35,
              child: Container(
                width: 171,
                height: 113,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
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
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Recipe Finder",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB04200),
                      ),
                    ),
                    // Add recipe finder details here
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
