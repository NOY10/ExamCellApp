import 'package:flutter_editable_table/flutter_editable_table.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  
  Map<String, dynamic> data = 
    {
  "column_count": null, // Number of columns (the number of columns that are automatically created when [columns] is empty, [column_count] and [columns] are both empty at the same time, 1 column will be created)
  "row_count": null, // Number of rows (the number of rows created automatically when [rows] is empty, and 1 row will be created if both [row_count] and [rows] are empty at the same time)
  "addable": true, // Allow add new row
  "removable": true, // Allow remove row
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
      "primary_key": true, // Specify the row is  primary key or not, just for specify the data identification, it has no effect on the structure and display of the table
      "auto_increase": false,
      "name": "id", // Key of the rows data, see [rows]
      "title": null, // Column name for display
      "type": "int", // Column data type, to specifies how to convert the value after edit(if the type is integer/float, the value will be [minimum] in [constrains] when convert failed)
      "format": null,
      "description": null, // Column description, if not [null] or blank, it will display a tooltip with this description when `Long Press` the header
      "display": false,
      "editable": false,
      "input_decoration": {"min_lines": 1, "max_lines": 1, "max_length": 64, "hint_text": "Please input"},
      "constrains": { // [TextFormField] constrains, when [type] is int/float, and [editable] is [true], it will take effect
        "required": true, // Required to fill, default value is [false], if [true] but this field not fill, it will return [false] when you get `isFilled`
        "minimum": 0, // The minimum value to input, when input less then this value will replaced with this value(it will affect the keyboard type)
        "maximum": 99999999 // The maximum value to input, when input grater then this value will replaced with this value
      },
      "style": {"font_weight": "bold", "font_size": 14.0, "font_color": "#333333", "background_color": "#b5cfd2", "horizontal_alignment": "center", "vertical_alignment": "center", "text_align": "center"}
    },
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
      "type": "string", // Data types support [integer/int], [float/double/decimal], [bool], [date], [datetime], [string], different types have different interaction behaviors and keyboard
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
      "type": "int", // Data types support [integer/int], [float/double/decimal], [bool], [date], [datetime], [string], different types have different interaction behaviors and keyboard
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
      "type": "int", // Data types support [integer/int], [float/double/decimal], [bool], [date], [datetime], [string], different types have different interaction behaviors and keyboard
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


  Future<List<Map<String, dynamic>>> fetchData(String tid, String semester) async {
    var url = Uri.parse("https://resultsystemdb.000webhostapp.com/getStudentList.php?module=$tid&semester=$semester");
    var response = await http.get(url);
    print(tid);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchData(widget.mCode, widget.semester),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Display a loading indicator.
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            if (snapshot.hasData) {
              data["rows"] = snapshot.data as List<Map<String, dynamic>>;

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
      ),
    );
  }
}
