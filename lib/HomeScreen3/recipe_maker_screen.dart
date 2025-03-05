import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeMakerScreen extends StatefulWidget {
  @override
  _RecipeMakerScreenState createState() => _RecipeMakerScreenState();
}

class _RecipeMakerScreenState extends State<RecipeMakerScreen> {
  int _calories = 1224;
  List<String> _includedIngredients = [];
  List<String> _excludedIngredients = [];
  String _selectedMealType = "LUNCH"; // Default selected meal type

  void _increaseCalories() {
    setState(() {
      _calories += 10;
    });
  }

  void _decreaseCalories() {
    setState(() {
      if (_calories > 0) {
        _calories -= 10;
      }
    });
  }

  void _addIncludedIngredient(String ingredient) {
    setState(() {
      _includedIngredients.add(ingredient);
    });
  }

  void _addExcludedIngredient(String ingredient) {
    setState(() {
      _excludedIngredients.add(ingredient);
    });
  }

  void _selectMealType(String mealType) {
    setState(() {
      _selectedMealType = mealType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFDAC3),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Color(0xFFFF6000)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 46.0),
                    child: Text(
                      "Recipe Maker",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB04200),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Calories and Meal Type Section
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  // Amount of Calories Card
                  Expanded(
                    child: SizedBox(
                      height: 200, // Fixed height for uniformity
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Amount of calories",
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFB04200),
                                ),
                              ),
                              SizedBox(height: 50),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove_circle, color: Color(0xFFFF6000)),
                                      onPressed: _decreaseCalories,
                                    ),
                                    SizedBox(width: 0), // Space between elements
                                    Text(
                                      _calories.toString(),
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 26, // Adjusted font size
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 0), // Space between elements
                                    IconButton(
                                      icon: Icon(Icons.add_circle, color: Color(0xFFFF6000)),
                                      onPressed: _increaseCalories,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildToggleButton("Automatic"),
                                    SizedBox(width: 1), // Space between buttons
                                    _buildToggleButton("Custom"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 3), // Space between cards
                  // Meal Type Card
                  Expanded(
                    child: SizedBox(
                      height: 200, // Fixed height for uniformity
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Meal-type",
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFB04200),
                                ),
                              ),
                              SizedBox(height: 8),
                              _buildMealTypeButton("BREAKFAST", () => _selectMealType("BREAKFAST")),
                              _buildMealTypeButton("LUNCH", () => _selectMealType("LUNCH")),
                              _buildMealTypeButton("SNACKS", () => _selectMealType("SNACKS")),
                              _buildMealTypeButton("DINNER", () => _selectMealType("DINNER")),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Optional Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Optional",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFB04200),
                        ),
                      ),
                      SizedBox(height: 10),
                      _buildIngredientInput(
                          "Enter ingredients to include", _includedIngredients, _addIncludedIngredient),
                      _buildIngredientInput(
                          "Enter ingredients to exclude", _excludedIngredients, _addExcludedIngredient),
                      SizedBox(height: 10),
                      Text(
                        "Enter cuisine (Ex: Indian, Chinese)",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 37,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              offset: Offset(-2, 2),
                              blurRadius: 6.7,
                            ),
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.25),
                              offset: Offset(2, -2),
                              blurRadius: 5.9,
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Create Button
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Create"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFFFF6000),
                    padding: EdgeInsets.symmetric(horizontal: 44, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text) {
    return Row(
      children: [
        Container(
          width: 9,
          height: 9,
          decoration: BoxDecoration(
            color: text == "Automatic" ? Color(0xFFD9D9D9) : Color(0xFFFF6000),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Color(0xFFB04200),
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }

  Widget _buildMealTypeButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Container(
          width: 120,
          height: 30,
          decoration: BoxDecoration(
            color: _selectedMealType == text ? Color(0xFFFF6000) : Color(0xFFFFDAC3),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: _selectedMealType == text ? Colors.white : Color(0xFFB04200),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIngredientInput(String label, List<String> ingredients, Function(String) addIngredient) {
    TextEditingController _controller = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 34,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      offset: Offset(-2, 2),
                      blurRadius: 6.7,
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      offset: Offset(2, -2),
                      blurRadius: 5.9,
                    ),
                  ],
                ),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  addIngredient(_controller.text);
                  _controller.clear();
                }
              },
              child: Text("Add"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFFFF6000),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          children: ingredients.map((ingredient) {
            return Chip(
              label: Text(ingredient),
              onDeleted: () {
                setState(() {
                  ingredients.remove(ingredient);
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
