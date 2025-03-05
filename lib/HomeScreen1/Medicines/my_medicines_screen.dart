import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'ConsultantScreen.dart';// Import the new screen

class MyMedicinesScreen extends StatefulWidget {
  @override
  _MyMedicinesScreenState createState() => _MyMedicinesScreenState();
}

class _MyMedicinesScreenState extends State<MyMedicinesScreen> {
  // List to store consultation cards
  List<Map<String, String>> consultations = [];
  TextEditingController _searchController = TextEditingController();

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
                        'My Medication',
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
                padding: const EdgeInsets.all(14.0),
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
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search Family',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    onChanged: (value) {
                      // Implement search functionality here
                    },
                  ),
                ),
              ),
              // Consultation List
              Expanded(
                child: consultations.isEmpty
                    ? Center(
                  child: Text(
                    'No consultations added.',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                )
                    : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var consultation in consultations)
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ConsultantScreen(),
                                ),
                              );
                            },
                            child: _buildConsultationCard(
                              consultation['name'] ?? '',
                              consultation['date'] ?? '',
                              consultation['time'] ?? '',
                                  () => _deleteConsultation(consultation),
                            ),
                          ),
                      ],
                    ),
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
                _showAddConsultationDialog(context);
              },
              backgroundColor: Color(0xFF0078FF),
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConsultationCard(String consultationName, String date, String time, VoidCallback onDelete) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                consultationName,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF044997),
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            'Updated on:',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF044997),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Date: $date',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF044997),
                ),
              ),
              Text(
                'Time: $time',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF044997),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showAddConsultationDialog(BuildContext context) {
    TextEditingController consultationNameController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Container(
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: consultationNameController,
                  decoration: InputDecoration(labelText: 'Enter Consultation Name'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String name = consultationNameController.text.trim();

                    if (name.isNotEmpty) {
                      String currentDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
                      String currentTime = DateFormat('HH:mm a').format(DateTime.now());

                      setState(() {
                        consultations.add({
                          'name': name,
                          'date': currentDate,
                          'time': currentTime,
                        });
                      });
                      Navigator.of(context).pop();
                    } else {
                      // Optionally, show an error message if the name is empty
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Consultation name is required')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0078FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _deleteConsultation(Map<String, String> consultation) {
    setState(() {
      consultations.remove(consultation);
    });
  }
}
