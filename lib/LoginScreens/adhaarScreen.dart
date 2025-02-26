import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vitalstats/LoginScreens/signupscreen.dart';

class adhaarScreen extends StatelessWidget {
  final TextEditingController aadhaarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0, // Remove the shadow below the AppBar
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Card for Sign-Up Form
            Padding(
              padding: const EdgeInsets.all(29.0), // Add padding around the card
              child: Center(
                child: Container(
                  width: 320, // Decreased width to match design
                  height: 330, // Decreased height to match design
                  margin: EdgeInsets.only(top: 120), // Adjust top margin to center
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(height: 30), // Add space for the overlapping circle
                        // Sign Up Text
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20),
                        // Aadhaar Number Field
                        TextFormField(
                          controller: aadhaarController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Aadhaar Number',
                            hintText: 'xxxx xxxx xxxx',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.credit_card),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Aadhaar Number is required';
                            } else if (value.length != 12 || !RegExp(r'^\d{12}$').hasMatch(value)) {
                              return 'Enter a valid Aadhaar number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 30),
                        // Next Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate Aadhaar Number
                              String aadhaar = aadhaarController.text.trim();
                              if (aadhaar.isEmpty ||
                                  aadhaar.length != 12 ||
                                  !RegExp(r'^\d{12}$').hasMatch(aadhaar)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Please enter a valid Aadhaar number'),
                                  ),
                                );
                                return;
                              }

                              // Navigate to OTP Screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => OTPVerificationScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                            ),
                            child: Text(
                              'Next',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 19),
                        // Sign In Text
                        Column(
                          children: [
                            Text(
                              "Have an account?",
                              style: TextStyle(color: Colors.black87),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(width: 6),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context); // Navigate back to Sign In
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ), //column
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Circular Image Placeholder
            Positioned(
              top: 100,
              left: MediaQuery.of(context).size.width / 1.22 - 36.75, // Center the image
              child: Container(
                width: 99.5,
                height: 120.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.grey[300],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final List<TextEditingController> otpControllers = List.generate(6, (_) => TextEditingController());
  late Timer _timer;
  int _countdown = 30; // Countdown in seconds
  bool _canResendOTP = false;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  @override
  void dispose() {
    _timer.cancel();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void startCountdown() {
    _canResendOTP = false; // Disable resend button
    _countdown = 30; // Reset countdown
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown == 0) {
        setState(() {
          _canResendOTP = true; // Enable resend button
        });
        _timer.cancel();
      } else {
        setState(() {
          _countdown--;
        });
      }
    });
  }

  void resendOTP() {
    // Simulate OTP resend logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('OTP Resent! Please check your messages.')),
    );

    // Restart the countdown
    startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0, // Remove the shadow below the AppBar
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Card for OTP Verification Form
            Padding(
              padding: const EdgeInsets.all(35.0), // Add padding around the card
              child: Center(
                child: Container(
                  width: 320, // Decreased width to match design
                  height: 380, // Decreased height to match design
                  margin: EdgeInsets.only(top: 120), // Adjust top margin to center
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SizedBox(height: 10), // Add space for the overlapping circle
                        // Sign Up Text
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20),
                        // Enter OTP Text
                        Text(
                          'Enter OTP',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        // OTP Input Fields
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(6, (index) {
                            return SizedBox(
                              width: 40,
                              height: 45,
                              child: TextFormField(
                                controller: otpControllers[index],
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onChanged: (value) {
                                  if (value.length == 1 && index < 5) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 15),
                        // Countdown Timer & Resend OTP
                        Center(
                          child: Column(
                            children: [
                              Text(
                                "Resend OTP in $_countdown seconds",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 10),
                              TextButton(
                                onPressed: _canResendOTP ? resendOTP : null,
                                style: TextButton.styleFrom(
                                  foregroundColor: _canResendOTP
                                      ? Colors.blue
                                      : Colors.grey[400],
                                ),
                                child: Text(
                                  'Resend OTP',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        // Next Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle OTP Submission Logic
                              String otp = otpControllers.map((controller) => controller.text.trim()).join();
                              if (otp.length != 6 || !RegExp(r'^\d{6}$').hasMatch(otp)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Please enter a valid OTP'),
                                  ),
                                );
                                return;
                              }

                              // If OTP is valid, proceed to the next screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>SignUp3Screen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Next',
                                  style: TextStyle(fontSize: 18, color: Colors.white),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        // Sign In Text
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Have an account?",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context); // Navigate back to Sign In
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Circular Image Placeholder
            Positioned(
              top: 100,
              left: MediaQuery.of(context).size.width / 1.22 - 36.75, // Center the image
              child: Container(
                width: 99.5,
                height: 120.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.grey[300],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
