import 'package:flutter/material.dart';

class MyDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Background gradient
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Color(0xFFE9F8FF)],
                ),
              ),
            ),

            // Top blue section
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 110,
                decoration: BoxDecoration(
                  color: Color(0xFFAAD2FF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Stack(
                  children: [
                    // Back icon
                    Positioned(
                      left: 16,
                      top: 16,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    // Centered "My details" text
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          'My details',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF044997),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Profile circle
            Positioned(
              top: 120,
              left: MediaQuery.of(context).size.width / 2 - 55,
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // Name and age
            Positioned(
              top: 230,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    'Ponnuri Vamsi',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF044997),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Age: 20',
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF044997),
                    ),
                  ),
                ],
              ),
            ),

            // About you card
            Positioned(
              top: 300,
              left: 20,
              right: 20,
              child: Container(
                height: 210,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(-5, -5),
                      blurRadius: 14.8,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(3, 3),
                      blurRadius: 12.3,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About you',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF044997),
                        ),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        decoration: InputDecoration(
                          labelText: ' DOB',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(vertical: 5), // Adjust padding
                        ),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        decoration: InputDecoration(
                          labelText: ' Gmail',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(vertical: 5), // Adjust padding
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: ' Weight',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(vertical: 5), // Adjust padding
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: ' Height',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(vertical: 5 ,horizontal: 5), // Adjust padding
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // My family card
            Positioned(
              top: 520,
              left: 20,
              right: 20,
              bottom: 20, // Ensure it doesn't overflow
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(-5, -5),
                      blurRadius: 14.8,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(3, 3),
                      blurRadius: 12.3,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My family',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF044997),
                        ),
                      ),
                      SizedBox(height: 5),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // Wrap each FamilyMemberCard in a Card widget
                              Card(
                                margin: EdgeInsets.symmetric(vertical: 4.0),
                                child: FamilyMemberCard(name: 'Vamsi', relation: 'Son'),
                              ),
                              Card(
                                margin: EdgeInsets.symmetric(vertical: 4.0),
                                child: FamilyMemberCard(name: 'Vamsi', relation: 'Son'),
                              ),
                              Card(
                                margin: EdgeInsets.symmetric(vertical: 4.0),
                                child: FamilyMemberCard(name: 'Vamsi', relation: 'Son'),
                              ),
                              Card(
                                margin: EdgeInsets.symmetric(vertical: 4.0),
                                child: FamilyMemberCard(name: 'Vamsi', relation: 'Son'),
                              ),
                              Card(
                                margin: EdgeInsets.symmetric(vertical: 4.0),
                                child: FamilyMemberCard(name: 'Vamsi', relation: 'Son'),
                              ),
                              Card(
                                margin: EdgeInsets.symmetric(vertical: 4.0),
                                child: FamilyMemberCard(name: 'Vamsi', relation: 'Son'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FamilyMemberCard extends StatefulWidget {
  final String name;
  final String relation;

  FamilyMemberCard({required this.name, required this.relation});

  @override
  _FamilyMemberCardState createState() => _FamilyMemberCardState();
}

class _FamilyMemberCardState extends State<FamilyMemberCard> {
  bool canViewDocuments = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Row(
        children: [
          // Profile picture placeholder
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          SizedBox(width: 10),
          // Name and relation
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF044997),
                      ),
                    ),
                    Spacer(),
                    // Checkbox and delete icon aligned to the right
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: canViewDocuments,
                              onChanged: (value) {
                                setState(() {
                                  canViewDocuments = value!;
                                });
                              },
                            ),
                            Text(
                              'can view documents',
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                fontSize: 14,
                                color: Color(0xFF044997),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // Handle delete action
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Delete Family Member'),
                                  content: Text('Are you sure you want to delete this family member?'),
                                  actions: [
                                    TextButton(
                                      child: Text('Cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text('Delete'),
                                      onPressed: () {
                                        // Perform delete action
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  'Relation: ${widget.relation}',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 14,
                    color: Color(0xFF044997),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyDetailsScreen(),
  ));
}
