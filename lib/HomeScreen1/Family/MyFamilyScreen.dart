import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

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
  bool _otpSent = false;
  Timer? _countdownTimer;
  int _countdown = 30;

  final TextEditingController _vsidController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

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

  void _showAddFamilyMemberDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Center(
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  width: 350,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: _buildDialogContent(context, setState),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDialogContent(BuildContext context, StateSetter setState) {
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
          "Add Family",
          style: GoogleFonts.lato(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _vsidController,
          onChanged: (value) {
            _vsid = value;
          },
          keyboardType: TextInputType.number,
          maxLength: 10,
          decoration: InputDecoration(
            labelText: "VS ID",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (_vsid.length == 10) {
              setState(() {
                _otpSent = true;
                _currentStep = 1;
                _otpController.clear(); // Clear OTP field
              });
              _startCountdown();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("OTP sent to VS ID")),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Please enter a 10-digit VS ID")),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF2196F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text("Next"),
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
          controller: _otpController,
          onChanged: (value) {
            _otp = value;
          },
          keyboardType: TextInputType.number,
          maxLength: 6,
          decoration: InputDecoration(
            labelText: "Enter OTP",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 10),
        _otpSent
            ? Text(
          "Resend OTP in $_countdown seconds",
          style: TextStyle(color: Colors.grey),
        )
            : Container(),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (_otp.length == 6) {
              setState(() {
                _currentStep = 2;
                _nameController.clear(); // Clear Name field
              });
              _nameController.text = ''; // Reset the text to ensure the keyboard type is updated
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Please enter the 6-digit OTP")),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF2196F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text("Next"),
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
          controller: _nameController,
          onChanged: (value) {
            _name = value;
          },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: "Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _dobController,
          onChanged: (value) {
            _dob = value;
          },
          decoration: InputDecoration(
            labelText: "DoB",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2080),
                );
                if (picked != null) {
                  setState(() {
                    _dob = "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
                    _dobController.text = _dob;
                  });
                }
              },
            ),
          ),
          readOnly: true,
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
            backgroundColor: Color(0xFF2196F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text("Add"),
        ),
      ],
    );
  }

  void _startCountdown() {
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _countdownTimer?.cancel();
          _otpSent = false;
        }
      });
    });
  }

  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Family Member"),
          content: Text("Do you want to delete this family member?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  familyMembers.removeAt(index);
                  _saveFamilyMembers();
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _vsidController.dispose();
    _otpController.dispose();
    _nameController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "My Family",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFAAD2FF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 260,
              decoration: BoxDecoration(
                color: Color(0xFFAAD2FF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Center(
                child: Image.asset(
                  'assets/family.png', // Replace with your image path
                  width: 266,
                  height: 238,
                ),
              ),
            ),
          ),
          Positioned(
            top: 260,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Color(0xFFE9F8FF)],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 0.0, bottom: 10.0),
                      padding: EdgeInsets.symmetric(horizontal: 13.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 6.7,
                            offset: Offset(-2, 2),
                          ),
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.25),
                            blurRadius: 5.9,
                            offset: Offset(2, -2),
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.9),
                            blurRadius: 9.3,
                            offset: Offset(-2, -2),
                          ),
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.0),
                            blurRadius: 7.6,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search Family",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    if (familyMembers.isNotEmpty)
                      Column(
                        children: familyMembers.asMap().entries.map((entry) {
                          int index = entry.key;
                          Map<String, dynamic> member = entry.value;
                          return _buildFamilyMemberCard(context, member, index);
                        }).toList(),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: ElevatedButton(
              onPressed: _showAddFamilyMemberDialog,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0078FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFamilyMemberCard(BuildContext context, Map<String, dynamic> member, int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.30),
            blurRadius: 14.8,
            offset: Offset(-5, -5),
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.37),
            blurRadius: 12.3,
            offset: Offset(3, 3),
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.4),
            blurRadius: 2,
            offset: Offset(1, 1),
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 2,
            offset: Offset(-1, -1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
              ),
              SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      member['name']!,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0078FF),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          'DoB: ${member['dob']}',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            color: Color(0xFF044997),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Relation: ${member['relation']}',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            color: Color(0xFF044997),
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
                  _showDeleteConfirmationDialog(index);
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
