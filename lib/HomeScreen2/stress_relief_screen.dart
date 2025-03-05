import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StressReliefScreen extends StatelessWidget {
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Breathing Exercises Section
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Breathing Exercises",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                          SizedBox(height: 20),
                          GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: List.generate(4, (index) => _buildExerciseCard()),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // Meditation Section
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Meditation",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildAlbumArt(),
                              _buildMusicPlayer(),
                            ],
                          ),
                          Text(
                            "Name",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                          Text(
                            "Artist: Name",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Custom Header
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
                    "Relief",
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

  Widget _buildExerciseCard() {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  Widget _buildAlbumArt() {
    return Container(
      width: 140,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  Widget _buildMusicPlayer() {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.fast_rewind),
              onPressed: () {},
              color: Colors.purple,
            ),
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () {},
              color: Colors.purple,
            ),
            IconButton(
              icon: Icon(Icons.fast_forward),
              onPressed: () {},
              color: Colors.purple,
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () {},
              color: Colors.purple,
            ),
            Text(
              "10 mins",
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(Icons.add_circle_outline),
              onPressed: () {},
              color: Colors.purple,
            ),
          ],
        ),
      ],
    );
  }
}
