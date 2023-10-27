import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ModuleResultPage extends StatefulWidget {
  @override
  State<ModuleResultPage> createState() => _ModuleResultPageState();
}

class _ModuleResultPageState extends State<ModuleResultPage> {
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
    final String moduleCode = args?['moduleCode'] ?? 'No Module Code';
    final String semester = args?['semester'] ?? 'No year';

    final Uri url = Uri.parse(
        "https://examcellflutter.000webhostapp.com/individual_module.php");

    final response = await http.post(url, body: {
      "moduleCode": moduleCode,
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
    final Map<String, String>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
    final String moduleName = args?['moduleName'] ?? 'No Module Name';
    final String moduleCode = args?['moduleCode'] ?? 'No Module Code';
    final String deptName = args?['deptName'] ?? 'No deptName';
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
            "Department: $deptName",
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
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.topCenter,
                child: Table(
                  columnWidths: {
                    0: FlexColumnWidth(
                        2.0), // Make the first column twice the size
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
          ),
          Expanded(
            flex: 6,
            child: FutureBuilder<List<StudentR>>(
              future: fetchModuleResult(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (snapshot.hasData) {
                    studentDataSource = StudentDataSource(snapshot.data!);
                    return SingleChildScrollView(
                      scrollDirection:
                          Axis.horizontal, // Enable horizontal scrolling
                      child: Container(
                        width: MediaQuery.of(context)
                            .size
                            .width, // Match screen width
                        child: SfDataGrid(
                          source: studentDataSource,
                          columns: columns,
                          columnWidthMode: ColumnWidthMode.fill,
                          gridLinesVisibility: GridLinesVisibility.both,
                          headerGridLinesVisibility: GridLinesVisibility.both,
                        ),
                      ),
                    );
                  }
                }
                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    value: 0.8,
                  ),
                );
              },
            ),
          ),
        ],
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
