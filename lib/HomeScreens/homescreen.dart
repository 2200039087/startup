import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() {
  runApp(VitalStatsApp());
}

class VitalStatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6FA),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 20),
            _buildAboutYou(),
            SizedBox(height: 20),
            _buildFeatureCards(context),
            SizedBox(height: 20),
            _buildEditSection(context),
            SizedBox(height: 20),
            _buildQuickAccess(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF8C41BE),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "HELLO, PONNURI!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "+99  •  Premium",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search VitalStats",
                prefixIcon: Icon(Icons.search, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutYou() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info, color: Colors.purple, size: 24),
                SizedBox(width: 8),
                Text(
                  "About You",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Lorem ipsum dolor amet, consectetur adipiscing elit.",
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCards(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _featureCard("My Heart", Icons.favorite),
            SizedBox(width: 10),
            _featureCard("My SpO2", Icons.water_drop),
            SizedBox(width: 10),
            _featureCard("My Hydration", Icons.local_drink),
            SizedBox(width: 10),
            _featureCard("Glucose Tracker", Icons.bloodtype),
          ],
        ),
      ),
    );
  }


  Widget _buildEditSection(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = (screenWidth - 60) / 2.5; // Adjust for smaller size

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 8.0,
                percent: 0.89,
                center: Text("89%",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                progressColor: Colors.purple,
              ),
              Column(
                children: [
                  _statCard("1600 Steps", Icons.directions_walk, cardWidth),
                  SizedBox(height: 8),
                  _statCard("200 Cal", Icons.local_fire_department, cardWidth),
                  SizedBox(height: 8),
                  _statCard("54 Km", Icons.map, cardWidth),
                ],
              ),
            ],
          ),
          SizedBox(height: 12), // Add spacing between stat cards and button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add your logic for editing goal
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: Text(
                "Edit Goal",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildQuickAccess() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _quickAccessCard("My Family", Icons.group),
              _quickAccessCard("My Medication", Icons.medication),
            ],
          ),
          SizedBox(height: 05), // Add spacing between rows
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _quickAccessCard("My Documents", Icons.file_copy),
              _quickAccessCard("Explore", Icons.explore),
            ],
          ),
        ],
      ),
    );
  }


  Widget _featureCard(String title, IconData icon) {
    return Container(
      width: 120, // Adjusted for rectangular shape
      height: 60, // Adjusted for rectangular shape
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: Colors.purple),
          SizedBox(width: 5),
          Text(title,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _statCard(String title, IconData icon, double width) {
    return Container(
      width: width,
      height: 50,
      // Reduced size
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white, // White background
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: Colors.purple),
          SizedBox(width: 5),
          Text(title,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _quickAccessCard(String title, IconData icon) {
    return Container(
      width: 175,
      // Updated width
      height: 80,
      // Updated height
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5), // Updated border radius
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 28, color: Colors.blue),
          SizedBox(width: 10), // Add spacing between icon and text
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis, // Prevent overflow issues
            ),
          ),
        ],
      ),
    );
  }
}
