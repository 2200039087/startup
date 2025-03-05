import 'package:flutter/material.dart';
import 'Survey4Screen.dart'; // Ensure this import is correct

class Survey3Screen extends StatefulWidget {
  @override
  _Survey3ScreenState createState() => _Survey3ScreenState();
}

class _Survey3ScreenState extends State<Survey3Screen> {
  String? selectedBloodGroup; // Stores A, B, AB, or O
  String? selectedSign; // Stores + or -

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
                MaterialPageRoute(builder: (context) => Survey4Screen()),
              );
            },
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04), // Responsive font size
            ),
          ),
        ],
      ),
      body: Column(
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
                    value: 0.5,
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue, // Change to blue
                  ),
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive space
                Text(
                  "What's your official blood type?",
                  style: TextStyle(
                    fontSize: screenWidth * 0.07, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive space
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Top row: Blood group alphabets (A, B, AB, O)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildBloodGroupButton('A', screenWidth, screenHeight),
                    _buildBloodGroupButton('B', screenWidth, screenHeight),
                    _buildBloodGroupButton('AB', screenWidth, screenHeight),
                    _buildBloodGroupButton('O', screenWidth, screenHeight),
                  ],
                ),
                SizedBox(height: screenHeight * 0.04), // Responsive space
                // Middle section: Selected blood group displayed prominently
                if (selectedBloodGroup != null)
                  Column(
                    children: [
                      Text(
                        selectedBloodGroup! + (selectedSign ?? ''), // Append sign if selected
                        style: TextStyle(
                          fontSize: screenWidth * 0.32, // Responsive font size
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02), // Responsive space
                      // Display positive or negative options
                      if (selectedSign == null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSignButton('+', screenWidth, screenHeight),
                            SizedBox(width: screenWidth * 0.05), // Responsive space
                            _buildSignButton('-', screenWidth, screenHeight),
                          ],
                        ),
                    ],
                  ),
                SizedBox(height: screenHeight * 0.04), // Responsive space
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
            child: ElevatedButton.icon(
              onPressed: () {
                if (selectedBloodGroup != null && selectedSign != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Survey4Screen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select a blood group and type')),
                  );
                }
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
    );
  }

  Widget _buildBloodGroupButton(String bloodGroup, double screenWidth, double screenHeight) {
    final isSelected = selectedBloodGroup == bloodGroup;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBloodGroup = bloodGroup;
          selectedSign = null; // Reset sign when blood group is changed
        });
      },
      child: Container(
        width: screenWidth * 0.15, // Responsive width
        height: screenWidth * 0.15, // Responsive height
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200], // Change to blue
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.blue.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 8,
            )
          ]
              : [],
        ),
        child: Text(
          bloodGroup,
          style: TextStyle(
            fontSize: screenWidth * 0.045, // Responsive font size
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildSignButton(String sign, double screenWidth, double screenHeight) {
    final isSelected = selectedSign == sign;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSign = sign;
        });
      },
      child: Container(
        width: screenWidth * 0.2, // Responsive width
        height: screenHeight * 0.075, // Responsive height
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200], // Change to blue
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.blue.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 8,
            )
          ]
              : [],
        ),
        child: Text(
          sign,
          style: TextStyle(
            fontSize: screenWidth * 0.07, // Responsive font size
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
