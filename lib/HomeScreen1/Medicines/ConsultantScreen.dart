import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ConsultantScreen extends StatefulWidget {
  @override
  _ConsultantScreenState createState() => _ConsultantScreenState();
}

class _ConsultantScreenState extends State<ConsultantScreen> {
  List<Map<String, String>> medicines = [];

  void _showAddMedicineDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    String selectedType = 'Tablet'; // Default selection
    TextEditingController dosageController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: Text('Add Medicine', style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.bold)),
              content: Container(
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedType = 'Tablet';
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: selectedType == 'Tablet' ? Colors.blue : Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                                color: selectedType == 'Tablet' ? Colors.blue.withOpacity(0.2) : Colors.transparent,
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              child: Center(child: Text('Tablet', style: GoogleFonts.plusJakartaSans(fontSize: 16, color: selectedType == 'Tablet' ? Colors.blue : Colors.black))),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedType = 'Syrup';
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: selectedType == 'Syrup' ? Colors.blue : Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                                color: selectedType == 'Syrup' ? Colors.blue.withOpacity(0.2) : Colors.transparent,
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              child: Center(child: Text('Syrup', style: GoogleFonts.plusJakartaSans(fontSize: 16, color: selectedType == 'Syrup' ? Colors.blue : Colors.black))),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: dosageController,
                      decoration: InputDecoration(labelText: 'Dosage (in mg)'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        String name = nameController.text.trim();
                        String dosage = dosageController.text.trim();

                        if (name.isNotEmpty && dosage.isNotEmpty) {
                          Navigator.of(context).pop();
                          _showAddDetailsDialog(context, name, selectedType, dosage);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('All fields are required')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0078FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text('Next'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showAddDetailsDialog(BuildContext context, String name, String type, String dosage) {
    TextEditingController startDateController = TextEditingController();
    TextEditingController intervalController = TextEditingController();
    TextEditingController timeController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text('Add Medicine', style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.bold)),
          content: Container(
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: startDateController,
                  decoration: InputDecoration(labelText: 'Start Date (DD/MM/YYYY)'),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                      setState(() {
                        startDateController.text = formattedDate;
                      });
                    }
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  controller: intervalController,
                  decoration: InputDecoration(labelText: 'Interval (Every X days)'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: timeController,
                        decoration: InputDecoration(labelText: 'Time'),
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedTime != null) {
                            setState(() {
                              timeController.text = pickedTime.format(context);
                            });
                          }
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.access_time),
                      onPressed: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (pickedTime != null) {
                          setState(() {
                            timeController.text = pickedTime.format(context);
                          });
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String startDate = startDateController.text.trim();
                    String interval = intervalController.text.trim();
                    String time = timeController.text.trim();

                    if (startDate.isNotEmpty && interval.isNotEmpty && time.isNotEmpty) {
                      setState(() {
                        medicines.add({
                          'name': name,
                          'type': type,
                          'dosage': dosage,
                          'startDate': startDate,
                          'interval': interval,
                          'time': time,
                          'endDate': _calculateEndDate(startDate, interval),
                        });
                      });
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('All fields are required')),
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

  String _calculateEndDate(String startDate, String interval) {
    DateTime start = DateFormat('dd/MM/yyyy').parse(startDate);
    int daysToAdd = int.parse(interval) * 21; // Assuming 21 days course
    DateTime end = start.add(Duration(days: daysToAdd));
    return DateFormat('dd/MM/yyyy').format(end);
  }

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
                        'Consultation-1',
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
                    decoration: InputDecoration(
                      labelText: 'Search Family',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
              ),
              // Medicine List
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (var medicine in medicines)
                          _buildMedicineCard(
                            medicine['name'] ?? '',
                            medicine['interval'] ?? '',
                            medicine['time'] ?? '',
                            medicine['endDate'] ?? '',
                            medicine['startDate'] ?? '',
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
                _showAddMedicineDialog(context);
              },
              backgroundColor: Color(0xFF0078FF),
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicineCard(String name, String interval, String alarm, String endDate, String startDate) {
    DateTime start = DateFormat('dd/MM/yyyy').parse(startDate);
    DateTime end = DateFormat('dd/MM/yyyy').parse(endDate);
    int daysLeft = end.difference(DateTime.now()).inDays;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
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
          Text(
            name,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0078FF),
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No. of days left:',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF044997),
                    ),
                  ),
                  Text(
                    '$daysLeft days',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF044997),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Frequency:',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF044997),
                    ),
                  ),
                  Text(
                    'Every $interval days',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF044997),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alarm:',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF044997),
                    ),
                  ),
                  Text(
                    alarm,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF044997),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'End date:',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF044997),
                    ),
                  ),
                  Text(
                    endDate,
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
        ],
      ),
    );
  }
}
