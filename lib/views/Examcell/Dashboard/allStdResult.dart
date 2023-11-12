import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class resultTable extends StatefulWidget {
  @override
  State<resultTable> createState() => _resultTableState();
}

class _resultTableState extends State<resultTable> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Result"),
          backgroundColor: Colors.blue,
        ),
        body: FutureBuilder(
          future: getStudentDataSource(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                //print(snapshot);
                return Center(
                  child: Text('Error: ${snapshot}'),
                );
              }
              if (snapshot.hasData) {
                //print(snapshot.data.studentList[0].modules[0].module);
                return SfDataGrid(
                  source: snapshot.data,
                  columns: getColumns(snapshot.data.studentList),
                  stackedHeaderRows: getStackedHeader(snapshot.data.studentList),
                  gridLinesVisibility: GridLinesVisibility.both,
                  headerGridLinesVisibility: GridLinesVisibility.both,
                  frozenColumnsCount: 1,
    
                );
              }
              return Center(child: Text('No data available'));
            } else {
              return SpinKitChasingDots(color: Colors.blue);
            }
          },
        ),
      ),
    );
  }

 List<StackedHeaderRow> getStackedHeader(List<Student> studentList) {
  List<StackedHeaderRow> stackedHeaderRows = [];

  if (studentList.isNotEmpty) {
    int numModules = studentList[0].modules.length;

    List<StackedHeaderCell> stackedHeaderCells = [];

    for (int i = 0; i < numModules; i++) {
      stackedHeaderCells.add(
        StackedHeaderCell(
          columnNames: ['CA_${i + 1}', 'Practical_${i + 1}', 'Exam_${i + 1}','Total_${i+1}'],
          child: Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            child: Text(
              studentList[0].modules[i].module,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ),
        ),
      );
    }

    stackedHeaderRows.add(
      StackedHeaderRow(
        cells: stackedHeaderCells,
      ),
    );
  }

  return stackedHeaderRows;
}


  Future<StudentDataGridSource> getStudentDataSource() async {
    var studentList = await generateStudentList();
    return StudentDataGridSource(studentList);
  }

  List<GridColumn> getColumns(List<Student> studentList) {
    List<GridColumn> columns = [
      GridColumn(
        columnName: 'ID',
        width: 80,
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          child: Text(
            'ID',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'Name',
        width: 150,
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          child: Text(
            'Name',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
    ];
    

    if (studentList.isNotEmpty) {
      int numModules = studentList[0].modules.length;

      for (int i = 0; i < numModules; i++) {
        columns.addAll([
          GridColumn(
            columnName: 'CA_${i + 1}',
            width: 50,
            label: Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(
                'CA',
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
          ),
          GridColumn(
            columnName: 'Exam_${i + 1}',
            width: 50,
            label: Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(
                'Exam',
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
          ),
          GridColumn(
            columnName: 'Practical_${i + 1}',
            width: 50,
            label: Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(
                'Practical',
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
          ),
          GridColumn(
            columnName: 'Total_${i + 1}',
            width: 50,
            label: Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(
                'Total',
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
          ),
        ]);
      }
    }

    columns.addAll([
      GridColumn(
        columnName: 'credit',
        width: 70,
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          child: Text(
            'Credit',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'aggregate',
        width: 70,
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: Text(
            'Aggregate',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
      GridColumn(
        columnName: 'remark',
        width: 70,
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: Text(
            'Remark',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
      ]
      
    );
    

    return columns;
  }

  Future<List<Student>> generateStudentList() async {
    var response =
        await http.get(Uri.parse("https://resultsystemdb.000webhostapp.com/examcell/dummy.php"));
    var decodedStudents = json.decode(response.body).cast<Map<String, dynamic>>();

    List<Student> studentList = await decodedStudents
        .map<Student>((json) => Student.fromJson(json))
        .toList();

    return studentList;
  }
}

class StudentDataGridSource extends DataGridSource {
  late List<DataGridRow> datagridRows;
  late List<Student> studentList;

  StudentDataGridSource(this.studentList) {
    buildDataGridRow();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      for (var cell in row.getCells())
        Container(
          child: Text(
            cell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(8.0),
        ),
    ]);
  }

  List<DataGridRow> get rows => datagridRows;

  void buildDataGridRow() {
    datagridRows = studentList.map<DataGridRow>((dataGridRow) {
      //print(dataGridRow.modules[0]);
      List<DataGridCell<String>> cells = [
        DataGridCell<String>(columnName: 'ID', value: dataGridRow.id),
        DataGridCell<String>(columnName: 'Name', value: dataGridRow.name),
      ];
      for (var module in dataGridRow.modules) {
        cells.addAll([
          // DataGridCell<String>(
          //   columnName: 'Module_${dataGridRow.modules.indexOf(module) + 1}',
          //   value: module.module,
          // ),
          DataGridCell<String>(
            columnName: 'CA_${dataGridRow.modules.indexOf(module) + 1}',
            value: module.marks['ca'].toString(),
          ),
          DataGridCell<String>(
            columnName: 'Exam_${dataGridRow.modules.indexOf(module) + 1}',
            value: module.marks['exam'].toString(),
          ),
          DataGridCell<String>(
            columnName: 'Practical_${dataGridRow.modules.indexOf(module) + 1}',
            value: module.marks['practical'].toString(),
          ),
          DataGridCell<String>(
            columnName: 'Total_${dataGridRow.modules.indexOf(module) + 1}',
            value: module.total,
          ),
        ]);
      }

      cells.addAll([
        DataGridCell<String>(columnName: 'Credit', value: dataGridRow.semCredit),
        DataGridCell<String>(columnName: 'Aggregate', value: dataGridRow.semPercentage),
        DataGridCell<String>(columnName: 'Remark', value: dataGridRow.passSemester),
      ]);

      return DataGridRow(cells: cells);
    }).toList(growable: false);
  }
}

class Student {
  final String name;
  final String id;
  final List<Module> modules;
  final String  semPercentage;
  final String semCredit;
  final String passSemester;

  Student({
    required this.name,
    required this.id,
    required this.modules,
    required this.semCredit,
    required this.semPercentage,
    required this.passSemester,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'],
      id: json['id'],
      modules: List<Module>.from(json['modules'].map((module) => Module.fromJson(module))),
      semCredit: json['semCredits'],
      semPercentage: json['semPercentage'],
      passSemester: json['PassSemester'],
    );
  }
}

class Module {
  final String module;
  final Map<String, dynamic> marks;
  final String total;
  final String remark;

  Module({
    required this.module,
    required this.marks,
    required this.total,
    required this.remark,
  });

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      module: json['Module'],
      marks: json['marks'],
      total: json['total'],
      remark: json['remark'],
    );
  }
}
