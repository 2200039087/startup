import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class MyFamilyScreen extends StatefulWidget {
  @override
  _MyFamilyScreenState createState() => _MyFamilyScreenState();
}

class _MyFamilyScreenState extends State<MyFamilyScreen> {
  List<Map<String, dynamic>> familyMembers = [];
  int _currentStep = 0;
  String _vsid = '';
  String _otp = '';
  String _name = '';
  String _dob = '';
  String _relation = 'son';

  @override
  void initState() {
    super.initState();
    _loadFamilyMembers();
  }

  void _loadFamilyMembers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? familyMembersJson = prefs.getString('familyMembers');
    if (familyMembersJson != null) {
      setState(() {
        familyMembers = (jsonDecode(familyMembersJson) as List)
            .cast<Map<String, dynamic>>();
      });
    }
  }

  void _saveFamilyMembers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String familyMembersJson = jsonEncode(familyMembers);
    prefs.setString('familyMembers', familyMembersJson);
  }

  void _showAddFamilyMemberBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: _buildBottomSheetContent(context, setState),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildBottomSheetContent(BuildContext context, StateSetter setState) {
    switch (_currentStep) {
      case 0:
        return _buildVsidStep(context, setState);
      case 1:
        return _buildOtpStep(context, setState);
      case 2:
        return _buildDetailsStep(context, setState);
      default:
        return Container();
    }
  }

  Widget _buildVsidStep(BuildContext context, StateSetter setState) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Add Family Member",
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        TextField(
          onChanged: (value) {
            _vsid = value;
          },
          decoration: InputDecoration(
            labelText: "Enter VSID",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (_vsid.isNotEmpty) {
              setState(() {
                _currentStep = 1;
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Please enter VSID")),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF005F40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text("Continue"),
        ),
      ],
    );
  }

  Widget _buildOtpStep(BuildContext context, StateSetter setState) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Add Family Member",
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        TextField(
          onChanged: (value) {
            _otp = value;
          },
          decoration: InputDecoration(
            labelText: "Enter OTP",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (_otp.isNotEmpty) {
              setState(() {
                _currentStep = 2;
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Please enter OTP")),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF005F40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text("Continue"),
        ),
      ],
    );
  }

  Widget _buildDetailsStep(BuildContext context, StateSetter setState) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Add Family Member",
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        TextField(
          onChanged: (value) {
            _name = value;
          },
          decoration: InputDecoration(
            labelText: "Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          onChanged: (value) {
            _dob = value;
          },
          decoration: InputDecoration(
            labelText: "DoB: xx-xx-xxxx",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: _relation,
          decoration: InputDecoration(
            labelText: "Relation",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          items: ['son', 'daughter', 'father', 'mother', 'brother', 'sister']
              .map((relation) => DropdownMenuItem(
            value: relation,
            child: Text(relation),
          ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _relation = value!;
            });
          },
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (_name.isNotEmpty && _dob.isNotEmpty) {
              setState(() {
                familyMembers.add({
                  'name': _name,
                  'dob': _dob,
                  'relation': _relation,
                });
                _saveFamilyMembers();
                _currentStep = 0; // Reset the step
                Navigator.of(context).pop();
                setState(() {}); // Trigger a rebuild to update the UI
              });
              // Update the UI immediately
              setState(() {});
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Please fill in all details")),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF005F40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text("Add"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ponnuri's Family",
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF005F40),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              // Handle calendar button press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Family Members List
            if (familyMembers.isNotEmpty)
              Column(
                children: familyMembers.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, dynamic> member = entry.value;
                  return _buildFamilyMemberCard(context, member, index);
                }).toList(),
              ),
            SizedBox(height: 20),
            // Add Family Member Button
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: _showAddFamilyMemberBottomSheet,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF005F40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFamilyMemberCard(BuildContext context, Map<String, dynamic> member, int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
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
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey[300],
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      member['name']!,
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          'DoB: ${member['dob']}',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Relation: ${member['relation']}',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Handle edit button press
                },
              ),

            ],
          ),
          if (index < familyMembers.length - 1)
            Divider(thickness: 1, color: Colors.grey[300]),
        ],
      ),
    );
  }
}