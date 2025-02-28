import 'package:flutter/material.dart';
import 'dart:ui';
import 'my_details_screen.dart';

class PopupMenuScreen extends StatelessWidget {
  final VoidCallback onMenuToggle;

  PopupMenuScreen({required this.onMenuToggle});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            _buildBlurredBackground(context, onMenuToggle, screenHeight),
            _buildPopupMenu(screenWidth, screenHeight, context),
          ],
        ),
      ),
    );
  }

  Widget _buildBlurredBackground(BuildContext context, VoidCallback onMenuToggle, double screenHeight) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: MediaQuery.of(context).viewInsets.bottom + MediaQuery.of(context).padding.bottom,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: GestureDetector(
          onTap: onMenuToggle,
          child: Container(
            color: Colors.transparent, // Ensure no overlay color is applied
          ),
        ),
      ),
    );
  }

  Widget _buildPopupMenu(double screenWidth, double screenHeight, BuildContext context) {
    return Positioned(
      bottom: screenHeight * 0.09,
      right: screenWidth * 0.09,
      child: Container(
        width: screenWidth * 0.69,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            _menuItem("Chat with VITA", Icons.chat, context, onMenuToggle),
            _menuItem("My Details", Icons.person, context, () {
              print("Navigating to MyDetailsScreen"); // Debug print
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyDetailsScreen()),
              );
            }),
            _menuItem("Settings", Icons.settings, context, onMenuToggle),
            _menuItem("Terms and Conditions", Icons.description, context, () {
              _showTermsAndConditions(context);
            }),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(String title, IconData icon, BuildContext context, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.blueAccent),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void _showTermsAndConditions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return _buildTermsAndConditionsCard(context);
      },
    );
  }

  Widget _buildTermsAndConditionsCard(BuildContext context) {
    return Center(
      child: Container(
        width: 300, // Adjusted width
        height: 500, // Adjusted height
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Lorem ipsum odor amet, consectetuer adipiscing elit. Aptent quis pulvinar praesent; varius malesuada amet. Parturient ac fringilla senectus curabitur curae, varius vehicula. Vehicula dignissim gravida morbi convallis vehicula eget. Quisque convallis maecenas ante morbi sodales lobortis ipsum. Rutrum erat ac, sed mollis nam risus cubilia ex pretium.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Color(0xFFAAD2FF), // Blue header
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Center(
        child: Text(
          "Terms and Conditions",
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF044997),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Color(0xFFAAD2FF), // Blue footer
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
