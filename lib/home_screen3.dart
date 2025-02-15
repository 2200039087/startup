import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0F7FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            // Your UI components for HomeScreen3
            Text(
              "Home Screen 3",
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
