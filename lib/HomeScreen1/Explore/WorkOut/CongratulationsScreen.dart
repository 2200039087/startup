import 'package:flutter/material.dart';
import 'WorkoutScreen.dart'; // Ensure you have the correct import for WorkoutScreen

class CongratulationsScreen extends StatelessWidget {
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
              height: 250,
              decoration: BoxDecoration(
                color: Color(0xFFAAD2FF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
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
                  // Name in the bottom right of the header
                  Positioned(
                    right: 50, // Adjusted to center more
                    bottom: 10,
                    child: Text(
                      'Name',
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
          // Congratulations card
          Positioned(
            top: 280,
            left: 20,
            right: 20,
            child: Container(
              width: 373,
              height: 288,
              decoration: BoxDecoration(
                color: Colors.white,
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
              child: Column(
                children: [
                  Spacer(),
                  Center(
                    child: Text(
                      'Congratulations',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF044997),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'You have finished a workout!!',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Add space at the bottom
                ],
              ),
            ),
          ),
          // Statistics card
          Positioned(
            top: 600,
            left: 20,
            right: 20,
            child: Container(
              width: 373,
              height: 104,
              decoration: BoxDecoration(
                color: Colors.white,
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '10:00',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          'Time taken',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF044997),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '230',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          'Cal',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF044997),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '10',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          'Exercises',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF044997),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Go Home button
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkoutScreen()),
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
                    'Go Home',
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
    home: CongratulationsScreen(),
  ));
}
