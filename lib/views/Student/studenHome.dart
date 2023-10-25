import 'package:examcellapp/views/Student/stdDashboard.dart';
import 'package:examcellapp/views/Student/stdResult.dart';
import 'package:examcellapp/views/Student/stdprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:examcellapp/views/NavBar/NavBar.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  final primary = 0xFF3385FF;
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    StudentDashboard(),
    StudentResult(),
  ];

  String getAppBarTitle() {
    return _currentIndex == 0 ? "Result Processing System" : "Result";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(
          getAppBarTitle(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: const Color.fromARGB(255, 238, 235, 235),
              size: 30,
            ),
            onPressed: () => print("notification"),
          )
        ],
        backgroundColor: Color(primary),
        iconTheme: const IconThemeData(
          color:
              Colors.white, // Set the icon color of the hamburger menu to white
        ),
      ),
      // Added Page view for tab slider
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),

      bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(23.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Color(primary),
            selectedItemColor: Colors.white,
            currentIndex: _currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_rounded,
                  size: 30,
                ),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.remove_red_eye,
                  size: 30,
                ),
                label: 'View Result',
              ),
            ],
            // Added animation so it aligns with the page slider
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              });
            },
          )),
    );
  }
}
