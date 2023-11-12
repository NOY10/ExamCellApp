import 'package:examcellapp/views/Examcell/Dashboard.dart';
import 'package:examcellapp/views/Examcell/Dashboard/Announcement.dart';
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
  final PageController _pageController = PageController();
  final List<Widget> _pages = [
    Dashboard(),
    Declaration(),
  ];
  final List<String> _pageTitles = [
    'Dashboard',
    'Declaration',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          _pageTitles[_currentIndex],
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: IconButton(
              icon: Icon(
                Icons.notifications, // Use the appropriate notification icon
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnnouncementMain()),
                );
              },
            ),
          ),
        ],
      ),
      
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ), // Display the selected page
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(26.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.blue,
          // unselectedItemColor: Color.fromARGB(255, 12, 241, 126),
          selectedItemColor: Color.fromARGB(255, 245, 247, 245),
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                size: 20,
              ),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.format_align_right_sharp,
                size: 20,
              ),
              label: 'Declaration',
            ),
          ],
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
      ),
    );
  }
}
