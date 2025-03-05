import 'package:flutter/material.dart';

class SleepScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sleep"),
        backgroundColor: Color(0xFFE4B6FF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(60),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background Gradient
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Color(0xFFFAF0FF)],
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.zero,
                bottom: Radius.circular(60),
              ),
            ),
          ),

          // Main Content Area
          Positioned(
            top: 50, // Adjusted to reduce overlap
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF2DCFF),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.89),
                    offset: Offset(-5, -5),
                    blurRadius: 14.8,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.87),
                    offset: Offset(3, 3),
                    blurRadius: 12.3,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.4),
                    offset: Offset(1, 1),
                    blurRadius: 2,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(-1, -1),
                    blurRadius: 2,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date Section
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today, color: Color(0xFFA100FF)),
                          SizedBox(width: 8),
                          Text(
                            "06-01-2005",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF4E007B),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Sleep Chart
                    Container(
                      height: 180, // Adjusted height
                      child: Column(
                        children: [
                          // Placeholder for sleep chart bars
                          Row(
                            children: List.generate(
                              5,
                                  (index) => Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 70, // Adjusted height
                                      width: 35, // Adjusted width
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD997FF),
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(4),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      height: 50, // Adjusted height
                                      width: 35, // Adjusted width
                                      decoration: BoxDecoration(
                                        color: Color(0xFFCB70FF),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      height: 30, // Adjusted height
                                      width: 35, // Adjusted width
                                      decoration: BoxDecoration(
                                        color: Color(0xFFA100FF),
                                        borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(4),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // Sleep Stages
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.circle, color: Color(0xFFD997FF), size: 10),
                            SizedBox(width: 4),
                            Text(
                              "Light: 2h",
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFD997FF),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.circle, color: Color(0xFFCB70FF), size: 10),
                            SizedBox(width: 4),
                            Text(
                              "Deep: 2h",
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFCB70FF),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.circle, color: Color(0xFFA100FF), size: 10),
                            SizedBox(width: 4),
                            Text(
                              "REM: 2h",
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFA100FF),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Total Sleep Time
                    Text(
                      "Total sleep time: 2h",
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFA100FF),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Can't Sleep Section
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Can't sleep?",
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Color(0xFFA100FF),
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Try white noise",
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFA100FF),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
