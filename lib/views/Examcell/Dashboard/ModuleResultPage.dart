import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:examcellapp/views/Examcell/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  //String tutor = '';

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
        "https://resultsystemdb.000webhostapp.com/examcell/getModuleMark.php?code=${moduleCode}");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var list = json.decode(response.body);
        //tutor = list[0]["tutorName"];
        List<StudentR> employees =
            list.map<StudentR>((json) => StudentR.fromJson(json)).toList();
        return employees;
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
        width: 100,
      ),
      GridColumn(
        columnName: 'name',
        label: Container(alignment: Alignment.center, child: Text('Name')),
        width: 150,
      ),
      GridColumn(
        columnName: 'ca',
        label: Container(alignment: Alignment.center, child: Text('CA')),
        width: 70,
      ),
      GridColumn(
        columnName: 'practical',
        label: Container(alignment: Alignment.center, child: Text('Practical')),
        width: 70,
      ),
      GridColumn(
        columnName: 'exam',
        label: Container(alignment: Alignment.center, child: Text('Exam')),
        width: 70,
      ),
      GridColumn(
        columnName: 'total',
        label: Container(alignment: Alignment.center, child: Text('Total')),
        width: 70,
      ),
      GridColumn(
        columnName: 'remark',
        label: Container(alignment: Alignment.center, child: Text('Remark')),
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
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black87
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 0),
          child: Text(
            "Max Marks: 100",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black87
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
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black87
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            "Credit Value: 12",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black87
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
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black87
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            "Semester: $semester",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black87
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
            flex: 5,
            child: FutureBuilder<List<StudentR>>(
              future: fetchModuleResult(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                 if (snapshot.hasError) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/pending.png',
                        width: 150,
                        height: 150,
                      ),
                      SizedBox(height: 10), // Add some space between the image and buttons
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Marksheet Pending...',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.blue,
                            ),),
                          SizedBox(height: 10,),// Add some space between buttons
                          ElevatedButton(
                            onPressed: () {
                              showRemindeDialog(context);
                            },
                            child: Text('Send Reminder?'),
                          ),
                        ],
                      ),
                    ],
                  );
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
                          frozenColumnsCount: 1,
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
                  child: SpinKitChasingDots(
                    color: Colors.blue,
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
            DataGridCell<String>(columnName: 'ca', value: e.CA),
            DataGridCell<String>(columnName: 'practical', value: e.Practical),
            DataGridCell<String>(columnName: 'exam', value: e.Exam),
            DataGridCell<String>(columnName: 'total', value: e.Total),
            DataGridCell<String>(columnName: 'remark', value: e.Remark),
          ]))
      .toList();

  @override
DataGridRowAdapter buildRow(DataGridRow row) {
  String remark = row.getCells().firstWhere((cell) => cell.columnName == 'remark').value.toString();
  bool isFail = remark.toLowerCase() == 'fail';

  return DataGridRowAdapter(
    cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        color: isFail ? Colors.black : null,
        child: Text(
          e.value.toString(),
          style: TextStyle(
            color: isFail ? Colors.white : null,
          ),
        ),
      );
    }).toList(),
  );
}

}

class StudentR {
  String StudentId, Name, CA, Practical, Exam, Remark, Total;

  StudentR({
    required this.StudentId,
    required this.Name,
    required this.CA,
    required this.Practical,
    required this.Exam,
    required this.Total,
    required this.Remark,
  });

  factory StudentR.fromJson(Map<String, dynamic> json) {
    return StudentR(
      StudentId: json["sid"] as String? ?? '',
      Name: json['name'] as String? ?? '',
      Practical: json['practical'].toString(),
      CA: json['ca'].toString(),
      Exam: json['exam'].toString(),
      Total: json['total'].toString(),
      Remark: json['remark'].toString(),
    );
  }
}

void showRemindeDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      headerAnimationLoop: false,
      showCloseIcon: false,
      animType: AnimType.topSlide,
      title: 'Notify the tutor in charge?',
      desc: '',
       btnOkOnPress: () {
        print(setRemider('RUB201204006', 'CTE306', '2023-11-30'));
        showAutoHideDialog(context);
      },
      btnCancelOnPress: () {},
      btnOkColor: Colors.blue,
      dismissOnBackKeyPress: true,

    ).show();
  }


void showAutoHideDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      headerAnimationLoop: false,
      showCloseIcon: false,
      animType: AnimType.topSlide,
      title: 'Reminder Sent!',
      //desc: 'Send Reminder?',
       autoHide: Duration(seconds: 3),
      dismissOnBackKeyPress: true,

    )..show();
  }