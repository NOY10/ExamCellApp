import 'package:examcellapp/views/Teacher/MarkTable.dart';
import 'package:examcellapp/views/Teacher/Module.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileScreen extends StatelessWidget {
  // Create a list of module data


  Future<List<Map<String, dynamic>>> fetchData() async {
    var url = Uri.parse("https://resultsystemdb.000webhostapp.com/getModuleList.php");
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
          const Divider(
            color: Colors.blue,
            thickness: 2,
            indent: 1,
          ),
          const Text(
            'List of Modules you are currently teaching',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: FutureBuilder(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('${snapshot.error}'));
                } else {
                  if (snapshot.hasData) {
                    List<Map<String, dynamic>> data = snapshot.data as List<Map<String, dynamic>>;
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
                                  title: Text(moduleData['mCode']),
                                  subtitle: Text(moduleData['mName']),
                                  trailing: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => markTable(
                                            semester: moduleData['semester'],
                                            mCode: moduleData['mCode'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Icon(Icons.arrow_forward_ios_outlined),
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