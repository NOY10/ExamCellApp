import 'package:flutter/material.dart';
import 'package:examcellapp/views/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ModuleResultPage extends StatefulWidget {
  @override
  State<ModuleResultPage> createState() => _ModuleResultPageState();
}

class _ModuleResultPageState extends State<ModuleResultPage> {
  Future<void> loadSharedPreferences() async {
    late SharedPreferences prefs;
    String name = '';
    String email = '';

    Future<void> initSharedPreferences() async {
      prefs = await SharedPreferences.getInstance();
      loadSharedPreferences();
    }

    final String? userID = prefs.getString('userID');
    final Uri url =
        Uri.parse("https://examcellflutter.000webhostapp.com/NavInfo.php");

    // final response = await http.post(url, body: {
    //   "moduleCode": moduleCode,
    //   "userID": userID,
    //   "semester":semester,
    // });

    // var data = json.decode(response.body);
    // setState(() {
    //   name = data['name'];
    //   email = data['email'];

    // });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
    final String moduleName = args?['moduleName'] ?? 'No Module Name';
    final String moduleCode = args?['moduleCode'] ?? 'No Module Code';
    final String deptaName = args?['deptName'] ?? 'No deptName';
    final String semester = args?['semester'] ?? 'No year';

    TableRow _tableRow1 = TableRow(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 0),
          child: Text(
            "Module Name: $moduleName",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 0),
          child: Text(
            "Max Marks: 100",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );

    TableRow _tableRow2 = TableRow(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            "Module Code: $moduleCode",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            "Credit Value: 12",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );

    TableRow _tableRow3 = TableRow(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            "Department: $deptaName",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            "Semester: $semester",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Module Details'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Align(
          alignment: Alignment.topCenter,
          child: Table(
            columnWidths: {
              0: FlexColumnWidth(2.0), // Make the first column twice the size
              1: FlexColumnWidth(1.0), // Second column
            },
            children: <TableRow>[
              _tableRow1,
              _tableRow2,
              _tableRow3,
            ],
          ),
        ),
      ),
    );
  }
}
