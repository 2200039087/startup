import 'package:flutter/material.dart';
import 'Survey2Screen.dart'; // Import the next survey screen

class Survey1Screen extends StatefulWidget {
  @override
  _Survey1ScreenState createState() => _Survey1ScreenState();
}

class _Survey1ScreenState extends State<Survey1Screen> {
  double _weight = 140;
  bool _isLbs = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Survey2Screen()),
              );
            },
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04), // Responsive font size
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Responsive padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.01, // Responsive height
                    child: LinearProgressIndicator(
                      value: 0.25,
                      backgroundColor: Colors.grey[300],
                      color: Colors.blue, // Change to blue
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03), // Responsive space
                  Text(
                    'What is your weight?',
                    style: TextStyle(
                      fontSize: screenWidth * 0.07, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03), // Responsive space
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildToggleButton('lbs', _isLbs, screenWidth, screenHeight),
                      SizedBox(width: screenWidth * 0.05), // Responsive space
                      _buildToggleButton('kgs', !_isLbs, screenWidth, screenHeight),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03), // Responsive space
                  Center(
                    child: Text(
                      '${_weight.toStringAsFixed(0)} ${_isLbs ? 'lbs' : 'kgs'}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.12, // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02), // Responsive space
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: _buildCustomScale(screenWidth, screenHeight),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Survey2Screen()),
                  );
                },
                icon: Icon(Icons.arrow_forward, color: Colors.white), // Add icon
                label: Text(
                  'Continue',
                  style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.white), // Responsive font size
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Change to blue
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02), // Responsive padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isSelected, double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if ((label == 'lbs' && !_isLbs) || (label == 'kgs' && _isLbs)) {
            _isLbs = label == 'lbs';
            _weight = _isLbs ? _weight * 2.20462 : _weight / 2.20462;
          }
        });
      },
      child: Container(
        width: screenWidth * 0.3, // Responsive width
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02), // Responsive padding
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[300], // Change to blue
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCustomScale(double screenWidth, double screenHeight) {
    return Column(
      children: [
        Container(
          height: screenHeight * 0.15, // Responsive height
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if (notification is ScrollUpdateNotification) {
                double offset = notification.metrics.pixels;
                setState(() {
                  _weight = _isLbs
                      ? 50 + offset / 10
                      : (50 + offset / 10) / 2.20462;
                });
              }
              return true;
            },
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 300,
              clipBehavior: Clip.hardEdge, // Clips any overflow content
              itemBuilder: (context, index) {
                num value = _isLbs ? 50 + index : (50 + index) / 2.20462;
                bool isMajorTick = index % 10 == 0;
                return Container(
                  width: screenWidth * 0.025, // Responsive width
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 2,
                        height: isMajorTick ? screenHeight * 0.03 : screenHeight * 0.015, // Responsive height
                        color: isMajorTick ? Colors.blue : Colors.grey, // Change to blue
                      ),
                      if (isMajorTick)
                        Text(
                          value.toStringAsFixed(0),
                          style: TextStyle(fontSize: screenWidth * 0.03, color: Colors.blue), // Change to blue
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        Icon(
          Icons.arrow_drop_down,
          size: screenWidth * 0.1, // Responsive size
          color: Colors.blue, // Change to blue
        ),
      ],
    );
  }
}
