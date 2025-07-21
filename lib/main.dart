import 'package:flutter/material.dart';
import 'package:vitalstats/HomeScreen1/homescreen.dart';
import 'LoginScreens/EntryScreens/welcomepicturesscreen.dart';
import 'LoginScreens/LoginScreen/signinscreen.dart';
import 'LoginScreens/RegistrationScreen/signupscreen.dart';
import 'LoginScreens/survey_screens/Survey6Screen.dart';
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
      home: HomeScreen(),
    );
  }
}