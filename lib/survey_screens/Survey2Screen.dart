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
                  LinearProgressIndicator(
                    value: 0.33,
                    backgroundColor: Colors.grey[300],
                    color: Color(0xFF00C48C),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'What is your height?',
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
                      _buildToggleButton('cm', _isCm),
                      SizedBox(width: 10),
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
                      color: Color(0xFF00C48C),
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
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Survey3Screen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF00C48C),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continue',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
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
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
}
