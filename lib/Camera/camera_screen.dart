import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera Screen"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          "Camera Screen Content",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
