import 'package:flutter/material.dart';
import '../../HomeScreen1/homescreen.dart';
import 'countdown_screen.dart';

class Survey6Screen extends StatefulWidget {
  @override
  _Survey6ScreenState createState() => _Survey6ScreenState();
}

class _Survey6ScreenState extends State<Survey6Screen> {
  int movementRating = 5;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04), // Responsive font size
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: screenHeight * 0.01, // Responsive height
              child: LinearProgressIndicator(
                value: 1.0,
                backgroundColor: Colors.grey[300],
                color: Colors.blue, // Change to blue
              ),
            ),
            SizedBox(height: screenHeight * 0.03), // Responsive space
            Text(
              'What do you rate your movement in a day?',
              style: TextStyle(
                fontSize: screenWidth * 0.07, // Responsive font size
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.03), // Responsive space
            Row(
              children: [
                Icon(Icons.bedtime, color: Colors.grey, size: screenWidth * 0.06), // Responsive size
                SizedBox(width: screenWidth * 0.025), // Responsive space
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Moderate',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04, // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '~5-8hr daily',
                      style: TextStyle(
                        fontSize: screenWidth * 0.035, // Responsive font size
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.05), // Responsive space
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                      angle: -0.785398, // Rotate by -45 degrees (diagonal)
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 6.0,
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
                          overlayColor: Colors.blue.withOpacity(0.2), // Change to blue
                        ),
                        child: Slider(
                          value: movementRating.toDouble(),
                          min: 1,
                          max: 10,
                          divisions: 9,
                          activeColor: Colors.blue, // Change to blue
                          inactiveColor: Colors.grey[300],
                          label: '$movementRating',
                          onChanged: (value) {
                            setState(() {
                              movementRating = value.round();
                            });
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: -screenHeight * 0.01, // Adjusted to display above the slider
                      child: Transform.rotate(
                        angle: 0.785398, // Reverse rotation to align digits with the screen
                        child: Text(
                          movementRating.toString(),
                          style: TextStyle(
                            fontSize: screenWidth * 0.25, // Responsive font size
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CountdownScreen()),
                  );
                },
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                label: Text(
                  'Continue',
                  style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
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
}