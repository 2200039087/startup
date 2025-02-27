import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'home_screen2.dart'; // Import HomeScreen2
import 'home_screen3.dart'; // Import HomeScreen3

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

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  void navigateToScreen(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              _buildHomeScreen1(context, screenWidth, screenHeight),
              HomeScreen2(),
              HomeScreen3(),
            ],
          ),
          _buildVerticalDots(screenHeight, screenWidth),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) {},
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 5,
      ),
    );
  }

  Widget _buildVerticalDots(double screenHeight, double screenWidth) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: screenWidth * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  width: screenWidth * 0.02,
                  height: screenHeight * 0.025,
                  margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? Colors.blueAccent : Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildHomeScreen1(BuildContext context, double screenWidth, double screenHeight) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(screenWidth, screenHeight),
                  SizedBox(height: screenHeight * 0.02),
                  _buildAboutYou(screenWidth),
                  SizedBox(height: screenHeight * 0.02),
                  _buildFeatureCards(context, screenWidth),
                  SizedBox(height: screenHeight * 0.02),
                  _buildEditSection(context, screenWidth),
                  SizedBox(height: screenHeight * 0.02),
                  _buildQuickAccess(screenWidth),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(double screenWidth, double screenHeight) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFAAD2FF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      padding: EdgeInsets.only(
        top: screenHeight * 0.01,
        left: screenWidth * 0.05,
        right: screenWidth * 0.05,
        bottom: screenHeight * 0.02,
      ),
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
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "+99  •  Premium",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.023),
          Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.020),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
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

  Widget _buildAboutYou(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.015),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info, color: Colors.blueAccent, size: screenWidth * 0.04),
                SizedBox(width: screenWidth * 0.01),
                Text(
                  "About You",
                  style: TextStyle(fontSize: screenWidth * 0.040, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: screenWidth * 0.05),
            Text(
              "Lorem ipsum dolor amet, consectetur adipiscing elit. Vivamus habitant penatibus utrices senectus himenaeos. Libero tincidunt...",
              style: TextStyle(color: Colors.grey[600], fontSize: screenWidth * 0.03),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCards(BuildContext context, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025, vertical: screenWidth * 0.025),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _featureCard("My Heart", Icons.favorite, screenWidth),
            SizedBox(width: screenWidth * 0.03),
            _featureCard("My SpO2", Icons.water_drop, screenWidth),
            SizedBox(width: screenWidth * 0.03),
            _featureCard("My Hydration", Icons.local_drink, screenWidth),
            SizedBox(width: screenWidth * 0.03),
            _featureCard("My Glucose", Icons.bloodtype, screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildEditSection(BuildContext context, double screenWidth) {
    double cardWidth = (screenWidth - 50) / 3;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.10, vertical: screenWidth * 0.00),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircularPercentIndicator(
                radius: screenWidth * 0.17,
                lineWidth: screenWidth * 0.03, // Increased line width
                percent: 0.89,
                center: Text(
                  "89%",
                  style: TextStyle(
                    fontSize: screenWidth * 0.09,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple, // Changed text color to purple
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round, // Rounded ends
                progressColor: Colors.blueAccent,
                backgroundColor: Colors.blueAccent.withOpacity(0.3), // Added background color
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _statCard("1600 Steps", Icons.directions_walk, cardWidth, screenWidth),
                  SizedBox(height: screenWidth * 0.02),
                  _statCard("200 Cal", Icons.local_fire_department, cardWidth, screenWidth),
                  SizedBox(height: screenWidth * 0.02),
                  _statCard("54 Km", Icons.map, cardWidth, screenWidth),
                ],
              ),
            ],
          ),
          SizedBox(height: screenWidth * 0.00),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add your logic for editing goal
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09, vertical: screenWidth * 0.00),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.00), // Adjust the padding value as needed
                  child: Text(
                    "Edit Goal",
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccess(double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: screenWidth * 0.025),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _quickAccessCard("My Family", Icons.group, screenWidth),
              _quickAccessCard("My Medication", Icons.medication, screenWidth),
            ],
          ),
          SizedBox(height: screenWidth * 0.045),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _quickAccessCard("My Documents", Icons.file_copy, screenWidth),
              _quickAccessCard("Explore", Icons.explore, screenWidth),
            ],
          ),
        ],
      ),
    );
  }

  Widget _featureCard(String title, IconData icon, double screenWidth) {
    return Container(
      width: screenWidth * 0.25,
      height: screenWidth * 0.125,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
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
          Icon(icon, size: screenWidth * 0.045, color: Colors.blueAccent),
          SizedBox(width: screenWidth * 0.0075),
          Text(title, style: TextStyle(fontSize: screenWidth * 0.03, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _statCard(String title, IconData icon, double width, double screenWidth) {
    return Container(
      width: width,
      height: screenWidth * 0.09,
      padding: EdgeInsets.all(screenWidth * 0.011),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
          Icon(icon, size: screenWidth * 0.05, color: Colors.blueAccent),
          SizedBox(width: screenWidth * 0.015),
          Text(title, style: TextStyle(fontSize: screenWidth * 0.03, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _quickAccessCard(String title, IconData icon, double screenWidth) {
    return Container(
      width: screenWidth * 0.38,
      height: screenWidth * 0.130,
      padding: EdgeInsets.all(screenWidth * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 7,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: screenWidth * 0.060, color: Colors.blueAccent),
          SizedBox(width: screenWidth * 0.02),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: screenWidth * 0.03, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
