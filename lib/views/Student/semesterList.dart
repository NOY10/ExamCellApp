
import 'package:examcellapp/views/Student/stdResultView/stdResultView.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class semesterResult extends StatefulWidget {
  const semesterResult({Key? key}) : super(key: key);

  @override
  State<semesterResult> createState() => _semesterResultState();

}

class _semesterResultState extends State<semesterResult>{
  final sid = "02210233";
  Future<List<dynamic>> fetchSemester(String sid) async {
    var url = 'https://resultsystemdb.000webhostapp.com/getSemesterList.php?sid=$sid';

    try{
      final response = await http.get(Uri.parse(url));

      if(response.statusCode == 200){
        List<dynamic> data = json.decode(response.body);

        return data;
      } 
    } catch (e) {
      throw Exception('Error while fetching data: $e');
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: fetchSemester(sid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Display a loading indicator while fetching data.
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            if (snapshot.hasData) {
              // Use the data here to create a list of StudentResultView widgets.
              List<dynamic> semesterData = snapshot.data as List<dynamic>;
               return SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var item in semesterData)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: StudentResultView(
                            key: ValueKey<String>('semester_${item["semester"]}'),
                            sid: sid, 
                            semester : item["semester"]),
                        ), // Create a StudentResultView for each item
                      ],
                    ),
                  );
            } else {
              return Text('No data available.');
            }
          }
        },
      ),
    );
  }
}