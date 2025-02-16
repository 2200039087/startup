import 'dart:async';

import 'package:flutter/material.dart';

import 'signupscreen.dart'; // Ensure you have the correct import

class adhaarScreen extends StatelessWidget {
  final TextEditingController aadhaarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF005F40),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0, // Remove the shadow below the AppBar
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            children: [
              // Header Section
              Container(
                height: 150, // Adjusted height to accommodate the AppBar
                decoration: BoxDecoration(
                  color: Color(0xFF005F40),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 40,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 40),

              // Aadhaar Number Field
              Container(
                width: MediaQuery.of(context).size.width * 0.85, // 85% of screen width
                child: TextFormField(
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
                ),
              ),

              SizedBox(height: 30),

              // Next Button
              ElevatedButton(
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
                  backgroundColor: Color(0xFF005F40),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),

              SizedBox(height: 20),

              // Sign In Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Have an account?"),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Navigate back to Sign In
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Color(0xFF005F40),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
  final TextEditingController otpController = TextEditingController();
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
    otpController.dispose();
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
        backgroundColor: Color(0xFF005F40),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0, // Remove the shadow below the AppBar
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Section
            Container(
              height: 150, // Adjusted height to accommodate the AppBar
              decoration: BoxDecoration(
                color: Color(0xFF005F40),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 40),

            // OTP Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'OTP',
                  labelStyle: TextStyle(
                    color: Colors.grey[700],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),

            SizedBox(height: 10),

            // Countdown Timer & Resend OTP
            Center(
              child: Column(
                children: [
                  Text(
                    _canResendOTP
                        ? "Didn't receive the OTP?"
                        : "Resend OTP in $_countdown seconds",
                    style: TextStyle(
                      color: _canResendOTP ? Colors.grey[700] : Colors.red,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: _canResendOTP ? resendOTP : null,
                    style: TextButton.styleFrom(
                      foregroundColor: _canResendOTP
                          ? Color(0xFF005F40)
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

            SizedBox(height: 30),

            // Next Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle OTP Submission Logic
                  String otp = otpController.text.trim();
                  if (otp.isEmpty || otp.length != 4 || !RegExp(r'^\d{4}$').hasMatch(otp)) {
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
                  backgroundColor: Color(0xFF005F40),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
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
                      color: Color(0xFF005F40),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
