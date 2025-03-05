import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DietScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // Header Section
          SliverAppBar(
            backgroundColor: Color(0xFFFFDAC3),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0xFFFF6000)),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              "DietLog",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB04200),
              ),
            ),
            floating: true,
            pinned: true,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFDAC3), Color(0xFFFFEBDF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(60),
                  ),
                ),
              ),
            ),
          ),
          // Main Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Calendar Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "20-Jan-2005",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF6000),
                        ),
                      ),
                      Icon(Icons.calendar_today, color: Color(0xFFFF6000)),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Week Days Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDay("Mon", "17", false),
                      _buildDay("Tue", "18", false),
                      _buildDay("Wed", "19", false),
                      _buildDay("Thu", "20", true),
                      _buildDay("Fri", "21", false),
                      _buildDay("Sat", "22", false),
                      _buildDay("Sun", "23", false),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Food Entry Cards
                  _buildFoodEntry(
                    "Food Name",
                    "Quantity: 260 gms",
                    "Meal-type: Breakfast",
                    "Cuisine: Indian",
                  ),
                  SizedBox(height: 16),
                  _buildFoodEntry(
                    "Food Name",
                    "Quantity: 260 gms",
                    "",
                    "",
                  ),
                  SizedBox(height: 16),
                  // Macro-Nutrients Card
                  _buildMacroNutrientsCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDay(String day, String date, bool isSelected) {
    return Column(
      children: [
        Text(
          day,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: isSelected ? Colors.white : Colors.black,
            backgroundColor: isSelected ? Color(0xFFFF6000) : Colors.transparent,
          ),
        ),
        Text(
          date,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : Colors.black,
            backgroundColor: isSelected ? Color(0xFFFF6000) : Colors.transparent,
          ),
        ),
      ],
    );
  }

  Widget _buildFoodEntry(String foodName, String quantity, String mealType, String cuisine) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFFDAC3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            foodName,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFB04200),
            ),
          ),
          SizedBox(height: 8),
          Text(
            quantity,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFFB04200),
            ),
          ),
          if (mealType.isNotEmpty)
            SizedBox(height: 4),
          if (mealType.isNotEmpty)
            Text(
              mealType,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFFB04200),
              ),
            ),
          if (cuisine.isNotEmpty)
            SizedBox(height: 4),
          if (cuisine.isNotEmpty)
            Text(
              cuisine,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFFB04200),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMacroNutrientsCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFFEBDF),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Macro-Nutrients",
            style: GoogleFonts.plusJakartaSans(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFFB04200),
            ),
          ),
          SizedBox(height: 8),
          _buildNutrientRow("Proteins", "62g"),
          _buildNutrientRow("Fats", "28g"),
          _buildNutrientRow("Carbs", "42g"),
          _buildNutrientRow("Calories", "132g"),
        ],
      ),
    );
  }

  Widget _buildNutrientRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$label:",
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: label == "Calories"
                  ? Color(0xFFB04200)
                  : (label == "Fats"
                  ? Color(0xFFF95D00)
                  : Color(0xFFFF8F4B)),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFFB04200),
            ),
          ),
        ],
      ),
    );
  }
}
