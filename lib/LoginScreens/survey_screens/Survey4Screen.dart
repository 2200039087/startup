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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
              style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04), // Responsive font size
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Responsive padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.01, // Responsive height
                  child: LinearProgressIndicator(
                    value: 0.5,
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue, // Change to blue
                  ),
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive space
                Text(
                  'What is your current profession?',
                  style: TextStyle(
                    fontSize: screenWidth * 0.07, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive space
                Image.asset(
                  'assets/profession_image.png', // Replace with your image path
                  width: double.infinity,
                  height: screenHeight * 0.2, // Responsive height
                  fit: BoxFit.contain,
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive space
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
          SizedBox(height: screenHeight * 0.02), // Responsive space
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Responsive padding
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
            padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
            child: ElevatedButton.icon(
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
              icon: Icon(Icons.arrow_forward, color: Colors.white), // Add icon
              label: Text(
                'Continue',
                style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.white), // Responsive font size
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Change to blue
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02), // Responsive padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
