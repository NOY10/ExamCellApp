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
  List<List<dynamic>> excelContent = [];

  void pickExcelFile() async {
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
        excelContent = sheet.rows; // Get the rows as a list

        // Extract the first element of each Data object
        excelContent = excelContent.map((row) {
          return row.map((cell) => cell.value.toString()).toList();
        }).toList();

        setState(() {}); // Refresh the UI to display the picked file content
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (excelFile != null)
              Text('Selected Excel File: ${path.basename(excelFile!.path)}'),
            if (excelContent.isNotEmpty)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: excelContent[0]
                      .map<DataColumn>(
                          (cell) => DataColumn(label: Text('$cell')))
                      .toList(),
                  rows: excelContent.sublist(1).map<DataRow>((row) {
                    return DataRow(
                      cells: row
                          .map<DataCell>((cell) => DataCell(Text('$cell')))
                          .toList(),
                    );
                  }).toList(),
                ),
              ),
            ElevatedButton(
              onPressed: pickExcelFile,
              child: Text('Pick Excel File'),
            ),
          ],
        ),
      ),
    );
  }
}
