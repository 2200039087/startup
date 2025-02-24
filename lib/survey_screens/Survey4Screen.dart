import 'package:flutter/material.dart';
import 'Survey5Screen.dart'; // Import the next survey screen

class Survey4Screen extends StatefulWidget {
  @override
  _Survey4ScreenState createState() => _Survey4ScreenState();
}

class _Survey4ScreenState extends State<Survey4Screen> {
  final TextEditingController professionController = TextEditingController();
  final List<String> professions = [
    'Software Engineer',
    'Doctor',
    'Teacher',
    'Lawyer',
    'Designer',
    'Business Analyst',
    'Data Scientist',
    'Chef',
    'Photographer',
    'Accountant',
    'Student',
    'Employee',
    'Entrepreneur'
  ];
  List<String> filteredProfessions = [];

  @override
  void initState() {
    super.initState();
    filteredProfessions = professions; // Show the full list by default
  }

  void filterProfessions(String query) {
    setState(() {
      filteredProfessions = professions
          .where((profession) =>
          profession.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Survey5Screen()),
              );
            },
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(
                  value: 0.5,
                  backgroundColor: Colors.grey[300],
                  color: Color(0xFF00C48C),
                ),
                SizedBox(height: 30),
                Text(
                  'What is your current profession?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                Image.asset(
                  'assets/profession_image.png', // Replace with your image path
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: professionController,
                  onChanged: (value) => filterProfessions(value),
                  decoration: InputDecoration(
                    labelText: 'Type or select your profession',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    suffixIcon: professionController.text.isNotEmpty
                        ? IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        professionController.clear();
                        setState(() {
                          filteredProfessions = professions;
                        });
                      },
                    )
                        : null,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(
                itemCount: filteredProfessions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredProfessions[index]),
                    onTap: () {
                      setState(() {
                        professionController.text = filteredProfessions[index];
                      });
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                if (professionController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Survey5Screen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Please select a profession from the list')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00C48C),
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Continue',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}