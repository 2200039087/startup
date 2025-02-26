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
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 7, // Adjust height to decrease size
                  child: LinearProgressIndicator(
                    value: 0.5,
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue, // Change to blue
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "What's your official blood type?",
                  style: TextStyle(
                    fontSize: 30, // Increase font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
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
                    _buildBloodGroupButton('A'),
                    _buildBloodGroupButton('B'),
                    _buildBloodGroupButton('AB'),
                    _buildBloodGroupButton('O'),
                  ],
                ),
                SizedBox(height: 40),
                // Middle section: Selected blood group displayed prominently
                if (selectedBloodGroup != null)
                  Column(
                    children: [
                      Text(
                        selectedBloodGroup! + (selectedSign ?? ''), // Append sign if selected
                        style: TextStyle(
                          fontSize: 128,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Display positive or negative options
                      if (selectedSign == null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSignButton('+'),
                            SizedBox(width: 20),
                            _buildSignButton('-'),
                          ],
                        ),
                    ],
                  ),
                SizedBox(height: 40),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
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
    );
  }

  Widget _buildBloodGroupButton(String bloodGroup) {
    final isSelected = selectedBloodGroup == bloodGroup;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBloodGroup = bloodGroup;
          selectedSign = null; // Reset sign when blood group is changed
        });
      },
      child: Container(
        width: 60,
        height: 60,
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
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildSignButton(String sign) {
    final isSelected = selectedSign == sign;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSign = sign;
        });
      },
      child: Container(
        width: 80,
        height: 60,
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
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
