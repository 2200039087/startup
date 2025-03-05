import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // For date formatting

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
                          Navigator.of(context).pop();
                        },
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
                // Add functionality to add files dynamically
                _showAddFileDialog(context);
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

  void _showAddFileDialog(BuildContext context) {
    TextEditingController fileNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Container(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: fileNameController,
                  decoration: InputDecoration(labelText: 'Enter File Name'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String name = fileNameController.text.trim();
                    if (name.isNotEmpty) {
                      setState(() {
                        files.add(name);
                      });
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('File name is required')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0078FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Create'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MyDocumentsScreen extends StatefulWidget {
  @override
  _MyDocumentsScreenState createState() => _MyDocumentsScreenState();
}

class _MyDocumentsScreenState extends State<MyDocumentsScreen> {
  // List to store folder data
  List<Map<String, String>> folders = [];

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
                height: 250,
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
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    // Title
                    Positioned(
                      top: 50,
                      left: 105,
                      child: Text(
                        'My Documents',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(10.0),
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Adjusted padding
                    ),
                  ),
                ),
              ),
              // Documents-1 Section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: folders.isEmpty
                      ? Center(
                    child: Text(
                      'No folders added.',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  )
                      : ListView.builder(
                    itemCount: folders.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FolderScreen(folderName: folders[index]['name'] ?? ''),
                            ),
                          );
                        },
                        child: _buildFolderCard(
                          context,
                          folders[index]['name'] ?? '',
                          folders[index]['date'] ?? '',
                          folders[index]['time'] ?? '',
                        ),
                      );
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
                _showAddFolderDialog(context);
              },
              backgroundColor: Color(0xFF0078FF),
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFolderCard(BuildContext context, String folderName, String date, String time) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            folderName,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0078FF),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Last updated:',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF044997),
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                'Time: ',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF044997),
                ),
              ),
              Text(
                time,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF044997),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Date: ',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF044997),
                ),
              ),
              Text(
                date,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF044997),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showAddFolderDialog(BuildContext context) {
    TextEditingController folderNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Container(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: folderNameController,
                  decoration: InputDecoration(labelText: 'Enter Folder Name'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String name = folderNameController.text.trim();
                    if (name.isNotEmpty) {
                      String currentDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
                      String currentTime = DateFormat('HH:mm a').format(DateTime.now());

                      setState(() {
                        folders.add({
                          'name': name,
                          'date': currentDate,
                          'time': currentTime,
                        });
                      });
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Folder name is required')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0078FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Create'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
