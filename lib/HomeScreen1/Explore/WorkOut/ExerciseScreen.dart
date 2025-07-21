import 'package:flutter/material.dart';
import 'dart:async';
import 'RestScreen.dart'; // Import the RestScreen

class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int _counter = 4; // Start from 4 as per the image
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          timer.cancel();
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background gradient
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Color(0xFFE9F8FF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Header section
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 470,
              decoration: BoxDecoration(
                color: Color(0xFFAAD2FF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                children: [
                  // Back arrow
                  Positioned(
                    left: 20,
                    top: 69,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFFAAD2FF),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0),
                              offset: Offset(1, 1),
                              blurRadius: 2,
                            ),
                            BoxShadow(
                              color: Colors.grey.withOpacity(0),
                              offset: Offset(-1, -1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Exercise text
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 61,
                    child: Text(
                      'Exercise',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF044997),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Countdown circle
          Positioned(
            top: 460,
            left: 80,
            right: 80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Outer circle
                Container(
                  width: 282,
                  height: 282,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(1),
                        offset: Offset(-2, -2),
                        blurRadius: 10.6,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: Offset(2, 2),
                        blurRadius: 13.8,
                      ),
                    ],
                  ),
                ),
                // Inner blue circle
                Container(
                  width: 282 * (_counter / 5),
                  height: 282 * (_counter / 5),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                // Countdown number
                Text(
                  _counter.toString(),
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 96,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          // Skip button
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RestScreen()),
                );
              },
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.89),
                      offset: Offset(-5, -5),
                      blurRadius: 14.8,
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.87),
                      offset: Offset(3, 3),
                      blurRadius: 12.3,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ExerciseScreen(),
  ));
}
