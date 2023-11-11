import 'package:examcellapp/views/Teacher/MarkTable.dart';
import 'package:examcellapp/views/Teacher/TutorMananger.dart';
import 'package:examcellapp/views/Teacher/analysis/undeclaredAnalysis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ViewResultScreen extends StatefulWidget {
  const ViewResultScreen({super.key});

  @override
  State<ViewResultScreen> createState() => _ViewResultScreenState();
}

class _ViewResultScreenState extends State<ViewResultScreen> {
  String? storedUserID;

  Future<List<Map<String, dynamic>>> fetchData(String semester) async {
    SharedPreferencesManager manager = SharedPreferencesManager();
    storedUserID = await manager.getUserID();
    var url = Uri.parse(
        "https://resultsystemdb.000webhostapp.com/getGradedModules.php?tid=$storedUserID");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // const Divider(
          //   color: Colors.blue,
          //   thickness: 2,
          //   indent: 1,
          // ),
          // const Text(
          //   'Graded Modules',
          //   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          // ),
          Expanded(
            child: FutureBuilder(
              future: fetchData("AS2023"),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: SpinKitChasingDots(color: Colors.blue,));
                } else if (snapshot.hasError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Add an Image widget here
                          Opacity(
                            opacity: 0.5,
                            child: Image.asset(
                              'assets/images/noData.png', // Replace with the path to your error image
                              width: 140, // Adjust the width as needed
                              height: 140, // Adjust the height as needed
                            ),
                          ),
                          SizedBox(height: 10), // Add some space between the image and text
                          Opacity(
                            opacity: 0.5,
                            child: Text(
                              'No Marks Entered!',
                              style: TextStyle(
                                // Customize the style of the error text here
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                } else {
                  if (snapshot.hasData) {
                    List<Map<String, dynamic>> data =
                        snapshot.data as List<Map<String, dynamic>>;
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> moduleData = data[index];
                        return Card(
                          color: Colors.white,
                          child: Container(
                            margin: const EdgeInsets.only(left: 1),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: Colors.blue,
                                  width: 40,
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  //leading: Icon(Icons.message),
                                  title: Text(moduleData['code'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),),
                                  subtitle: Text(moduleData['name']),
                                  trailing: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => undeclaredAnalysis(
                                            tid: storedUserID!,
                                            mCode: moduleData['code'],
                                          ),
                                        ),
                                      );
                                    },
                                    child:Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue, // Set the background color of the circle
                                      ),
                                      padding: EdgeInsets.all(8), // Adjust the padding as needed
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Colors.white, // Set the color of the arrow icon
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Text('No data available.');
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}