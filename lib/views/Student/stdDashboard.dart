// import 'package:examcellapp/views/Student/stdDetailManager.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:examcellapp/views/Student/stdLineChart.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class StudentDashboard extends StatefulWidget {
//   const StudentDashboard({super.key});

//   @override
//   State<StudentDashboard> createState() => _StudentDashboardState();
// }

// class _StudentDashboardState extends State<StudentDashboard> {
//   final double FONT_SIZE = 14;
//   final int TEXT_COLOR = 0xFF1A1717;
//   final RECt_COLOR = 0xFFE7E6E6;
//   final CARD_COLOR = 0xFF3385FF;

//   @override
//   void initState(){
//     super.initState();

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: fetchMarks(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.active) {

//             return Center(
//               child: SpinKitChasingDots(
//                 color: Colors.blue,
//                 size: 50.0,
//               ),
//             );
//           } else if (snapshot.connectionState == ConnectionState.done) {

//             List<dynamic> marks = snapshot.data as List<dynamic>;
//             return content(context, marks);
//           } else {

//             return Center(
//               child: Text('An error occurred.'), // Replace with your error handling widget.
//             );
//           }
//         },
//       ),
//     );
//   }

//   Widget content(BuildContext context, List<dynamic> marks) {
//     return Column(
//       children: [
//         assessment(),
//         banner(context),
//         moduleCard(context),
//         StudentLineChart(marks: marks),
//       ],
//     );
//   }

//   Future<List<dynamic>> fetchMarks() async {
//   var url = 'https://resultsystemdb.000webhostapp.com/getAnalysis.php?sid=02210233';

//   try {
//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       //print(data);

//       if (data is List && data.isNotEmpty) {
//         // Assuming that the marks data is under the key "marks"
//         List<dynamic> marks = data.map((item) => item['ratio']).toList();
//         //print(marks);

//         return marks;
//       }
//     }
//   } catch (e) {
//     throw Exception('Error while fetching data: $e');
//   }

//   return [];
// }

//   Container moduleCard(BuildContext context) {

//     return Container(
//       margin: EdgeInsets.all(18),
//       height: 140,
//       child: Row(
//         children: [
//           Card(
//             color: Color(CARD_COLOR),
//             child: Container(
//               width: MediaQuery.of(context).size.width / 3 - 20,
//               padding: EdgeInsets.all(14),
//               child: const Column(
//                 children: [
//                   Text(
//                     'Completed Modules',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 14),
//                     child: Text(
//                       '5',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Card(
//             color: Color(CARD_COLOR),
//             child: Container(
//               width: MediaQuery.of(context).size.width / 3 - 20,
//               padding: EdgeInsets.all(14),
//               child: const Column(
//                 children: [
//                   Text(
//                     'Repeat Modules',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 14),
//                     child: Text(
//                       '5',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Card(
//             color: Color(CARD_COLOR),
//             child: Container(
//               width: MediaQuery.of(context).size.width / 3 - 20,
//               padding: EdgeInsets.all(14),
//               child: const Column(
//                 children: [
//                   Text(
//                     'Current Modules',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 14),
//                     child: Text(
//                       '5',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Center assessment() {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(25),
//         child: RichText(
//           textAlign: TextAlign.justify,
//           text: TextSpan(
//             children: <TextSpan>[
//               TextSpan(
//                 text: 'To pass a module, a student must obtain a maximum of ',
//                 style: TextStyle(
//                   fontSize: FONT_SIZE,
//                   color: Color(TEXT_COLOR).withOpacity(0.8),
//                 ),
//               ),
//               TextSpan(
//                 text: '50%',
//                 style: TextStyle(
//                   fontSize: FONT_SIZE,
//                   color: Color(TEXT_COLOR).withOpacity(0.8),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               TextSpan(
//                 text:
//                     ' overall, including both the continuous assessment and semester-end examination. However, students must obtain a minimum of',
//                 style: TextStyle(
//                   fontSize: FONT_SIZE,
//                   color: Color(TEXT_COLOR).withOpacity(0.8),
//                 ),
//               ),
//               TextSpan(
//                 text: ' 40%',
//                 style: TextStyle(
//                   fontSize: FONT_SIZE,
//                   color: Color(TEXT_COLOR).withOpacity(0.8),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               TextSpan(
//                 text:
//                     ' in each of the continuous assessment and semester examination.',
//                 style: TextStyle(
//                   fontSize: FONT_SIZE,
//                   color: Color(TEXT_COLOR).withOpacity(0.8),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Padding banner(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 4),
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         height: 50,
//         color: Color.fromARGB(255, 223, 229, 252),
//         child: Center(
//           child: Text(
//             'Second Semester of Academic year 2023',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//               color: Color(TEXT_COLOR),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:examcellapp/views/Examcell/utility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:examcellapp/views/Student/stdLineChart.dart';
import 'package:flutter/material.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({Key? key}) : super(key: key);

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  final double FONT_SIZE = 14;
  final int TEXT_COLOR = 0xFF1A1717;
  final RECT_COLOR = 0xFFE7E6E6;
  final CARD_COLOR = 0xFF3385FF;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchMarks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.active) {
            return Center(
              child: SpinKitChasingDots(
                color: Colors.blue,
                size: 50.0,
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<dynamic> marks = snapshot.data as List<dynamic>;
            return content(context, marks);
          } else {
            return Center(
              child: Text(
                  'An error occurred.'), // Replace with your error handling widget.
            );
          }
        },
      ),
    );
  }

  Widget content(BuildContext context, List<dynamic> marks) {
    return SingleChildScrollView(
      child: Column(
        children: [
          assessment(),
          banner(context),
          moduleCard(context),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Aggregate Vs. Semester",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87, // Add your desired text color
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),

          StudentLineChart(marks: marks),
        ],
      ),
    );
  }

  Future<List<dynamic>> fetchMarks() async {
    var url =
        'https://resultsystemdb.000webhostapp.com/getAnalysis.php?sid=02210233';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);

        if (data is List && data.isNotEmpty) {
          List<dynamic> marks = data.map((item) => item['ratio']).toList();
          return marks;
        }
      }
    } catch (e) {
      throw Exception('Error while fetching data: $e');
    }

    return [];
  }

  FutureBuilder moduleCard(BuildContext context) {
  return FutureBuilder(
    future: isDeclared(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return SpinKitChasingDots(color: Colors.blue);
      } else if (snapshot.hasData) {
        print(snapshot.data);

        // Initialize module values
        int completedModules = 26;
        int repeatModules = 0;
        int currentModules = 5;

        // Check if the data is 'declared' and adjust values accordingly
        if (snapshot.data == 'declared') {
          completedModules += 5;  // Add 5 to completed modules
          currentModules -= 5;    // Subtract 5 from current modules
        }

        // Return the container with updated values
        return Container(
          margin: EdgeInsets.all(18),
          height: 140,
          child: Row(
            children: [
              Card(
                color: Color(CARD_COLOR),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3 - 20,
                  padding: EdgeInsets.all(14),
                  child: Column(
                    children: [
                      Text(
                        'Completed Modules',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: Text(
                          '$completedModules',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color(CARD_COLOR),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3 - 20,
                  padding: EdgeInsets.all(14),
                  child: Column(
                    children: [
                      Text(
                        'Repeat Modules',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: Text(
                          '$repeatModules',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color(CARD_COLOR),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3 - 20,
                  padding: EdgeInsets.all(14),
                  child: Column(
                    children: [
                      Text(
                        'Current Modules',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: Text(
                          '$currentModules',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      } else {
        return Text('No Data');
      }
    },
  );
}


  Center assessment() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'To pass a module, a student must obtain a maximum of ',
                style: TextStyle(
                  fontSize: FONT_SIZE,
                  color: Color(TEXT_COLOR).withOpacity(0.8),
                ),
              ),
              TextSpan(
                text: '50%',
                style: TextStyle(
                  fontSize: FONT_SIZE,
                  color: Color(TEXT_COLOR).withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    ' overall, including both the continuous assessment and semester-end examination. However, students must obtain a minimum of',
                style: TextStyle(
                  fontSize: FONT_SIZE,
                  color: Color(TEXT_COLOR).withOpacity(0.8),
                ),
              ),
              TextSpan(
                text: ' 40%',
                style: TextStyle(
                  fontSize: FONT_SIZE,
                  color: Color(TEXT_COLOR).withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    ' in each of the continuous assessment and semester examination.',
                style: TextStyle(
                  fontSize: FONT_SIZE,
                  color: Color(TEXT_COLOR).withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding banner(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        color: Color.fromARGB(255, 223, 229, 252),
        child: Center(
          child: Text(
            'Second Semester of Academic year 2023',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(TEXT_COLOR),
            ),
          ),
        ),
      ),
    );
  }
}
