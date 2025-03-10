import 'package:flutter/material.dart';
import 'Nav_Bar.dart';
import 'add_screen.dart';
import 'Agreement_Screen.dart';
import 'Profile.dart';
class Home_Screen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home_Screen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePageContent(),
    Agreement_Screen(),
    Placeholder(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Nav_Bar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF2252A1),
        child: Icon(Icons.add, size: 30, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class HomePageContent extends StatelessWidget {

  final List<Map<String, String>> jobData = [
    {
      "title": "Java Developer (Full Time)",
      "location": "Cairo, Egypt",
      "time": "1 month ago",
      "applicants": "Over 100 people clicked apply",
      "type1": "On-site",
      "type2": "Internship"
    },
    {
      "title": "Flutter Developer (Part Time)",
      "location": "Alexandria, Egypt",
      "time": "2 weeks ago",
      "applicants": "50 people clicked apply",
      "type1": "Remote",
      "type2": "Internship"
    },
    {
      "title": "UI/UX Designer (Internship)",
      "location": "Giza, Egypt",
      "time": "3 days ago",
      "applicants": "30 people clicked apply",
      "type1": "On-site",
      "type2": "Internship"
    },
    {
      "title": "UI/UX Designer (Internship)",
      "location": "Giza, Egypt",
      "time": "3 days ago",
      "applicants": "30 people clicked apply",
      "type1": "On-site",
      "type2": "Internship"
    },
    {
      "title": "UI/UX Designer (Internship)",
      "location": "Giza, Egypt",
      "time": "3 days ago",
      "applicants": "30 people clicked apply",
      "type1": "On-site",
      "type2": "Internship"
    },
    {
      "title": "UI/UX Designer (Internship)",
      "location": "Giza, Egypt",
      "time": "3 days ago",
      "applicants": "30 people clicked apply",
      "type1": "On-site",
      "type2": "Internship"
    },
    {
      "title": "UI/UX Designer (Internship)",
      "location": "Giza, Egypt",
      "time": "3 days ago",
      "applicants": "30 people clicked apply",
      "type1": "On-site",
      "type2": "Internship"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Text(
            "Welcome Back!",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2252A1),
            ),
          ),
          Text(
            "Jumia Company Interface",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Recent Jobs",
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: jobData.length,
              itemBuilder: (context, index) {
                return JobCard(
                  title: jobData[index]["title"]!,
                  location: jobData[index]["location"]!,
                  time: jobData[index]["time"]!,
                  applicants: jobData[index]["applicants"]!,
                  type1: jobData[index]["type1"]!,
                  type2: jobData[index]["type2"]!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final String title;
  final String location;
  final String time;
  final String applicants;
  final String type1;
  final String type2;

  const JobCard({
    required this.title,
    required this.location,
    required this.time,
    required this.applicants,
    required this.type1,
    required this.type2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.blue, width: 1),
      ),
      margin: EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "$location · $time · $applicants",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.edit_note_sharp, color: Colors.blue),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                TagButton(text: type1),
                SizedBox(width: 8),
                TagButton(text: type2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TagButton extends StatelessWidget {
  final String text;

  const TagButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check, color: Colors.blue, size: 16),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
