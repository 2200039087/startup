import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vitalstats/LoginScreens/RegistrationScreen/signupscreen.dart';

class GmailSignUpScreen extends StatelessWidget {
  final TextEditingController gmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
              padding: EdgeInsets.all(screenWidth * 0.07), // Responsive padding
              child: Center(
                child: Container(
                  width: screenWidth * 0.85, // Responsive width
                  height: screenHeight * 0.40, // Adjusted height
                  margin: EdgeInsets.only(top: screenHeight * 0.15), // Responsive top margin
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
                    padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
                    child: Column(
                      children: [
                        SizedBox(height: screenHeight * 0.03), // Responsive space
                        // Sign Up Text
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: screenWidth * 0.05, // Responsive font size
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02), // Responsive space
                        // Gmail Input Field
                        TextFormField(
                          controller: gmailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Gmail',
                            hintText: 'example@gmail.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: Icon(Icons.email),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Gmail is required';
                            } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@gmail\.com$').hasMatch(value)) {
                              return 'Enter a valid Gmail address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: screenHeight * 0.03), // Responsive space
                        // Next Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate Gmail
                              String gmail = gmailController.text.trim();
                              if (gmail.isEmpty ||
                                  !RegExp(r'^[\w-]+(\.[\w-]+)*@gmail\.com$').hasMatch(gmail)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Please enter a valid Gmail address'),
                                  ),
                                );
                                return;
                              }

                              // Simulate sending OTP
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('OTP sent to $gmail')),
                              );

                              // Navigate to OTP Verification Screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => OTPVerificationScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02), // Responsive padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                            ),
                            child: Text(
                              'Next',
                              style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.white), // Responsive font size
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02), // Responsive space
                        // Google Icon
                        SizedBox(height: screenHeight * 0.02), // Responsive space
                        // Sign In Text
                        Column(
                          children: [
                            Text(
                              "Have an account?",
                              style: TextStyle(color: Colors.black87),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: screenHeight * 0.01), // Responsive space
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
              top: screenHeight * 0.13, // Responsive positioning
              left: screenWidth / 1.9 - (screenWidth * 0.0), // Center the image
              child: Container(
                width: screenWidth * 0.6, // Responsive size
                height: screenWidth * 0.3,
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
              padding: EdgeInsets.all(screenWidth * 0.08), // Responsive padding
              child: Center(
                child: Container(
                  width: screenWidth * 0.85, // Responsive width
                  height: screenHeight * 0.5, // Responsive height
                  margin: EdgeInsets.only(top: screenHeight * 0.15), // Responsive top margin
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
                    padding: EdgeInsets.all(screenWidth * 0.03), // Responsive padding
                    child: Column(
                      children: [
                        SizedBox(height: screenHeight * 0.02), // Responsive space
                        // Sign Up Text
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: screenWidth * 0.05, // Responsive font size
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02), // Responsive space
                        // Enter OTP Text
                        Text(
                          'Enter OTP',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: screenWidth * 0.04, // Responsive font size
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02), // Responsive space
                        // OTP Input Fields
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(6, (index) {
                            return SizedBox(
                              width: screenWidth * 0.1, // Responsive width
                              height: screenHeight * 0.06, // Responsive height
                              child: TextFormField(
                                controller: otpControllers[index],
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                maxLength: 1, // Limit to 1 character
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  counterText: "", // Hide the character counter
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
                        SizedBox(height: screenHeight * 0.02), // Responsive space
                        // Countdown Timer & Resend OTP
                        Center(
                          child: Column(
                            children: [
                              Text(
                                "Resend OTP in $_countdown seconds",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: screenWidth * 0.035, // Responsive font size
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01), // Responsive space
                              TextButton(
                                onPressed: _canResendOTP ? resendOTP : null,
                                style: TextButton.styleFrom(
                                  foregroundColor: _canResendOTP
                                      ? Colors.blue
                                      : Colors.grey[400],
                                ),
                                child: Text(
                                  'Resend OTP',
                                  style: TextStyle(fontSize: screenWidth * 0.04), // Responsive font size
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02), // Responsive space
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
                                MaterialPageRoute(builder: (context) => SignUp3Screen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02), // Responsive padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Next',
                                  style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.white), // Responsive font size
                                ),
                                SizedBox(width: screenWidth * 0.025), // Responsive space
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
                            SizedBox(width: screenWidth * 0.015), // Responsive space
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
                        SizedBox(height: screenHeight * 0.02), // Responsive space
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Circular Image Placeholder
            Positioned(
              top: screenHeight * 0.15, // Responsive positioning
              left: screenWidth / 1.9 - (screenWidth * 0.0), // Center the image
              child: Container(
                width: screenWidth * 0.6, // Responsive size
                height: screenWidth * 0.3,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
