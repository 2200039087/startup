import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:expandable_fab_lite/expandable_fab_lite.dart';
import 'Camera/FileUploaderScreen.dart';
import 'Camera/ScannerScreen.dart';
import 'Explore/ExploreScreen.dart';
import 'Health/heart_rate_details_screen.dart'; // Import the heart screen
import '../HomeScreen2/home_screen2.dart';
import '../HomeScreen3/home_screen3.dart';
import 'Camera/CameraScreen.dart';
import 'Documents/my_documents_screen.dart';
import 'Family/MyFamilyScreen.dart';
import 'Medicines/my_medicines_screen.dart';
import 'MenuScreens/popup_menu_screen.dart';
import 'dart:ui'; // For BackdropFilter

void main() {
  runApp(VitalStatsApp());
}

class VitalStatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFAAD2FF), // Set the primary color for the theme
      ),
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
  int _navBarIndex = 0; // Separate index for the BottomNavigationBar
  final PageController _pageController = PageController();
  bool _isMenuOpen = false;

<<<<<<< HEAD
=======
  @override
  void initState() {
    super.initState();
  }

>>>>>>> e77eebdb63288422172d5d7f9d6cf4e202c790a0
  void _showEditGoalDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Stack(
              children: [
                // Blurred background
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4.55, sigmaY: 4.55),
                    child: Container(
                      color: Colors.black.withOpacity(0.24),
                    ),
                  ),
                ),
                // Floating card
                Center(
                  child: Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      width: 373,
                      height: 371,
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.87),
                            blurRadius: 12.3,
                            offset: Offset(3, 3),
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.4),
                            blurRadius: 2,
                            offset: Offset(1, 1),
                          ),
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 2,
                            offset: Offset(-1, -1),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Edit Goal",
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Steps",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "No. of Calories",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Distance",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Handle edit goal action
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF0078FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text("Edit"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
      if (_isMenuOpen) {
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false,
            pageBuilder: (context, animation, secondaryAnimation) => PopupMenuScreen(
              onMenuToggle: _toggleMenu,
            ),
          ),
        );
      } else {
        Navigator.of(context).pop();
      }
    });
  }

<<<<<<< HEAD
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 1) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CameraScreen()),
        );
      } else if (index == 2) {
        _toggleMenu();
      } else {
        _isMenuOpen = false;
        _pageController.animateToPage(
          0, // Always navigate to the first page for home
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

=======
>>>>>>> e77eebdb63288422172d5d7f9d6cf4e202c790a0
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
                _currentIndex = index; // Update the current index
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
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(null), // Empty icon for the center
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        currentIndex: _navBarIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 5,
        onTap: (index) {
          if (index == 1) {
            // Handle the center button tap
          } else if (index == 2) {
            // Handle the menu button tap
            _toggleMenu();
          } else {
            setState(() {
              _navBarIndex = index;
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ExpandableFab(
        fabMargin: 8,
        children: [
          ActionButton(
            icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ScannerScreen()),
              );
              // Handle scanner action
            },
          ),
          ActionButton(
            icon: const Icon(Icons.camera_alt, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CameraScreen()),
              );
              // Handle camera action
            },
          ),
          ActionButton(
            icon: const Icon(Icons.file_upload, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FileUploaderScreen()),
              );
              // Handle file upload action
            },
          ),
        ],
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
                  _buildQuickAccess(context, screenWidth), // Pass context here
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
            _featureCard("My Heart", Icons.favorite, screenWidth, context),
            SizedBox(width: screenWidth * 0.03),
            _featureCard("My SpO2", Icons.water_drop, screenWidth, context),
            SizedBox(width: screenWidth * 0.03),
            _featureCard("My Hydration", Icons.local_drink, screenWidth, context),
            SizedBox(width: screenWidth * 0.03),
            _featureCard("My Glucose", Icons.bloodtype, screenWidth, context),
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
                lineWidth: screenWidth * 0.03,
                percent: 0.89,
                center: Text(
                  "89%",
                  style: TextStyle(
                    fontSize: screenWidth * 0.09,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.blueAccent,
                backgroundColor: Colors.blueAccent.withOpacity(0.3),
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
        ],
      ),
    );
  }

  Widget _buildQuickAccess(BuildContext context, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: screenWidth * 0.025),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _quickAccessCard(context, "My Family", Icons.group, screenWidth),
              _quickAccessCard(context, "My Medication", Icons.medication, screenWidth),
            ],
          ),
          SizedBox(height: screenWidth * 0.045),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _quickAccessCard(context, "My Documents", Icons.file_copy, screenWidth),
              _quickAccessCard(context, "Explore", Icons.explore, screenWidth),
            ],
          ),
        ],
      ),
    );
  }

  Widget _featureCard(String title, IconData icon, double screenWidth, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == "My Heart") {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HeartRateDetailsScreen()),
          ).then((value) {
            print("Navigated to HeartRateDetailsScreen");
          });
        }
      },
      child: Container(
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

  Widget _quickAccessCard(BuildContext context, String title, IconData icon, double screenWidth) {
    return GestureDetector(
      onTap: () {
        switch (title) {
          case "My Family":
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MyFamilyScreen()),
            );
            break;
          case "My Medication":
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MyMedicinesScreen()),
            );
            break;
          case "My Documents":
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MyDocumentsScreen())
            );
            break;
          case "Explore":
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ExploreScreen())
            );
            // Add navigation for Explore if needed
            break;
        }
      },
      child: Container(
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
      ),
    );
  }
}
