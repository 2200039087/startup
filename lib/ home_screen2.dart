import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE5EB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            // Your UI components for HomeScreen2
            Text(
              "Home Screen 2",
              style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Add more UI components as needed
          ],
        ),
      ),
    );
  }
}
