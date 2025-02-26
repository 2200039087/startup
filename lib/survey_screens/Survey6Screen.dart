import 'package:flutter/material.dart';
import '../HomeScreens/homescreen.dart';

class Survey6Screen extends StatefulWidget {
  @override
  _Survey6ScreenState createState() => _Survey6ScreenState();
}

class _Survey6ScreenState extends State<Survey6Screen> {
  int movementRating = 5;

  @override
  Widget build(BuildContext context) {
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 7, // Adjust height to decrease size
              child: LinearProgressIndicator(
                value: 1.0,
                backgroundColor: Colors.grey[300],
                color: Colors.blue, // Change to blue
              ),
            ),
            SizedBox(height: 30),
            Text(
              'What do you rate your movement in a day?',
              style: TextStyle(
                fontSize: 30, // Increase font size
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Icon(Icons.bedtime, color: Colors.grey, size: 24),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Moderate',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '~5-8hr daily',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
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
                      top: -1, // Adjusted to display above the slider
                      child: Transform.rotate(
                        angle: 0.785398, // Reverse rotation to align digits with the screen
                        child: Text(
                          movementRating.toString(),
                          style: TextStyle(
                            fontSize: 100,
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
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                icon: Icon(Icons.arrow_forward, color: Colors.white), // Add icon
                label: Text(
                  'Continue',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Change to blue
                  padding: EdgeInsets.symmetric(vertical: 16),
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