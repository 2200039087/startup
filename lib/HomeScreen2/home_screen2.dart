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
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                    SizedBox(height: 12),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Search VitalStats",
                        prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      ),
                    ),
                    SizedBox(height: 30),
                    buildCard(
                      context,
                      "How’s your mood today?",
                      Column(
                        children: [
                          Row(
                            children: [
                              buildMoodButton("sad"),
                              buildMoodButton(""),
                              buildMoodButton(""),
                              buildMoodButton("happy"),
                            ],
                          ),
                          SizedBox(height: 15),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "How did your day go?",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 8),
                            ),
                          ),

                          SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("Add"),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFFA100FF),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    buildCard(
                      context,
                      "Your sleep",
                      buildSleepCard(),
                    ),
                    SizedBox(height: 10),
                    buildCard(
                      context,
                      "Know your stress",
                      buildStressCard(context),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: buildActivityCard(
                            context,
                            "Stress/Anxiety relief",
                            "For quick relief\nView more",
                            Icons.cloud_download,
                            Color(0xFFA100FF),
                          ),
                        ),
                        SizedBox(width: 7),
                        Expanded(
                          child: buildActivityCard(
                            context,
                            "Activity cards",
                            "For a quick energy boost\nScratchcard",
                            Icons.favorite,
                            Color(0xFFA100FF),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String title, Widget child) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              if (title == "How’s your mood today?") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MoodScreen()),
                );
              } else if (title == "Your sleep") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SleepScreen()),
                );
              } else if (title == "Know your stress") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StressScreen()),
                );
              }
            },
            child: Text(
              title,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4E007B),
              ),
            ),
          ),
          SizedBox(height: 9),
          child,
        ],
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Light: 6hrs", style: TextStyle(fontSize: 12)),
            Text("Deep: 3hrs", style: TextStyle(fontSize: 12)),
            Text("REM: 3hrs", style: TextStyle(fontSize: 12)),
          ],
        ),
        SizedBox(height: 10),
        Stack(
          children: [
            Container(
              height: 8,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Container(
              height: 8,
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
    );
  }

  Widget buildStressCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Stress amount: Low", style: TextStyle(fontSize: 12)),
        SizedBox(height: 3),
        ElevatedButton(
          onPressed: () {},
          child: Text("Attempt this 1-minute quiz", style: TextStyle(fontSize: 12)),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFFA100FF),
          ),
        ),
      ],
    );
  }



  Widget buildActivityCard(BuildContext context, String title, String subtitle, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        if (title == "Stress/Anxiety relief") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StressReliefScreen()),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.all(8),
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
            SizedBox(height: 2),
            Text(
              title,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
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