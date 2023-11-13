// import 'package:examcellapp/views/Student/stdDashboard.dart';
// import 'package:examcellapp/views/Student/stdDetailManager.dart';
// import 'package:examcellapp/views/Student/stdResultView/stdResult.dart';
// import 'package:flutter/material.dart';
// import 'package:examcellapp/views/NavBar/NavBar.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class StudentHome extends StatefulWidget {
//   const StudentHome({super.key});

//   @override
//   State<StudentHome> createState() => _StudentHomeState();
// }

// class _StudentHomeState extends State<StudentHome> {
//   final primary = 0xFF3385FF;
//   int _currentIndex = 0;
//   final PageController _pageController = PageController();
//   void initState(){
//     super.initState();
//     setData();
//   }

//   final List<Widget> _pages = [
//     StudentDashboard(),
//     StudentResult(),
//   ];

//   String getAppBarTitle() {
//     return _currentIndex == 0 ? "Result Processing System" : "Result";
//   }

//   Future<void> setData() async {
//   SharedPreferencesManager manager = SharedPreferencesManager();
//   String? storedUserID = await manager.getUserID();
//   final Uri url = Uri.parse("https://resultsystemdb.000webhostapp.com/getStdData.php?sid=$storedUserID");
//   var response = await http.get(url);
//   List stdData = json.decode(response.body);
//   if (response.statusCode == 200) {
//     if (stdData.isNotEmpty) {
//       // Assuming the API response returns a single data object
//       Map<String, dynamic> std = stdData[0];

//       final prefs = await SharedPreferences.getInstance();
//       // await prefs.setString('UserID', std['id']);
//       await prefs.setString('UserName', std['name']);
//       await prefs.setString('Program', std['program']);
//       await prefs.setString('Semester', std['semester']);
//       await prefs.setString('SemNo', std['SemNo']);
//       print("success");
//     }

//   } else {
//     throw Exception('Failed to load data');
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: NavBar(),
//       appBar: AppBar(
//         title: Text(
//           getAppBarTitle(),
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(
//               Icons.notifications,
//               color: const Color.fromARGB(255, 238, 235, 235),
//               size: 30,
//             ),
//             onPressed: () => print("notification"),
//           )
//         ],
//         backgroundColor: Color(primary),
//         iconTheme: const IconThemeData(
//           color:
//               Colors.white, // Set the icon color of the hamburger menu to white
//         ),
//       ),
//       // Added Page view for tab slider
//       body: PageView(
//         controller: _pageController,
//         children: _pages,
//         onPageChanged: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//       ),

//       bottomNavigationBar: ClipRRect(
//           borderRadius: const BorderRadius.vertical(
//             top: Radius.circular(23.0),
//           ),
//           child: BottomNavigationBar(
//             backgroundColor: Color(primary),
//             selectedItemColor: Colors.white,
//             currentIndex: _currentIndex,
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.account_circle_rounded,
//                   size: 30,
//                 ),
//                 label: 'Profile',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.remove_red_eye,
//                   size: 30,
//                 ),
//                 label: 'View Result',
//               ),
//             ],
//             // Added animation so it aligns with the page slider
//             onTap: (index) {
//               setState(() {
//                 _currentIndex = index;
//                 _pageController.animateToPage(
//                   index,
//                   duration: const Duration(milliseconds: 400),
//                   curve: Curves.easeInOut,
//                 );
//               });
//             },
//           )),
//     );
//   }
// }

import 'package:examcellapp/views/Student/stdDashboard.dart';
import 'package:examcellapp/views/Student/stdDetailManager.dart';
import 'package:examcellapp/views/Student/stdResultView/stdResult.dart';
import 'package:examcellapp/views/Student/studentNotification.dart';
import 'package:flutter/material.dart';
import 'package:examcellapp/views/NavBar/NavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  final primary = 0xFF3385FF;
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  bool isPortrait = true;

  @override
  void initState() {
    super.initState();
    setData();
  }

  final List<Widget> _pages = [
    StudentDashboard(),
    StudentResult(),
  ];

  String getAppBarTitle() {
    return _currentIndex == 0 ? "Dashboard" : "Result";
  }

  Future<void> setData() async {
    SharedPreferencesManager manager = SharedPreferencesManager();
    String? storedUserID = await manager.getUserID();
    final Uri url = Uri.parse(
        "https://resultsystemdb.000webhostapp.com/getStdData.php?sid=$storedUserID");
    var response = await http.get(url);
    List stdData = json.decode(response.body);
    if (response.statusCode == 200) {
      if (stdData.isNotEmpty) {
        // Assuming the API response returns a single data object
        Map<String, dynamic> std = stdData[0];

        final prefs = await SharedPreferences.getInstance();
        // await prefs.setString('UserID', std['id']);
        await prefs.setString('UserName', std['name']);
        await prefs.setString('Program', std['program']);
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
        title: Text(
          getAppBarTitle(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: const Color.fromARGB(255, 238, 235, 235),
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) =>  notiStudent()));
            },
          )
        ],
        backgroundColor: Color(primary),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: isPortrait
          ? PageView(
              controller: _pageController,
              children: _pages,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            )
          : ListView(
              children: [
                _pages[_currentIndex],
              ],
            ),
      // bottomNavigationBar: ClipRRect(
      //   borderRadius: const BorderRadius.vertical(
      //     top: Radius.circular(23.0),
      //   ),
      //   child: BottomNavigationBar(
      //     backgroundColor: Color(primary),
      //     selectedItemColor: Colors.white,
      //     currentIndex: _currentIndex,
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.account_circle_rounded,
      //           size: 30,
      //         ),
      //         label: 'Profile',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.remove_red_eye,
      //           size: 30,
      //         ),
      //         label: 'View Result',
      //       ),
      //     ],
      //     onTap: (index) {
      //       setState(() {
      //         _currentIndex = index;
      //         _pageController.animateToPage(
      //           index,
      //           duration: const Duration(milliseconds: 400),
      //           curve: Curves.easeInOut,
      //         );
      //       });
      //     },
      //   ),
      // ),
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

  // final List<Widget> _pages = [
  //   StudentDashboard(),
  //   StudentResult(),
  // ];

  // String getAppBarTitle() {
  //   return _currentIndex == 0 ? "Result Processing System" : "Result";
  // }

  // Future<void> setData() async {
  //   SharedPreferencesManager manager = SharedPreferencesManager();
  //   String? storedUserID = await manager.getUserID();
  //   final Uri url = Uri.parse(
  //       "https://resultsystemdb.000webhostapp.com/getStdData.php?sid=$storedUserID");
  //   var response = await http.get(url);
  //   List stdData = json.decode(response.body);
  //   if (response.statusCode == 200) {
  //     if (stdData.isNotEmpty) {
  //       Map<String, dynamic> std = stdData[0];

  //       final prefs = await SharedPreferences.getInstance();
  //       await prefs.setString('UserName', std['name']);
  //       await prefs.setString('Program', std['program']);
  //       await prefs.setString('Semester', std['semester']);
  //       await prefs.setString('SemNo', std['SemNo']);
  //       print("success");
  //     }
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }
}
