import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vitalstats/LoginScreens/RegistrationScreen/GmailSignUpScreen.dart';
import '../../HomeScreen1/homescreen.dart'; // Import the HomeScreen

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

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
            // Card for Sign-In Form
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.07), // Responsive padding
              child: Center(
                child: Container(
                  width: screenWidth * 0.85, // Responsive width
                  constraints: BoxConstraints(
                    maxHeight: screenHeight * 0.7, // Adjust max height to fit within screen
                  ),
                  margin: EdgeInsets.only(top: screenHeight * 0.13), // Responsive top margin
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: screenHeight * 0.02), // Responsive space
                            // Login Text
                            Text(
                              'Login',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: screenWidth * 0.06, // Responsive font size
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
                                    prefixIcon: Icon(Icons.email),
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
                                  backgroundColor: Colors.blue,
                                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01), // Responsive padding
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                ),
                                child: Text(
                                  'Login',
                                  style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.white), // Responsive font size
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02), // Responsive space
                            // Google Icon Button
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () async {
                                  await _handleGoogleSignIn();
                                },
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.transparent), // Remove border
                                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01), // Responsive padding
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/google_logo.png', // Add your Google logo asset here
                                    width: screenWidth * 0.1, // Adjust size as needed
                                    height: screenWidth * 0.1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02), // Responsive space
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
                                      MaterialPageRoute(builder: (context) => GmailSignUpScreen()),
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
            ),
            // Circular Image Placeholder
            Positioned(
              top: screenHeight * 0.085, // Responsive positioning
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
      resizeToAvoidBottomInset: true, // Ensure the keyboard does not push the content too far up
    );
  }

  Future<void> _handleGoogleSignIn() async {
    try {
      await _googleSignIn.signOut();
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        // Handle the authentication token and navigate to the home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } catch (error) {
      print("Error during Google Sign-In: $error");
    }
  }
}
