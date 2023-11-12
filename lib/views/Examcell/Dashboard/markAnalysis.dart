import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class examCellModule extends StatefulWidget {

  final String code;

  const examCellModule({
    required this.code,
    Key? key}) : super(key: key);

  @override
  State<examCellModule> createState() => _gradedMarkViewState();
}

class _gradedMarkViewState extends State<examCellModule> {
  EmployeeDataSource employeeDataSource = EmployeeDataSource([]);
  List<GridColumn> _columns = [];
  double _zoom = 1.0;
  final int TEXT_COLOR = 0xFF1A1717;

  Future<List<Employee>> fetchEmployees(String code) async {
    var url = "https://resultsystemdb.000webhostapp.com/examcell/getModuleMark.php?code=${code}";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var list = json.decode(response.body);
        List<Employee> employees =
            list.map<Employee>((json) => Employee.fromJson(json)).toList();


        Employee grandTotalRow = Employee(
          sid: '',
          Credit: '',
          CA: '',
          Practical: '',
          Exam: '',
          Total: '',
        );

        Employee aggregateRow = Employee(
          sid: '',
          Credit: '',
          CA: '',
          Practical: '',
          Exam: '',
          Total: '',
        );

        employees.add(grandTotalRow);
        employees.add(aggregateRow);

        _columns = getColumns(); // Update the columns with Remarks column.

        employeeDataSource = EmployeeDataSource(employees);

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
        columnName: 'ID',
        label:
            Container(alignment: Alignment.center, child: Text('StudentID')),
        width: 150,
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
      GridColumn(
        columnName: 'Total',
        label: Container(alignment: Alignment.center, child: Text('Total')),
        width: 70,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.semester);
    //print(widget.sid);
    return Container(
      child: Column(
        children: [
          banner(context),
          SizedBox(height: 5,),
          semesterTable(),
        ],
      ),
    );

  }



    Padding banner(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        color: Color.fromARGB(255, 223, 229, 252),
  
          child: Padding(
            padding: const EdgeInsets.only(top:12.0, left: 8.0),
            child: Text(
              'Academic Mark',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color:Color(TEXT_COLOR),
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
    );
  }



  GestureDetector semesterTable() {
    return GestureDetector(
      child: FutureBuilder<List<Employee>>(
        future: fetchEmployees(widget.code),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (snapshot.hasData) {
              employeeDataSource = EmployeeDataSource(snapshot.data!);
              // print(employeeDataSource.toString());
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                child: Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width, // Match screen width
                  child: Transform.scale(
                    scale: _zoom,
                    child: SfDataGrid(
                      source: employeeDataSource,
                      frozenColumnsCount: 1,
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
              child: SpinKitChasingDots(
                color: Colors.blue,
                size: 50.0,
              ),
            );
        },
      ),
    );
  }
}

class EmployeeDataSource extends DataGridSource {
  List<Employee> employees = [];

  EmployeeDataSource(this.employees);

  @override
  List<DataGridRow> get rows => employees
      .where((e) => e.sid.isNotEmpty) // Filter out rows with empty sid
      .map<DataGridRow>((e) => DataGridRow(cells: [
            DataGridCell<String>(columnName: 'ID', value: e.sid),
            DataGridCell<String>(columnName: 'CA', value: e.CA),
            DataGridCell<String>(columnName: 'Practical', value: e.Practical),
            DataGridCell<String>(columnName: 'Exam', value: e.Exam),
            DataGridCell<String>(columnName: 'Total', value: e.Total),
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
  String sid,
      Credit,
      CA,
      Practical,
      Exam,
      Total;

  Employee({
    required this.sid,
    required this.Credit,
    required this.CA,
    required this.Practical,
    required this.Exam,
    required this.Total,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    double total = double.parse(json['total'].toString());
    return Employee(
      sid: json['sid'] as String? ?? '',
      Credit: json['credit'].toString(),
      CA: json['ca'].toString(),
      Practical: json['practical'].toString(),
      Exam: json['exam'].toString(),
      Total: total.toString(),
    );
  }
}
