import 'package:examcellapp/views/Student/stdResult.dart';
import 'package:examcellapp/views/Student/stdprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:examcellapp/views/Examcell/NavBar.dart';

enum MenuAction { logout }

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
    StudentProfile(),
    StudentResult(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Row (
          children: [
            IconButton(
              icon: Icon(Icons.menu, size: 30,),
              onPressed: () => print("menu"),
            ),
            Text(
              "Result Processing System",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, size: 30,),
            onPressed: () => print("notification"),
          )
        ],
        backgroundColor: Color(primary),
      ),
      //Added Page view for tab slider
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(primary),
        selectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded, size: 30,),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye, size: 30,),
            label: 'Result',
          ),
        ],
        //added animation so it aligns with the page slider
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
      ),
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Sign Out"),
        content: const Text("Are You sure you want to sign out?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("Cancel")),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text("Log out")),
        ],
      );
    },
  ).then((value) => value ?? false);
}
