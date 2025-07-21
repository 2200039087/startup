import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoodScreen extends StatefulWidget {
  @override
  _MoodScreenState createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  String _selectedItem = 'Item 1'; // Default selected item

  // List of items for the dropdown
  final List<String> _items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Moodlender",
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Color(0xFF4E007B),
            shadows: [
              Shadow(
                blurRadius: 6.3,
                color: Color.fromARGB(195, 198, 225, 255),
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {Navigator.pop(context);
            },
          color: Color(0xFFA100FF),
        ),
        backgroundColor: Color(0xFFE4B6FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          Text(
            "January, 2025",
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Color(0xFF4E007B),
              shadows: [
                Shadow(
                  blurRadius: 6.3,
                  color: Color.fromARGB(195, 198, 225, 255),
                  offset: Offset(0, 0),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("S", style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold)),
              Text("M", style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold)),
              Text("T", style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold)),
              Text("W", style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold)),
              Text("Th", style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold)),
              Text("F", style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold)),
              Text("Sa", style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("1", style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold)),
              Text("2", style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold)),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Color(0xFF4E007B),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "3",
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Text("4", style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold)),
              Text("5", style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold)),
              Text("6", style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold)),
              Text("7", style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold)),
            ],
          ),
          Spacer(),
          Container(
            width: 342,
            height: 245,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rating",
                    style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3),
                  DropdownButton<String>(
                    value: _selectedItem,
                    items: _items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue!;
                      });
                    },
                  ),
                  SizedBox(height: 3),
                  Text(
                    "Note",
                    style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFF2DCFF),
    );
  }
}
