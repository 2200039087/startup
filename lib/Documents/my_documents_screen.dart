import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDocumentsScreen extends StatefulWidget {
  @override
  _MyDocumentsScreenState createState() => _MyDocumentsScreenState();
}

class _MyDocumentsScreenState extends State<MyDocumentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ponnuri\'s Documents'),
        backgroundColor: Color(0xFF005F40),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Documents-1 Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Documents-1',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildFolderCard('Folder name', 'Summary: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nibh augue, suscipit nec dui vel, pellentesque sodales risus. Last updated: Time xx:xx am, Date xx-xx-xxxx'),
                  _buildFolderCard('Folder name', 'Summary: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nibh augue, suscipit nec dui vel, pellentesque sodales risus. Last updated: Time xx:xx am, Date xx-xx-xxxx'),
                  _buildFolderCard('Folder name', 'Summary: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nibh augue, suscipit nec dui vel, pellentesque sodales risus. Last updated: Time xx:xx am, Date xx-xx-xxxx'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Add Folder screen or show a dialog to add a folder
                      _showAddFolderDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF005F40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Add Folder'),
                  ),
                ],
              ),
            ),
            // Documents-2 Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Documents-2',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildFileCard('File name'),
                  _buildFileCard('File name'),
                  _buildFileCard('File name'),
                  _buildFileCard('File name'),
                  _buildFileCard('File name'),
                  _buildFileCard('File name'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality for the floating action button
        },
        backgroundColor: Color(0xFF005F40),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildFolderCard(String folderName, String summary) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
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
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            summary,
            style: GoogleFonts.lato(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileCard(String fileName) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          fileName,
          style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
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
            height: 200,
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
                    // Handle folder addition logic here
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF005F40),
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