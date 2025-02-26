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
                SizedBox(
                  height: 7, // Adjust height to decrease size
                  child: LinearProgressIndicator(
                    value: 0.8,
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue, // Change to blue
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Do you have any chronic diseases?",
                  style: TextStyle(
                    fontSize: 30, // Increase font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: Image.asset(
                    'assets/chronic_disease.png', // Ensure this path matches your asset
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: chronicDiseaseController,
                  onChanged: (value) => filterChronicDiseases(value),
                  decoration: InputDecoration(
                    hintText: "Ex: Asthma, Obesity or 'None'",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
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
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
            padding: const EdgeInsets.all(20.0),
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
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Change to blue
                padding: EdgeInsets.symmetric(vertical: 16),
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
