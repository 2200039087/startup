import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SleepScreen.dart';
import 'mood_screen.dart';
import 'stress_screen.dart';
import 'stress_relief_screen.dart';

class HomeScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xFFE4B6FF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "HELLO,",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFA100FF),
                              ),
                            ),
                            Text(
                              "PONNURI",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.notifications,
                          color: Color(0xFFA100FF),
                          size: 28,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Search VitalStats",
                        prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      ),
                    ),
                    SizedBox(height: 25),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MoodScreen()),
                        );
                      },
                      child: Text(
                        "How’s your mood today?",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4E007B),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        buildMoodButton("sad"),
                        buildMoodButton(""),
                        buildMoodButton(""),
                        buildMoodButton("happy"),
                      ],
                    ),
                    SizedBox(height: 2),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "How did your day go?",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                    SizedBox(height: 2),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Add"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFFA100FF),
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SleepScreen()),
                        );
                      },
                      child: Text(
                        "Your sleep",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4E007B),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    buildSleepCard(),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StressScreen()),
                        );
                      },
                      child: Text(
                        "Know your stress",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4E007B),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    buildStressCard(context),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => StressReliefScreen()),
                            );
                          },
                          child: buildActivityCard(
                            "Stress/Anxiety relief",
                            "For quick relief\nView more",
                            Icons.cloud_download,
                            Color(0xFFA100FF),
                          ),
                        ),
                        SizedBox(width: 10),
                        buildActivityCard(
                          "Activity cards",
                          "For a quick energy boost\nScratchcard",
                          Icons.favorite,
                          Color(0xFFA100FF),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMoodButton(String mood) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          gradient: mood == "happy"
              ? LinearGradient(
            colors: [Color(0xFFA100FF), Color(0xFFE4B6FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : LinearGradient(
            colors: [Colors.grey[300]!, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
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
        child: Center(
          child: Text(
            mood,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: mood == "happy" ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSleepCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Light: 6hrs", style: TextStyle(fontSize: 12)),
              Text("Deep: 3hrs", style: TextStyle(fontSize: 12)),
              Text("REM: 3hrs", style: TextStyle(fontSize: 12)),
            ],
          ),
          SizedBox(height: 8),
          Stack(
            children: [
              Container(
                height: 6,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Container(
                height: 6,
                width: 180,
                decoration: BoxDecoration(
                  color: Color(0xFFA100FF),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "Total sleep time: 12 hrs",
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFFA100FF),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStressCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Stress amount: Low", style: TextStyle(fontSize: 12)),
          SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {},
            child: Text("Attempt this 1-minute quiz", style: TextStyle(fontSize: 12)),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color(0xFFA100FF),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildActivityCard(String title, String subtitle, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 1,
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 20),
            SizedBox(height: 4),
            Text(
              title,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              subtitle,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 10,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
