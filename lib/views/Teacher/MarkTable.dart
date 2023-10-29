import 'dart:io';

import 'package:examcellapp/views/Teacher/filePicker/filePicker.dart';
import 'package:flutter_editable_table/flutter_editable_table.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';


class markTable extends StatefulWidget {
  final String semester;
  final String mCode;

  const markTable({
    required this.semester,
    required this.mCode,
    Key? key}): super(key:key);

  @override
  _EditableMarkTable createState() => _EditableMarkTable();
}

class _EditableMarkTable extends State<markTable> {
  final GlobalKey<EditableTableState> _editableTableKey = GlobalKey<EditableTableState>();
  bool haveExcel = false;
  
  Map<String, dynamic> data = 
    {
  "column_count": null, // Number of columns (the number of columns that are automatically created when [columns] is empty, [column_count] and [columns] are both empty at the same time, 1 column will be created)
  "row_count": null, // Number of rows (the number of rows created automatically when [rows] is empty, and 1 row will be created if both [row_count] and [rows] are empty at the same time)
  "addable": false, // Allow add new row
  "removable": false, // Allow remove row
  "caption": { // Table caption
    "layout_direction": "row", // Caption layout direction, support [row] and [column]
    "main_caption": { // Main caption
      "title": "Caption", // Caption title for display
      "display": false, // Specify the caption display or not
      "editable": false, // Specify the caption is editable, if [true], the caption will show as [TextFormField]
      "input_decoration": { // [TextFormField] arguments，if [editable] is [true], the argument will take effect
        "min_lines": 1, // Same as [TextFormField] [minLines]
        "max_lines": 1, // Same as [TextFormField] [maxLines]
        "max_length": 64, // Same as [TextFormField]的 maxLength]
        "hint_text": "Please input the caption", // Same as [TextFormField] [hintText]
        "fill_color": null // Same as [TextFormField] [fillColor]
      },
      "style": { // Text style, basically the same as [TextStyle]
        "font_weight": "bold",
        "font_size": 18.0,
        "font_color": "#333333", // Font color, format is `#RRGGBB`
        "background_color": null, // The background color of the text container [color]
        "horizontal_alignment": "center", // The alignment of the text container [alignment]，see `lib/constants.dart` - `editableHorizontalAlignment`
        "vertical_alignment": "center", // Vertical alignment, not work now
        "text_align": "center" // The text align, same as [Text] [textAlign], see `lib/constants.dart` -`editableCellTextAlign`
      }
    },
    "sub_caption": {
      "title": null,
      "display": false,
      "editable": true,
      "input_decoration": {"min_lines": 1, "max_lines": 1, "max_length": 64, "hint_text": "Please input the sub-caption", "fill_color": null},
      "constrains": {"required": true},
      "style": {"font_weight": "normal", "font_size": 14.0, "font_color": "#333333", "background_color": null, "horizontal_alignment": "center", "vertical_alignment": "center", "text_align": "center"}
    }
  },
  "columns": [ // Column

    {
      "primary_key": false,
      "auto_increase": false,
      "name": "Name",
      "title": "Name",
      "type": "string", // Data types support [integer/int], [float/double/decimal], [bool], [date], [datetime], [string], different types have different interaction behaviors and keyboard
      "format": null,
      "description": "User Name",
      "display": true,
      "editable": false,
      "width_factor": 0.2,
      "input_decoration": {"min_lines": 1, "max_lines": 1, "max_length": 128, "hint_text": "Please input the name"},
      "constrains": {"minimum": 0, "maximum": 99999999},
      "style": {"font_weight": "bold", "font_size": 14.0, "font_color": "#333333", "background_color": "#b5cfd2", "horizontal_alignment": "center", "vertical_alignment": "center", "text_align": "center"}
    },
    {
      "primary_key": false,
      "auto_increase": false,
      "name": "ID",
      "title": "ID",
      "type": "string", // Data types support [integer/int], [float/double/decimal], [bool], [date], [datetime], [string], different types have different interaction behaviors and keyboard
      "format": null,
      "description": "User ID",
      "display": true,
      "editable": false,
      "width_factor": 0.2,
      "input_decoration": {"min_lines": 1, "max_lines": 1, "max_length": 128, "hint_text": ""},
      "constrains": {"minimum": 0, "maximum": 99999999},
      "style": {"font_weight": "bold", "font_size": 14.0, "font_color": "#333333", "background_color": "#b5cfd2", "horizontal_alignment": "center", "vertical_alignment": "center", "text_align": "center"}
    },
    {
      "primary_key": false,
      "auto_increase": false,
      "name": "ca",
      "title": "CA",
      "type": "float", // Data types support [integer/int], [float/double/decimal], [bool], [date], [datetime], [string], different types have different interaction behaviors and keyboard
      "format": null,
      "description": "User ID",
      "display": true,
      "editable": true,
      "width_factor": 0.2,
      "input_decoration": {"min_lines": 1, "max_lines": 1, "max_length": 128, "hint_text": ""},
      "constrains": {"minimum": 0, "maximum": 99999999},
      "style": {"font_weight": "bold", "font_size": 14.0, "font_color": "#333333", "background_color": "#b5cfd2", "horizontal_alignment": "center", "vertical_alignment": "center", "text_align": "center"}
    },
    {
      "primary_key": false,
      "auto_increase": false,
      "name": "exam",
      "title": "Exam",
      "type": "double", // Data types support [integer/int], [float/double/decimal], [bool], [date], [datetime], [string], different types have different interaction behaviors and keyboard
      "format": null,
      "description": "Semester ID",
      "display": true,
      "editable": true,
      "width_factor": 0.2,
      "input_decoration": {"min_lines": 1, "max_lines": 1, "max_length": 128, "hint_text": ""},
      "constrains": {"minimum": 0, "maximum": 99999999},
      "style": {"font_weight": "bold", "font_size": 14.0, "font_color": "#333333", "background_color": "#b5cfd2", "horizontal_alignment": "center", "vertical_alignment": "center", "text_align": "center"}
    },
    {
      "primary_key": false,
      "auto_increase": false,
      "name": "practical",
      "title": "Practical",
      "type": "float", // Data types support [integer/int], [float/double/decimal], [bool], [date], [datetime], [string], different types have different interaction behaviors and keyboard
      "format": null,
      "description": "Semester ID",
      "display": true,
      "editable": true,
      "width_factor": 0.2,
      "input_decoration": {"min_lines": 1, "max_lines": 1, "max_length": 128, "hint_text": ""},
      "constrains": {"minimum": 0, "maximum": 99999999},
      "style": {"font_weight": "bold", "font_size": 14.0, "font_color": "#333333", "background_color": "#b5cfd2", "horizontal_alignment": "center", "vertical_alignment": "center", "text_align": "center"}
    },
  ],
  "rows": [],
  };


  Future<void> sendJsonToApi(String data) async{
    var apiUrl = Uri.parse("https://resultsystemdb.000webhostapp.com/addMark.php");
    var jsonData = data;
    
    var response = await http.post(
      apiUrl,
      headers: {'Content-Type': 'application/json'},
      body: jsonData,
    );

    if (response.statusCode == 200) {
    // The request was successful, and you can check the response content
    final responseData = json.decode(response.body);
    if (responseData['success'] == true) {
      // Data insertion was successful
      print("Data inserted successfully.");
    } else {
      // Data insertion failed, and you can access the error message
      print("Data insertion failed: ${responseData['error']}");
    }
  } else {
    // Request failed (e.g., connection issue)
    print("Request failed with status code: ${response.statusCode}");
  }
  }

  Future<List<Map<String, dynamic>>> fetchData(String tid, String semester) async {
    var url = Uri.parse("https://resultsystemdb.000webhostapp.com/getStudentList.php?module=$tid&semester=$semester");
    var response = await http.get(url);

    if (response.statusCode == 200) {
       List<dynamic> originalData = json.decode(response.body);

    // Map the original data to a new list with modified fields.
    List<Map<String, dynamic>> modifiedData = [];
    for (var student in originalData) {
      modifiedData.add({
        "ID": student["ID"],
        "Name": student["Name"],
        "ca": "",
        "exam": "",
        "practical": "",
      });
    }

    return modifiedData;
    } else {
      throw Exception('Failed to load data');
    }
  }

  String addColumnsToList(String data) {
    List<Map<String, dynamic>> modifiedList = [];

    try {
      final List<dynamic> jsonData = json.decode(data);

      if (jsonData is List && jsonData.isNotEmpty && jsonData.first is Map<String, dynamic>) {
        // Data is valid JSON, proceed with modification
        for (var item in jsonData) {
          // Add new columns to each item
          item['tid'] = 'RUB200705012'; // You can set the values as needed
          item['dateOfExam'] = "2023-11-22";
          item['semester'] = "AS2023";
          item['code'] = "CTE305";

          modifiedList.add(item);
        }
      } else {
        // Data is not in the expected format
        print("Data format is not as expected.");
      }
    } catch (e) {
      // JSON decoding error
      print("JSON decoding error: $e");
    }

    return jsonEncode(modifiedList);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mCode ,
        style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            heading(),
            buttons(),
            tableMark(),
          ],
        ),
      ),
    );
  }

  Padding buttons() {
    return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: retrieveExcel, 
                  child: Text("excel")
                ),
                OutlinedButton(
                  onPressed:() {
                    print('123');
                    var tableData = _editableTableKey.currentState?.currentData.rows;
                    // print(data["rows"]);
                    // var jsonData = jsonEncode(data["rows"]);
                    var jsonData = jsonEncode(tableData);
                    sendJsonToApi(addColumnsToList(jsonData));
                    print(addColumnsToList(jsonData));
                  }, 
                  child: Text("Save")
                ),
                OutlinedButton(
                  onPressed:() {print("Reset");}, 
                  child: Text("Clear")
                )
              ],
            ),
          );
  }

  Padding heading() {
    return Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text("Semester: ${widget.semester}"),
          );
  }

  Future<void> retrieveExcel() async {
  File? excelFile;
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['xlsx'], // You can specify other Excel formats as needed.
  );

  if (result != null && result.files.isNotEmpty) {
    String? filePath = result.files.single.path;
    if (filePath != null) {
      excelFile = File(filePath);

      final bytes = File(filePath).readAsBytesSync();
      final excel = Excel.decodeBytes(bytes);

      final sheet = excel.tables[excel.tables.keys.first]!;
        List<List<dynamic>> excelContent = sheet.rows; // Get the rows as a list

      // Extract data from Excel and set it to the table.
      List<Map<String, dynamic>> excelData = [];

     
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
            'Name': student.name,
            'ID': '0${student.id}',
            'ca': student.ca,
            'exam': student.exam,
            'practical': student.practical,
          };
        }).toList();

      // Update the table with the Excel data.
      setState(() {
        data['rows'] = studentListAsMaps;
        haveExcel = true;
      });
    }
  }
}

bool validateMarks(String data) {
    List<Map<String, dynamic>> listData = List<Map<String, dynamic>>.from(json.decode(data));
    for(var row in listData){
      if(row['ca'] == '' || row['exam'] == '' || row['practical'] == ''){
        return false;
      }
      if(row['ca'] == null || row['exam'] == null || row['practical'] == null){
        return false;
      }
    }

    return true;
  }
  FutureBuilder<List<Map<String, dynamic>>> tableMark() {
    return FutureBuilder(
      future: fetchData(widget.mCode, widget.semester),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Display a loading indicator.
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.hasData) {
            
            if(!haveExcel){
              data["rows"] = snapshot.data as List<Map<String, dynamic>>;
            }
            print(data["rows"]);
            return SingleChildScrollView(
              child: EditableTable(
                key: _editableTableKey,
                data: data,
                readOnly: false,
              ),
            );
          } else {
            return Text('No data available.');
          }
        }
      },
    );
  }
}
