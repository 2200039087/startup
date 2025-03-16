import 'package:flutter/material.dart';
import 'dart:async';
import '../../HomeScreen1/homescreen.dart'; // Adjust the import according to your project structure

class CountdownScreen extends StatefulWidget {
  @override
  _CountdownScreenState createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  int _counter = 5;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer?.cancel();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Card(
          elevation: 0, // Remove shadow for a flat design
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Adjust border radius
          ),
          child: Container(
            width: screenWidth * 0.8, // Adjust width as needed
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.05, // Adjust vertical padding
              horizontal: screenWidth * 0.05, // Adjust horizontal padding
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: screenWidth * 0.3, // Adjust size of the circle
                  height: screenWidth * 0.3, // Adjust size of the circle
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white, // Adjust background color
                  ),
                  child: Center(
                    child: Text(
                      _counter.toString(),
                      style: TextStyle(
                        fontSize: screenWidth * 0.1,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  'We welcome you with a warm heart',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Your personalized profile is being created as we wait...',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.black, // Adjust text color
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
