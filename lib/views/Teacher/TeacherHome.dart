import 'package:examcellapp/views/Student/stdDetailManager.dart';
import 'package:examcellapp/views/Teacher/Landing.dart';
import 'package:examcellapp/views/Teacher/tutorResult.dart';
import 'package:flutter/material.dart';
import 'package:examcellapp/views/NavBar/NavBar.dart';
import 'package:examcellapp/views/Teacher/filePicker/filePicker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   //setData();
  // }

  @override
  final List<Widget> _pages = [
    ProfileScreen(),
    ViewResultScreen(),
  ];

  final List<String> _pageTitles = [
    'Dashboard',
    'View Result',
  ];

  Future<void> setData() async {
    SharedPreferencesManager manager = SharedPreferencesManager();
    String? storedUserID = await manager.getUserID();
    final Uri url = Uri.parse(
        "https://resultsystemdb.000webhostapp.com/getTutor.php?tid=$storedUserID");
    var response = await http.get(url);
    List stdData = json.decode(response.body);
    if (response.statusCode == 200) {
      if (stdData.isNotEmpty) {
        // Assuming the API response returns a single data object
        Map<String, dynamic> std = stdData[0];

        final prefs = await SharedPreferences.getInstance();
        // await prefs.setString('UserID', std['id']);
        await prefs.setString('mCode', std['mCode']);
        await prefs.setString('Semester', std['semester']);
        await prefs.setString('SemNo', std['SemNo']);
        print("success");
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

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
      ),
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: ClipRRect(
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
                  Icons.remove_red_eye,
                  size: 20,
                ),
                label: 'View Result',
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
      ),
    );
  }
}

//************************************  Profile Screen starts  ************************************/

//************************************  Profile Screen  ends ************************************/

//************************************  Upload Screen  starts ************************************/

class UploadScreen extends StatelessWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: SizedBox(
        width: 300,
        height: 100,
        child: FilePickerE(),
      ),
    );
  }
}

//************************************  Profile Screen ends  **************************************/

//************************************  ViewResult Screen starts  ************************************/


//************************************  ViewResult Screen  ends ************************************/

