import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitalstats/signinscreen.dart';
import 'survey_screens/Survey1Screen.dart'; // Import the first survey screen

class SignUp3Screen extends StatefulWidget {
  @override
  _SignUp3ScreenState createState() => _SignUp3ScreenState();
}

class _SignUp3ScreenState extends State<SignUp3Screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isRePasswordVisible = false;

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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Phone Number Field
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                        SizedBox(height: 16.0),
                        // Email Address Field
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                        SizedBox(height: 16.0),
                        // Password Field
                        TextFormField(
                          controller: passwordController,
                          obscureText: !_isPasswordVisible, // Toggle password visibility
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'At least 8 characters',
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
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                        SizedBox(height: 16.0),
                        // Re-Password Field
                        TextFormField(
                          controller: rePasswordController,
                          obscureText: !_isRePasswordVisible, // Toggle re-password visibility
                          decoration: InputDecoration(
                            labelText: 'Re-Password',
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
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                        SizedBox(height: 32.0),
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

                                // Navigate to the first survey screen
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => Survey1Screen()),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF005F40), // Dark green color
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignInScreen()),
                                );
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
