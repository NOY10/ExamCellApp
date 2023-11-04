import 'package:examcellapp/views/Teacher/MarkTable.dart';
import 'package:examcellapp/views/Teacher/TutorMananger.dart';
import 'package:examcellapp/views/Teacher/analysis/undeclaredAnalysis.dart';
import 'package:flutter/material.dart';
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
          const Text(
            'Graded Modules',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: FutureBuilder(
              future: fetchData("AS2023"),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('${snapshot.error}'));
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
                                  leading: Icon(Icons.message),
                                  title: Text(moduleData['code']),
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
                                    child:
                                        Icon(Icons.arrow_forward_ios_outlined),
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