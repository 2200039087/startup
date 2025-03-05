import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitalstats/HomeScreen3/recipe_view_screen.dart';
import 'recipe_maker_screen.dart'; // Ensure you import the RecipeMakerScreen

class RecipeFinderScreen extends StatelessWidget {
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
                  height: 140, // Reduced height
                  decoration: BoxDecoration(
                    color: Color(0xFFFFDAC3),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
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
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Text(
                      "Recipe Finder",
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
            // Recipe Maker Section
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Generate your own recipe",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFB04200),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecipeMakerScreen()),
                            );
                          },
                          child: Text("Recipe Maker"),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xFFFF6000),
                            padding: EdgeInsets.symmetric(
                                horizontal: 44, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Diet Preferences
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDietPreference("KETO"),
                  _buildDietPreference("Custom"),
                  _buildDietPreference("Custom"),
                  _buildDietPreference("Custom"),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Breakfast Card
            _buildMealCard(context, "Breakfast"),
            SizedBox(height: 20),
            // Lunch Card
            _buildMealCard(context, "Lunch"),
          ],
        ),
      ),
    );
  }

  Widget _buildDietPreference(String text) {
    return Row(
      children: [
        Container(
          width: 13,
          height: 13,
          decoration: BoxDecoration(
            color: text == "Custom" ? Color(0xFFFF6000) : Color(0xFFD9D9D9),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFFB04200),
          ),
        ),
      ],
    );
  }

  Widget _buildMealCard(BuildContext context, String mealType) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                mealType,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB04200),
                ),
              ),
              SizedBox(height: 5),
              SizedBox(
                height: 150, // Fixed height for the carousel
                child: PageView.builder(
                  itemCount: 5, // Number of recipes
                  itemBuilder: (context, index) {
                    return _buildMealItem(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMealItem(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              RecipeViewScreen(recipeName: "Chicken Biryani")),
        );
      },
      child: Column(
        children: [
          Container(
            width: 105,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xFFFFFEFE),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Name",
            style: GoogleFonts.plusJakartaSans(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF6000),
            ),
          ),
          Text(
            "123 cal",
            style: GoogleFonts.plusJakartaSans(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF6000),
            ),
          ),
        ],
      ),
    );
  }
}
