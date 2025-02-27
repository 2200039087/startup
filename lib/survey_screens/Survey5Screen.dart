import 'package:flutter/material.dart';
import 'Survey6Screen.dart'; // Import the next survey screen

class Survey5Screen extends StatefulWidget {
  @override
  _Survey5ScreenState createState() => _Survey5ScreenState();
}

class _Survey5ScreenState extends State<Survey5Screen> {
  final TextEditingController chronicDiseaseController = TextEditingController();
  final List<String> chronicDiseases = [
    'Asthma',
    'Diabetes',
    'Hypertension',
    'Obesity',
    'Arthritis',
    'Heart Disease',
    'Cancer',
    'Migraine',
    'Kidney Disease',
    'None',
  ];
  List<String> filteredChronicDiseases = [];

  @override
  void initState() {
    super.initState();
    filteredChronicDiseases = chronicDiseases; // Show full list by default
  }

  void filterChronicDiseases(String query) {
    setState(() {
      filteredChronicDiseases = chronicDiseases
          .where((disease) =>
          disease.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    chronicDiseaseController.dispose();
    super.dispose();
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
                MaterialPageRoute(builder: (context) => Survey6Screen()),
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
                    value: 0.8,
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue, // Change to blue
                  ),
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive space
                Text(
                  "Do you have any chronic diseases?",
                  style: TextStyle(
                    fontSize: screenWidth * 0.07, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive space
                Center(
                  child: Image.asset(
                    'assets/chronic_disease.png', // Ensure this path matches your asset
                    height: screenHeight * 0.2, // Responsive height
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive space
                TextField(
                  controller: chronicDiseaseController,
                  onChanged: (value) => filterChronicDiseases(value),
                  decoration: InputDecoration(
                    hintText: "Ex: Asthma, Obesity or 'None'",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04), // Responsive font size
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
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
                itemCount: filteredChronicDiseases.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredChronicDiseases[index]),
                    onTap: () {
                      setState(() {
                        chronicDiseaseController.text =
                        filteredChronicDiseases[index];
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
                if (chronicDiseaseController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Survey6Screen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Please select or type your response')),
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
