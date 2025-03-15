import 'package:flutter/material.dart';
import 'package:vitalstats/HomeScreen1/homescreen.dart';

<<<<<<< HEAD
import 'LoginScreens/EntryScreens/welcomepicturesscreen.dart';
=======
import 'LoginScreens/LoginScreen/signinscreen.dart';
import 'LoginScreens/RegistrationScreen/signupscreen.dart';
>>>>>>> e77eebdb63288422172d5d7f9d6cf4e202c790a0
void main() {
  runApp(VitalStatsApp());
}

class VitalStatsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vital Stats',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
<<<<<<< HEAD
      home: OnboardingScreen(),
=======
      home: SignUp3Screen(),
>>>>>>> e77eebdb63288422172d5d7f9d6cf4e202c790a0
    );
  }
}