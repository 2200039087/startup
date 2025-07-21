import 'package:flutter/material.dart';
import 'package:vitalstats/HomeScreen1/Explore/WorkOut/CountdownScreen1.dart';

class WorkoutDetailScreen extends StatelessWidget {
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
              height: 180,
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
                  // Name in the bottom right of the header
                  Positioned(
                    right: 20,
                    bottom: 10,
                    child: Text(
                      'Name',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF044997),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Workout cards in a scrollable list
          Positioned(
            top: 220,
            bottom: 80,
            left: 20,
            right: 20,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(3, (index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.all(15),
                    height: 138,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              '10 mins',
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '150 cal',
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
          // Start button
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CountdownScreen1()),
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
                    'Start',
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
    home: WorkoutDetailScreen(),
  ));
}
