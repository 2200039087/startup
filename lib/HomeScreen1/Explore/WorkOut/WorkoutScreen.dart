import 'package:flutter/material.dart';

class WorkoutScreen extends StatelessWidget {
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
                  // Workout title
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 65,
                    child: Text(
                      'Workout',
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
          // Search bar and filter
          Positioned(
            top: 190,
            left: 20,
            right: 20,
            child: Row(
              children: [
                // Search bar
                Expanded(
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          offset: Offset(-2, 2),
                          blurRadius: 6.7,
                        ),
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.25),
                          offset: Offset(2, -2),
                          blurRadius: 5.9,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(0.9),
                          offset: Offset(-2, -2),
                          blurRadius: 9.3,
                        ),
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          offset: Offset(2, 2),
                          blurRadius: 7.6,
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search Store',
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                // Filter button
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(Icons.filter_list, color: Colors.white),
                ),
              ],
            ),
          ),
          // Workout cards in a scrollable list
          Positioned(
            top: 220,
            bottom: 0,
            left: 5,
            right: 5,
            child: ListView.builder(
              itemCount: 10, // Example count, adjust as needed
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.all(15),
                  height: 100,
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
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WorkoutScreen(),
  ));
}
