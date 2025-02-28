import 'package:flutter/material.dart';

class MyDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Background gradient
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Color(0xFFE9F8FF)],
                ),
              ),
            ),

            // Top blue section
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 132,
                decoration: BoxDecoration(
                  color: Color(0xFFAAD2FF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Stack(
                  children: [
                    // Back icon
                    Positioned(
                      left: 16,
                      top: 16,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    // Centered "My details" text
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Text(
                          'My details',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF044997),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Profile circle
            Positioned(
              top: 170,
              left: MediaQuery.of(context).size.width / 2 - 55,
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // Name and details
            Positioned(
              top: 312,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    'Ponnuri Vamsi',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF044997),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'DOB: 06/01/2005',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF044997),
                        ),
                      ),
                      SizedBox(width: 50),
                      Text(
                        'Age: 20',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF044997),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // First card
            Positioned(
              top: 400,
              left: 20,
              right: 20, // Ensure it fits within the screen width
              child: Container(
                height: 200, // Adjusted height to prevent overlap
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(-5, -5),
                      blurRadius: 14.8,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(3, 3),
                      blurRadius: 12.3,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),

            // Second card
            Positioned(
              top: 620,
              left: 20,
              right: 20, // Ensure it fits within the screen width
              child: Container(
                height: 200, // Adjusted height to prevent overlap
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(-5, -5),
                      blurRadius: 14.8,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(3, 3),
                      blurRadius: 12.3,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
