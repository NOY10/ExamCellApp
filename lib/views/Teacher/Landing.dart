import 'package:examcellapp/views/Teacher/MarkTable.dart';
import 'package:examcellapp/views/Teacher/TutorMananger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileScreen extends StatelessWidget {
  String? storedUserID;

  Future<List<Map<String, dynamic>>> fetchData(String semester) async {
    SharedPreferencesManager manager = SharedPreferencesManager();
    storedUserID = await manager.getUserID();
    print(storedUserID);
    var url = Uri.parse(
        "https://resultsystemdb.000webhostapp.com/getModuleList.php?tid=$storedUserID&semester=$semester");
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
          //   'List of Modules you are currently teaching',
          //   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          // ),
          Expanded(
            child: FutureBuilder(
              future: fetchData("AS2023"),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: SpinKitChasingDots(color: Colors.blue,));
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
                                  //leading: Icon(Icons.),
                                  title: Text(moduleData['mCode'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500
                                  ),),
                                  subtitle: Text(moduleData['mName']),
                                  trailing: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => markTable(
                                            tid: storedUserID!,
                                            semester: moduleData['semester'],
                                            mCode: moduleData['mCode'],
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

class Module {
  final String name;
  final String description;

  Module(this.name, this.description);
}




// child: ListView(
//                 children: modules.map((module) {
//                   return Padding(
//                     padding: const EdgeInsets.fromLTRB(
//                         1, 0, 8, 0), // Add right-side padding
//                     child: Card(
//                       color: Colors.white,
//                       child: Container(
//                         margin: const EdgeInsets.only(left: 1),
//                         decoration: const BoxDecoration(
//                           border: Border(
//                             left: BorderSide(
//                               color: Colors.blue,
//                               width: 40,
//                             ),
//                           ),
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: <Widget>[
//                             ListTile(
//                               leading: Icon(Icons.message),
//                               title: Text(module.name),
//                               subtitle: Text(module.description),
//                               trailing: InkWell(
//                                 onTap: () {
//                                   Navigator.of(context).push(
//                                     MaterialPageRoute(
//                                       builder: (context) => ModuleResult(),
//                                     ),
//                                   );
//                                 },
//                                 child: Icon(Icons.arrow_forward_ios_outlined),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),