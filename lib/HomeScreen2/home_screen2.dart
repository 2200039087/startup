import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SleepScreen.dart';
import 'mood_screen.dart';
import 'stress_screen.dart';
import 'stress_relief_screen.dart';

class HomeScreen2 extends StatefulWidget {
  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  String selectedMood = "";

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
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 18),
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
                    SizedBox(height: 8),
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
                        contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 15),
                      ),
                    ),
                    SizedBox(height: 20),
                    buildMoodCard(),
                    SizedBox(height: 20),
                    buildSleepCardView(),
                    SizedBox(height: 20),
                    buildStressCardView(),
                    SizedBox(height: 20),
                    buildActivityCardsRow(),
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



  Widget buildMoodCard() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
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
              buildMoodButton("sad", Icons.sentiment_very_dissatisfied),
              buildMoodButton("okay", Icons.sentiment_dissatisfied),
              buildMoodButton("neutral", Icons.sentiment_neutral),
              buildMoodButton("happy", Icons.sentiment_satisfied_sharp),
            ],
          ),
          SizedBox(height: 1),
          TextField(
            decoration: InputDecoration(
              hintText: "How did your day go?",
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 9),
            ),
          ),
          SizedBox(height: 8),
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
    );
  }

  Widget buildMoodButton(String mood, IconData icon) {
    bool isSelected = selectedMood == mood;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (selectedMood == mood) {
              selectedMood = ""; // Deselect if tapped again
            } else {
              selectedMood = mood; // Select the tapped mood
            }
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          padding: EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
            gradient: isSelected
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
            child: Column(
              children: [
                Icon(icon, color: isSelected ? Colors.white : Colors.black),
                Text(
                  mood.trim(),
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }




  Widget buildSleepCardView() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
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
          SizedBox(height: 5),
          buildSleepDetails(),
        ],
      ),
    );
  }

  Widget buildSleepDetails() {
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
        SizedBox(height: 4),
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
              width: 200,
              decoration: BoxDecoration(
                color: Color(0xFFA100FF),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
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

  Widget buildStressCardView() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
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
          SizedBox(height: 8),
          buildStressDetails(),
        ],
      ),
    );
  }

  Widget buildStressDetails() {
    return Column(
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
    );
  }




  Widget buildActivityCardsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildActivityCard(
          "Stress/Anxiety relief",
          "For quick relief\nView more",
          Icons.cloud_download,
          Color(0xFFA100FF),
        ),
        SizedBox(width: 10),
        buildActivityCard(
          "Activity cards",
          "For a quick energy boost\nScratchcard",
          Icons.favorite,
          Color(0xFFA100FF),
        ),
      ],
    );
  }

  Widget buildActivityCard(String title, String subtitle, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(5),
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
            SizedBox(height: 3),
            Text(
              title,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3),
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