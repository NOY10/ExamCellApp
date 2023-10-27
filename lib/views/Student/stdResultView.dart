import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StudentResultView extends StatefulWidget {
  const StudentResultView({Key? key}) : super(key: key);

  @override
  State<StudentResultView> createState() => _StudentResultViewState();
}

class _StudentResultViewState extends State<StudentResultView> {
  EmployeeDataSource employeeDataSource = EmployeeDataSource([]);
  List<GridColumn> _columns = [];
  double _zoom = 1.0;

  Future<List<Employee>> fetchEmployees() async {
    var url = 'https://examcellflutter.000webhostapp.com/getResult.php';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var list = json.decode(response.body);
        List<Employee> employees =
            list.map<Employee>((json) => Employee.fromJson(json)).toList();
        return employees;
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error while fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _columns = getColumns();
  }

  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
        columnName: 'ModuleName',
        label:
            Container(alignment: Alignment.center, child: Text('Module Name')),
        width: 150,
      ),
      GridColumn(
        columnName: 'ModuleCode',
        label:
            Container(alignment: Alignment.center, child: Text('Module Code')),
        width: 80,
      ),
      GridColumn(
        columnName: 'Credit',
        label: Container(alignment: Alignment.center, child: Text('Credit')),
        width: 70,
      ),
      GridColumn(
        columnName: 'CA',
        label: Container(alignment: Alignment.center, child: Text('CA')),
        width: 70,
      ),
      GridColumn(
        columnName: 'Practical',
        label: Container(alignment: Alignment.center, child: Text('Practical')),
        width: 70,
      ),
      GridColumn(
        columnName: 'Exam',
        label: Container(alignment: Alignment.center, child: Text('Exam')),
        width: 70,
      ),
    ];
  }

  void zoomIn() {
    setState(() {
      _zoom += 0.1;
    });
  }

  void zoomOut() {
    setState(() {
      if (_zoom > 0.1) {
        _zoom -= 0.1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onScaleUpdate: (ScaleUpdateDetails details) {
          if (details.scale > 1.0) {
            zoomIn();
          } else {
            zoomOut();
          }
        },
        child: FutureBuilder<List<Employee>>(
          future: fetchEmployees(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (snapshot.hasData) {
                employeeDataSource = EmployeeDataSource(snapshot.data!);
                return SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal, // Enable horizontal scrolling
                  child: Container(
                    width:
                        MediaQuery.of(context).size.width, // Match screen width
                    child: Transform.scale(
                      scale: _zoom,
                      child: SfDataGrid(
                        source: employeeDataSource,
                        columns: _columns,
                        columnWidthMode: ColumnWidthMode.fill,
                        gridLinesVisibility: GridLinesVisibility.both,
                        headerGridLinesVisibility: GridLinesVisibility.both,
                      ),
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
    );
  }
}

class EmployeeDataSource extends DataGridSource {
  List<Employee> employees = [];

  EmployeeDataSource(this.employees);

  @override
  List<DataGridRow> get rows => employees
      .map<DataGridRow>((e) => DataGridRow(cells: [
            DataGridCell<String>(columnName: 'ModuleName', value: e.ModuleName),
            DataGridCell<String>(columnName: 'ModuleCode', value: e.ModuleCode),
            DataGridCell<String>(columnName: 'Credit', value: e.Credit),
            DataGridCell<String>(columnName: 'CA', value: e.CA),
            DataGridCell<String>(columnName: 'Practical', value: e.Practical),
            DataGridCell<String>(columnName: 'Exam', value: e.Exam),
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

class Employee {
  String ModuleCode, Credit, CA, Practical, Exam, ModuleName;

  Employee({
    required this.ModuleCode,
    required this.ModuleName,
    required this.Credit,
    required this.CA,
    required this.Practical,
    required this.Exam,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      ModuleCode: json['code'] as String? ?? '',
      ModuleName: json['name'] as String? ?? '',
      Credit: json['credit'].toString(),
      CA: json['ca'].toString(),
      Practical: json['practical'].toString(),
      Exam: json['exam'].toString(),
    );
  }
}
