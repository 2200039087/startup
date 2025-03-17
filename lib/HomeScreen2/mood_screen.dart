import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart'; // For formatting dates

class MoodScreen extends StatefulWidget {
  @override
  _MoodScreenState createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  String _selectedItem = 'Item 1'; // Default selected item
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

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
          onPressed: () {
            Navigator.pop(context);
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _showMonthPicker(context),
                child: Text(
                  "${DateFormat('MMMM').format(_focusedDay)}",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF4E007B),
                  ),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () => _showYearPicker(context),
                child: Text(
                  "${DateFormat('yyyy').format(_focusedDay)}",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF4E007B),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // Update focused day
              });
            },
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Color(0xFF4E007B),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
              ),
              selectedDecoration: BoxDecoration(
                color: Color(0xFF4E007B),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
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

  void _showMonthPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                "Select Month",
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    final month = DateFormat('MMMM').format(DateTime(2023, index + 1));
                    return ListTile(
                      title: Text(month),
                      onTap: () => _selectMonth(index + 1),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showYearPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                "Select Year",
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 3, // Assuming 2023 to 2025
                  itemBuilder: (context, index) {
                    final year = 2023 + index;
                    return ListTile(
                      title: Text("$year"),
                      onTap: () => _selectYear(year),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _selectMonth(int month) {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, month, _focusedDay.day);
    });
    Navigator.pop(context);
  }

  void _selectYear(int year) {
    setState(() {
      _focusedDay = DateTime(year, _focusedDay.month, _focusedDay.day);
    });
    Navigator.pop(context);
  }
}