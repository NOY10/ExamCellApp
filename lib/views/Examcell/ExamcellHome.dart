import 'package:examcellapp/views/Examcell/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:examcellapp/views/NavBar/NavBar.dart';
import 'package:examcellapp/views/Examcell/Declaration.dart';

class ExamcellHome extends StatefulWidget {
  const ExamcellHome({super.key});

  @override
  State<ExamcellHome> createState() => _ExamcellHomeState();
}

class _ExamcellHomeState extends State<ExamcellHome> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    Dashboard(),
    Declaration(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Dashboard"),
      ),
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        unselectedItemColor: Color.fromARGB(255, 12, 241, 126),
        selectedItemColor: Color.fromARGB(255, 245, 247, 245),
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_align_right_sharp),
            label: 'Declaration',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index; // it can change the selected page index
          });
        },
      ),
    );
  }
}
