import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitalstats/LoginScreens/adhaarscreen.dart';
import '../HomeScreens/homescreen.dart'; // Import the Aadhaar screen

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Padding around the Card
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.06), // Responsive padding
              child: Center(
                child: Container(
                  width: screenWidth * 0.85, // Responsive width
                  height: screenHeight * 0.6, // Responsive height
                  margin: EdgeInsets.only(top: screenHeight * 0.15), // Responsive top margin
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
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
                    padding: EdgeInsets.all(screenWidth * 0.07), // Responsive padding
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight * 0.01), // Responsive space
                          // Login Text
                          Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: screenWidth * 0.07, // Responsive font size
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02), // Responsive space
                          // Gmail Label and Field
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Gmail',
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
                          SizedBox(height: screenHeight * 0.02), // Responsive space
                          // Password Label and Field
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
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {
                                // Handle forgot password
                              },
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02), // Responsive space
                          // Sign In Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  // Retrieve the stored data
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  String storedEmail = prefs.getString('email') ?? '';
                                  String storedPassword = prefs.getString('password') ?? '';

                                  // Verify the credentials
                                  if (emailController.text == storedEmail && passwordController.text == storedPassword) {
                                    // Navigate to the home screen
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => HomeScreen()),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Invalid email or password')),
                                    );
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // Blue color
                                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02), // Responsive padding
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.white), // Responsive font size
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.03), // Responsive space
                          // Sign Up Text
                          Column(
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(color: Colors.black87),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: screenHeight * 0.01), // Responsive space
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => adhaarScreen()),
                                  );
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
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
              top: screenHeight * 0.1, // Responsive positioning
              left: screenWidth / 2 - (screenWidth * 0.18), // Center the image
              child: Container(
                width: screenWidth * 0.36, // Responsive size
                height: screenWidth * 0.36,
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
