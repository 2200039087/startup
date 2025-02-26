import 'package:flutter/material.dart';
import 'package:vitalstats/survey_screens/Survey3Screen.dart'; // Correct import

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
                  SizedBox(
                    height: 7, // Adjust height to decrease size
                    child: LinearProgressIndicator(
                      value: 0.33,
                      backgroundColor: Colors.grey[300],
                      color: Colors.blue, // Change to blue
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'What is your height?',
                    style: TextStyle(
                      fontSize: 30, // Increase font size
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildToggleButton('cm', _isCm),
                      SizedBox(width: 20), // Add space between cards
                      _buildToggleButton('inches', !_isCm),
                    ],
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      '${_height.toStringAsFixed(0)} ${_isCm ? 'cm' : 'inches'}',
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
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: ListView.builder(
                      controller: _scrollController,
                      physics: BouncingScrollPhysics(),
                      itemCount: 200,
                      itemExtent: 32,
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
                                  fontSize: 16,
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
                    top: 150,
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 40,
                      color: Colors.blue, // Change to blue
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
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
          if ((label == 'cm' && !_isCm) || (label == 'inches' && _isCm)) {
            _isCm = label == 'cm';
            _height = _isCm ? _height * 2.54 : _height / 2.54;
          }
        });
      },
      child: Container(
        width: 120, // Increase width
        padding: EdgeInsets.symmetric(vertical: 16), // Increase padding
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
