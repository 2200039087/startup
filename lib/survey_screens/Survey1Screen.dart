import 'package:flutter/material.dart';
import 'Survey2Screen.dart'; // Import the next survey screen

class Survey1Screen extends StatefulWidget {
  @override
  _Survey1ScreenState createState() => _Survey1ScreenState();
}

class _Survey1ScreenState extends State<Survey1Screen> {
  double _weight = 140;
  bool _isLbs = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Survey2Screen()),
              );
            },
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinearProgressIndicator(
                    value: 0.25,
                    backgroundColor: Colors.grey[300],
                    color: Color(0xFF00C48C),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'What is your weight?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildToggleButton('lbs', _isLbs),
                      _buildToggleButton('kgs', !_isLbs),
                    ],
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      '${_weight.toStringAsFixed(0)} ${_isLbs ? 'lbs' : 'kgs'}',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: _buildCustomScale(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Survey2Screen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00C48C),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if ((label == 'lbs' && !_isLbs) || (label == 'kgs' && _isLbs)) {
            _isLbs = label == 'lbs';
            _weight = _isLbs ? _weight * 2.20462 : _weight / 2.20462;
          }
        });
      },
      child: Container(
        width: 100,
        padding: EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF00C48C) : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCustomScale() {
    return Column(
      children: [
        Container(
          height: 100, // Adjusted height to prevent overflow
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if (notification is ScrollUpdateNotification) {
                double offset = notification.metrics.pixels;
                setState(() {
                  _weight = _isLbs
                      ? 50 + offset / 10
                      : (50 + offset / 10) / 2.20462;
                });
              }
              return true;
            },
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 300,
              clipBehavior: Clip.hardEdge, // Clips any overflow content
              itemBuilder: (context, index) {
                num value = _isLbs ? 50 + index : (50 + index) / 2.20462;
                bool isMajorTick = index % 10 == 0;
                return Container(
                  width: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 2,
                        height: isMajorTick ? 30 : 15,
                        color: isMajorTick ? Colors.black : Colors.grey,
                      ),
                      if (isMajorTick)
                        Text(
                          value.toStringAsFixed(0),
                          style: TextStyle(fontSize: 12),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        Icon(
          Icons.arrow_drop_down,
          size: 40,
          color: Color(0xFF00C48C),
        ),
      ],
    );
  }
}
