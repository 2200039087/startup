import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyMedicinesScreen extends StatefulWidget {
  @override
  _MyMedicinesScreenState createState() => _MyMedicinesScreenState();
}

class _MyMedicinesScreenState extends State<MyMedicinesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ponnuri\'s Medicines'),
        backgroundColor: Color(0xFF005F40),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TYMOT-1 Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Consultation name',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildConsultationCard('Consultation-1', 'Created On: xx-xx-xxxx, Time: xx:xx am'),
                  _buildConsultationCard('Consultation-2', 'Created On: xx-xx-xxxx, Time: xx:xx am'),
                  _buildConsultationCard('Consultation-3', 'Created On: xx-xx-xxxx, Time: xx:xx am'),
                  _buildConsultationCard('Consultation-4', 'Created On: xx-xx-xxxx, Time: xx:xx am'),
                  _buildConsultationCard('Consultation-5', 'Created On: xx-xx-xxxx, Time: xx:xx am'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Add Consultation screen or show a dialog to add a consultation
                      _showAddConsultationDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF005F40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Add Consultation'),
                  ),
                ],
              ),
            ),
            // TYMOT-2 Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Consultation name',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildMedicineCard('Medicine-1', 'No. of days left: x days, Alarm: xx:xx am, Frequency: every x days, End date: xx-xx-xxxx'),
                  _buildMedicineCard('Medicine-2', 'No. of days left: x days, Alarm: xx:xx am, Frequency: every x days, End date: xx-xx-xxxx'),
                  _buildMedicineCard('Medicine-3', 'No. of days left: x days, Alarm: xx:xx am, Frequency: every x days, End date: xx-xx-xxxx'),
                  _buildMedicineCard('Medicine-4', 'No. of days left: x days, Alarm: xx:xx am, Frequency: every x days, End date: xx-xx-xxxx'),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        // Navigate to Add Medicine screen or show a dialog to add a medicine
                        _showAddMedicineDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF005F40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Add Medication'),

                  ),
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

  Widget _buildConsultationCard(String consultationName, String details) {
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
            consultationName,
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            details,
            style: GoogleFonts.lato(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicineCard(String medicineName, String details) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            medicineName,
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            details,
            style: GoogleFonts.lato(
              fontSize: 14,
              color: Colors.grey[600],
            ),
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
            height: 200,
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
                    // Handle consultation addition logic here
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

  void _showAddMedicineDialog(BuildContext context) {
    TextEditingController medicineNameController = TextEditingController();
    TextEditingController dosageController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Container(
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: medicineNameController,
                  decoration: InputDecoration(labelText: 'Enter Name'),
                ),
                TextField(
                  controller: dosageController,
                  decoration: InputDecoration(labelText: 'Dosage (in mg)'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle tablet selection
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Tablet'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle syrup selection
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Syrup'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle medicine addition logic here
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF005F40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
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
}