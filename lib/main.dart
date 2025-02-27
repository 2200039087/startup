import 'package:flutter/material.dart';
import 'package:vitalstats/HomeScreens/homescreen.dart';
import 'EntryScreens/welcomepicturesscreen.dart';
import 'HomeScreens/home_screen2.dart';
import 'LoginScreens/signupscreen.dart';

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
      home: SignUp3Screen(),
    );
  }
}
