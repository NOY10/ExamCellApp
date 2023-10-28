import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class StdInfo extends StatefulWidget {
  const StdInfo({Key? key});
  @override
  State<StdInfo> createState() => _StdInfoState();
}

class _StdInfoState extends State<StdInfo> {
  final TEXT_COLOR = const Color(0xFF1A1717);

  late SharedPreferences prefs;
  String name = '';
  String SemNo = '';
  String program = '';
  String stdId = '';

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    final String? userID = prefs.getString('userID');
    final Uri url =
        Uri.parse("https://examcellflutter.000webhostapp.com/stdInfo.php");

    final response = await http.post(url, body: {
      "userID": userID,
    });
    var data = json.decode(response.body);
    setState(() {
      name = data['name'];
      SemNo = data['SemNo'];
      program = data['program'];
      stdId = data['id'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1.0), // Adjust column widths as needed
              1: FlexColumnWidth(1.0),
            },
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Text(
                      'Name: ${name}',
                      style: TextStyle(
                        fontSize: 16,
                        color: TEXT_COLOR,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Text(
                      'Semester: ${SemNo}',
                      style: TextStyle(
                        fontSize: 16,
                        color: TEXT_COLOR,
                      ),
                      textAlign:
                          TextAlign.center, // Align this text to the right
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Text(
                      'Student ID: ${stdId}',
                      style: TextStyle(
                        fontSize: 16,
                        color: TEXT_COLOR,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Text(
                      program,
                      style: TextStyle(
                        fontSize: 16,
                        color: TEXT_COLOR,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
