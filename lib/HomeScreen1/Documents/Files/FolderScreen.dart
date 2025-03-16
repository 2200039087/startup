import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // For date formatting
import '../../Camera/CameraScreen.dart';

class FolderScreen extends StatefulWidget {
  final String folderName;

  FolderScreen({required this.folderName});

  @override
  _FolderScreenState createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  // List to store file data
  List<String> files = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              // Header Section
              Container(
                height: 250, // Increased height to match MyDocumentsScreen
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFAAD2FF), Color(0xFFAAD2FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(60),
                  ),
                ),
                child: Stack(
                  children: [
                    // Back Arrow Icon
                    Positioned(
                      top: 40,
                      left: 20,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.of(context).pop();                        },
                      ),
                    ),
                    // Title
                    Positioned(
                      top: 50,
                      left: 0,
                      right: 0,
                      child: Text(
                        widget.folderName,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Family',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                  ),
                ),
              ),
              // Files Grid
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: files.isEmpty
                      ? Center(
                    child: Text(
                      'No files added.',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  )
                      : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: files.length,
                    itemBuilder: (context, index) {
                      return _buildFileCard(files[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
          // Floating Action Button
          Positioned(
            bottom: 30,
            right: 30,
            child: FloatingActionButton(
              onPressed: () {
                // Navigate to CameraScreen
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CameraScreen()),
                );
              },
              backgroundColor: Color(0xFF0078FF),
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileCard(String fileName) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          // File Image Placeholder
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                colors: [Colors.white.withOpacity(0), Colors.black.withOpacity(0.42)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // File Name
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              fileName,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF044997),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
