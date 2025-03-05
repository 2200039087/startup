import 'package:flutter/material.dart';
import 'Survey3Screen.dart'; // Correct import

class Survey2Screen extends StatefulWidget {
  @override
  _Survey2ScreenState createState() => _Survey2ScreenState();
}

class _Survey2ScreenState extends State<Survey2Screen> {
  double _height = 140; // Default height in cm
  bool _isCm = true; // Toggle between cm and inches
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      initialScrollOffset: (_height - 100) * 20, // Set initial scroll position
    );
    _scrollController.addListener(_updateHeight);
  }

  void _updateHeight() {
    final newHeight = 100 + _scrollController.offset / 20;
    setState(() {
      _height = newHeight;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateHeight);
    _scrollController.dispose();
    super.dispose();
  }

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
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Survey3Screen()),
              );
            },
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04), // Responsive font size
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
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
                      value: 0.33,
                      backgroundColor: Colors.grey[300],
                      color: Colors.blue, // Change to blue
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03), // Responsive space
                  Text(
                    'What is your height?',
                    style: TextStyle(
                      fontSize: screenWidth * 0.07, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03), // Responsive space
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildToggleButton('cm', _isCm, screenWidth, screenHeight),
                      SizedBox(width: screenWidth * 0.05), // Responsive space
                      _buildToggleButton('inches', !_isCm, screenWidth, screenHeight),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03), // Responsive space
                  Center(
                    child: Text(
                      '${_height.toStringAsFixed(0)} ${_isCm ? 'cm' : 'inches'}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.12, // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02), // Responsive space
                ],
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: ListView.builder(
                      controller: _scrollController,
                      physics: BouncingScrollPhysics(),
                      itemCount: 200,
                      itemExtent: screenHeight * 0.04, // Responsive item extent
                      reverse: true,
                      itemBuilder: (context, index) {
                        final value = 100 + index;
                        final isMajorTick = value % 10 == 0;

                        return Center(
                          child: isMajorTick
                              ? Column(
                            children: [
                              Container(
                                height: 2,
                                width: 2,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 4),
                              Text(
                                value.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth * 0.04, // Responsive font size
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                              : Container(
                            height: 10,
                            width: 1,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.2, // Responsive positioning
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: screenWidth * 0.1, // Responsive size
                      color: Colors.blue, // Change to blue
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
                bottom: MediaQuery.of(context).viewInsets.bottom + screenHeight * 0.02,
              ),
              child: SafeArea(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Survey3Screen()),
                    );
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isSelected, double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if ((label == 'cm' && !_isCm) || (label == 'inches' && _isCm)) {
            _isCm = label == 'cm';
            _height = _isCm ? _height * 2.54 : _height / 2.54;
          }
        });
      },
      child: Container(
        width: screenWidth * 0.3, // Responsive width
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02), // Responsive padding
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[300], // Change to blue
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
}
