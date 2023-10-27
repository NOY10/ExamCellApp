import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class AllStdResult extends StatefulWidget {
  const AllStdResult({super.key});

  @override
  State<AllStdResult> createState() => _AllStdResultState();
}

class _AllStdResultState extends State<AllStdResult> {
  StudentDataSource studentDataSource = StudentDataSource([]);
  List<GridColumn> columns = [];

  @override
  void initState() {
    super.initState();
    columns = getColumns();
  }

  Future<List<StudentR>> fetchModuleResult() async {
    final Map<String, String>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
    final String deptNames = args?['deptName'] ?? 'No deptName';
    final String semester = args?['semester'] ?? 'No year';
    var dept;

    if (deptNames == "Architecture Department") {
      dept = "BEA";
    } else if (deptNames == "Information Technology") {
      dept = "BEIT";
    }

    final Uri url = Uri.parse(
        "https://examcellflutter.000webhostapp.com/individual_module.php");

    final response = await http.post(url, body: {
      "deptName": dept,
      "semester": semester,
    });

    try {
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        if (jsonResponse is Map<String, dynamic>) {
          final sid = jsonResponse['sid'];
          final name = jsonResponse['name'];
          final practical = jsonResponse['practical'];
          final ca = jsonResponse['ca'];
          final exam = jsonResponse['exam'];

          final student = StudentR(
            StudentId: sid.toString(),
            Name: name.toString(),
            Practical: practical.toString(),
            CA: ca.toString(),
            Exam: exam.toString(),
          );

          // Return a list with the single student
          return [student];
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error while fetching data: $e');
    }
  }

  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
        columnName: 'sid',
        label: Container(alignment: Alignment.center, child: Text('StudentId')),
        width: 150,
      ),
      GridColumn(
        columnName: 'name',
        label: Container(alignment: Alignment.center, child: Text('Name')),
        width: 80,
      ),
      GridColumn(
        columnName: 'practical',
        label: Container(alignment: Alignment.center, child: Text('Practical')),
        width: 70,
      ),
      GridColumn(
        columnName: 'ca',
        label: Container(alignment: Alignment.center, child: Text('CA')),
        width: 70,
      ),
      GridColumn(
        columnName: 'exam',
        label: Container(alignment: Alignment.center, child: Text('Exam')),
        width: 70,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Example content for StdResultA
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        color: Colors.white,
      ),
      child: Text(
        'This is the content of StdResultA.',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class StudentDataSource extends DataGridSource {
  List<StudentR> studentRs = [];

  StudentDataSource(this.studentRs);

  @override
  List<DataGridRow> get rows => studentRs
      .map<DataGridRow>((e) => DataGridRow(cells: [
            DataGridCell<String>(columnName: 'sid', value: e.StudentId),
            DataGridCell<String>(columnName: 'name', value: e.Name),
            DataGridCell<String>(columnName: 'practical', value: e.Practical),
            DataGridCell<String>(columnName: 'ca', value: e.CA),
            DataGridCell<String>(columnName: 'exam', value: e.Exam),
          ]))
      .toList();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          child: Text(e.value.toString()),
        );
      }).toList(),
    );
  }
}

class StudentR {
  String StudentId, Name, CA, Practical, Exam;

  StudentR({
    required this.StudentId,
    required this.Name,
    required this.CA,
    required this.Practical,
    required this.Exam,
  });

  factory StudentR.fromJson(Map<String, dynamic> json) {
    return StudentR(
      StudentId: json["sid"] as String? ?? '',
      Name: json['name'] as String? ?? '',
      Practical: json['practical'].toString(),
      CA: json['ca'].toString(),
      Exam: json['exam'].toString(),
    );
  }
}
