import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitalstats/HomeScreens/homescreen.dart';
import 'package:vitalstats/survey_screens/Survey1Screen.dart';

class SignUp3Screen extends StatefulWidget {
  @override
  _SignUp3ScreenState createState() => _SignUp3ScreenState();
}

class _SignUp3ScreenState extends State<SignUp3Screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isRePasswordVisible = false;

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
            Center(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
                child: Container(
                  width: screenWidth * 0.85, // Responsive width
                  height: screenHeight * 0.70, // Responsive height
                  margin: EdgeInsets.only(top: screenHeight * 0.1), // Responsive top margin
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight * 0.01), // Responsive space
                          // Sign Up Text
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: screenWidth * 0.075, // Responsive font size
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01), // Responsive space
                          // Email Address Field
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: screenWidth * 0.04, // Responsive font size
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01), // Responsive space
                              TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.email),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.01,
                                    horizontal: screenWidth * 0.04,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email is required';
                                  } else if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
                                    return 'Enter a valid email address';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01), // Responsive space
                          // Phone Number Field
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Phone No.',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: screenWidth * 0.04, // Responsive font size
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01), // Responsive space
                              TextFormField(
                                controller: phoneController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.phone),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.01,
                                    horizontal: screenWidth * 0.04,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Phone number is required';
                                  } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                                    return 'Enter a valid 10-digit phone number';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01), // Responsive space
                          // Password Field
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Password',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: screenWidth * 0.04, // Responsive font size
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01), // Responsive space
                              TextFormField(
                                controller: passwordController,
                                obscureText: !_isPasswordVisible, // Toggle password visibility
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible = !_isPasswordVisible;
                                      });
                                    },
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.01,
                                    horizontal: screenWidth * 0.04,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  } else if (value.length < 8 || !RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$').hasMatch(value)) {
                                    return 'Password must be at least 8 characters long and include letters and numbers';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01), // Responsive space
                          // Re-Password Field
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Re-Type Password',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: screenWidth * 0.04, // Responsive font size
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01), // Responsive space
                              TextFormField(
                                controller: rePasswordController,
                                obscureText: !_isRePasswordVisible, // Toggle re-password visibility
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isRePasswordVisible ? Icons.visibility : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isRePasswordVisible = !_isRePasswordVisible;
                                      });
                                    },
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.01,
                                    horizontal: screenWidth * 0.04,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Re-enter password is required';
                                  } else if (value != passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02), // Responsive space
                          // Sign Up Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  // Store the data locally
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  await prefs.setString('email', emailController.text);
                                  await prefs.setString('password', passwordController.text);

                                  // Navigate to Survey1Screen
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => Survey1Screen()),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01), // Responsive padding
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Circular Image Placeholder
            Positioned(
              top: screenHeight * 0.06, // Responsive positioning
              left: screenWidth / 1.28 - (screenWidth * 0.3), // Center the image
              child: Container(
                width: screenWidth * 0.7, // Responsive size
                height: screenWidth * 0.33,
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
