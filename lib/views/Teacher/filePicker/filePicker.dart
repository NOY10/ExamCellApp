import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

class FilePickerE extends StatefulWidget {
  @override
  _FilePickerState createState() => _FilePickerState();
}

class _FilePickerState extends State<FilePickerE> {
  File? excelFile;
  List<Map<String, dynamic>> excelData = [];

  Future<List<Map<String, dynamic>>> pickExcelFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (result != null && result.files.isNotEmpty) {
      String? filePath = result.files.single.path;
      if (filePath != null) {
        excelFile = File(filePath);

        final bytes = File(filePath).readAsBytesSync();
        final excel = Excel.decodeBytes(bytes);

        final sheet = excel.tables[excel.tables.keys.first]!;
        List<List<dynamic>> excelContent = sheet.rows; // Get the rows as a list

        // Extract the first element of each Data object
        excelContent = excelContent.map((row) {
          return row.map((cell) => cell.value.toString()).toList();
        }).toList();

        List<Student> students = [];
        for (int i = 1; i < excelContent.length; i++) {
          students.add(Student(
            name: excelContent[i][0],
            id: int.parse(excelContent[i][1]),
            ca: int.parse(excelContent[i][2]),
            exam: int.parse(excelContent[i][3]),
            practical: int.parse(excelContent[i][4]),
          ));
        }

        // Convert the 'students' list to a list of maps
        List<Map<String, dynamic>> studentListAsMaps = students.map((student) {
          return {
            'name': student.name,
            'id': student.id,
            'ca': student.ca,
            'exam': student.exam,
            'practical': student.practical,
          };
        }).toList();

        return studentListAsMaps;
      }
    }

    return []; // Return an empty list if no file is selected
  }
  

  @override
  Widget build(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (excelFile != null)
          Text('Selected Excel File: ${path.basename(excelFile!.path)}'),
        ElevatedButton(
          onPressed: () async {
            excelData = await pickExcelFile();
          },
          child: Text('Pick Excel File'),
        ),
      ],
    ),
  );
}

}

class Student {
  String name;
  int id;
  int ca;
  int exam;
  int practical;

  Student({
    required this.name,
    required this.id,
    required this.ca,
    required this.exam,
    required this.practical,
  });
}
