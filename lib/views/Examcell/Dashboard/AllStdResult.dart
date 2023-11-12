import 'dart:convert';
import 'package:flutter/material.dart';

class AllStdResult extends StatelessWidget {
  
  final String jsonData = '''
  [
  {
    "name": "JIGME PHUNTSHO WANGYEL",
    "id": "02210200",
    "modules": [
      {
        "Module": "Software Engineering",
        "ModuleCode": "CTE305",
        "semester": "AS2023",
        "marks": {
          "ca": 48,
          "exam": 45,
          "practical": null
        },
        "maxMarks": {
          "maxCA": 50,
          "maxExam": 50,
          "maxPractical": null
        },
        "total": 93,
        "totalCredit": 1116,
        "remark": "Pass",
        "percentage": 93
      },
      {
        "Module": "Human Computer Interaction",
        "ModuleCode": "CTE307",
        "semester": "AS2023",
        "marks": {
          "ca": 48,
          "exam": 45,
          "practical": null
        },
        "maxMarks": {
          "maxCA": 50,
          "maxExam": 50,
          "maxPractical": null
        },
        "total": 93,
        "totalCredit": 1116,
        "remark": "Pass",
        "percentage": 93
      },
      {
        "Module": "Advanced Web Technology",
        "ModuleCode": "CTE308",
        "semester": "AS2023",
        "marks": {
          "ca": 28,
          "exam": 32,
          "practical": 19
        },
        "maxMarks": {
          "maxCA": 35,
          "maxExam": 40,
          "maxPractical": 25
        },
        "total": 79,
        "totalCredit": 948,
        "remark": "Pass",
        "percentage": 79
      },
      {
        "Module": "Object Oriented Analysis & Design",
        "ModuleCode": "DIS302",
        "semester": "AS2023",
        "marks": {
          "ca": 28,
          "exam": 32,
          "practical": 19
        },
        "maxMarks": {
          "maxCA": 35,
          "maxExam": 40,
          "maxPractical": 25
        },
        "total": 79,
        "totalCredit": 948,
        "remark": "Pass",
        "percentage": 79
      }
    ]
  },
  {
    "name": "PHURPA TSHERING",
    "id": "02210215",
    "modules": [
      {
        "Module": "Software Engineering",
        "ModuleCode": "CTE305",
        "semester": "AS2023",
        "marks": {
          "ca": 39,
          "exam": 42,
          "practical": null
        },
        "maxMarks": {
          "maxCA": 50,
          "maxExam": 50,
          "maxPractical": null
        },
        "total": 81,
        "totalCredit": 972,
        "remark": "Pass",
        "percentage": 81
      },
      {
        "Module": "Human Computer Interaction",
        "ModuleCode": "CTE307",
        "semester": "AS2023",
        "marks": {
          "ca": 39,
          "exam": 42,
          "practical": null
        },
        "maxMarks": {
          "maxCA": 50,
          "maxExam": 50,
          "maxPractical": null
        },
        "total": 81,
        "totalCredit": 972,
        "remark": "Pass",
        "percentage": 81
      },
      {
        "Module": "Advanced Web Technology",
        "ModuleCode": "CTE308",
        "semester": "AS2023",
        "marks": {
          "ca": 21,
          "exam": 26,
          "practical": 20
        },
        "maxMarks": {
          "maxCA": 35,
          "maxExam": 40,
          "maxPractical": 25
        },
        "total": 67,
        "totalCredit": 804,
        "remark": "Pass",
        "percentage": 67
      },
      {
        "Module": "Object Oriented Analysis & Design",
        "ModuleCode": "DIS302",
        "semester": "AS2023",
        "marks": {
          "ca": 21,
          "exam": 26,
          "practical": 20
        },
        "maxMarks": {
          "maxCA": 35,
          "maxExam": 40,
          "maxPractical": 25
        },
        "total": 67,
        "totalCredit": 804,
        "remark": "Pass",
        "percentage": 67
      }
    ]
  },
  {
    "name": "PRALAD MISHRA",
    "id": "02210217",
    "modules": [
      {
        "Module": "Software Engineering",
        "ModuleCode": "CTE305",
        "semester": "AS2023",
        "marks": {
          "ca": 42,
          "exam": 40,
          "practical": null
        },
        "maxMarks": {
          "maxCA": 50,
          "maxExam": 50,
          "maxPractical": null
        },
        "total": 82,
        "totalCredit": 984,
        "remark": "Pass",
        "percentage": 82
      },
      {
        "Module": "Human Computer Interaction",
        "ModuleCode": "CTE307",
        "semester": "AS2023",
        "marks": {
          "ca": 42,
          "exam": 40,
          "practical": null
        },
        "maxMarks": {
          "maxCA": 50,
          "maxExam": 50,
          "maxPractical": null
        },
        "total": 82,
        "totalCredit": 984,
        "remark": "Pass",
        "percentage": 82
      },
      {
        "Module": "Advanced Web Technology",
        "ModuleCode": "CTE308",
        "semester": "AS2023",
        "marks": {
          "ca": 27,
          "exam": 27,
          "practical": 23
        },
        "maxMarks": {
          "maxCA": 35,
          "maxExam": 40,
          "maxPractical": 25
        },
        "total": 77,
        "totalCredit": 924,
        "remark": "Pass",
        "percentage": 77
      },
      {
        "Module": "Object Oriented Analysis & Design",
        "ModuleCode": "DIS302",
        "semester": "AS2023",
        "marks": {
          "ca": 27,
          "exam": 27,
          "practical": 23
        },
        "maxMarks": {
          "maxCA": 35,
          "maxExam": 40,
          "maxPractical": 25
        },
        "total": 77,
        "totalCredit": 924,
        "remark": "Pass",
        "percentage": 77
      }
    ]
  },
  {
    "name": "TSHERING NORPHEL",
    "id": "02210233",
    "modules": [
      {
        "Module": "Software Engineering",
        "ModuleCode": "CTE305",
        "semester": "AS2023",
        "marks": {
          "ca": 32,
          "exam": 25,
          "practical": null
        },
        "maxMarks": {
          "maxCA": 50,
          "maxExam": 50,
          "maxPractical": null
        },
        "total": 57,
        "totalCredit": 684,
        "remark": "Pass",
        "percentage": 57
      },
      {
        "Module": "Human Computer Interaction",
        "ModuleCode": "CTE307",
        "semester": "AS2023",
        "marks": {
          "ca": 33,
          "exam": 25,
          "practical": null
        },
        "maxMarks": {
          "maxCA": 50,
          "maxExam": 50,
          "maxPractical": null
        },
        "total": 58,
        "totalCredit": 696,
        "remark": "Pass",
        "percentage": 58
      },
      {
        "Module": "Advanced Web Technology",
        "ModuleCode": "CTE308",
        "semester": "AS2023",
        "marks": {
          "ca": 32,
          "exam": 19,
          "practical": 22
        },
        "maxMarks": {
          "maxCA": 35,
          "maxExam": 40,
          "maxPractical": 25
        },
        "total": 73,
        "totalCredit": 876,
        "remark": "Pass",
        "percentage": 73
      },
      {
        "Module": "Object Oriented Analysis & Design",
        "ModuleCode": "DIS302",
        "semester": "AS2023",
        "marks": {
          "ca": 32,
          "exam": 19,
          "practical": 22
        },
        "maxMarks": {
          "maxCA": 35,
          "maxExam": 40,
          "maxPractical": 25
        },
        "total": 73,
        "totalCredit": 876,
        "remark": "Pass",
        "percentage": 73
      }
    ]
  }
]
  ''';

  @override
   Widget build(BuildContext context) {
    List<Map<String, dynamic>> userData = List<Map<String, dynamic>>.from(jsonDecode(jsonData));

    double minRowHeight = 200.0; // Set the desired row height

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 170,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columnSpacing: 20,
            columns: [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('SID')),
              for (int i = 0; i < userData[0]['modules'].length; i++)
                DataColumn(
                  label: Text('Module ${i + 1}'),
                ),
              DataColumn(label: Text('Remark')),
              DataColumn(label: Text('Aggregate')),
            ],
            dataRowHeight: minRowHeight,
            rows: userData.map((user) {
              List<DataCell> cells = [
                DataCell(Text(user['name'])),
                DataCell(Text(user['id'])),
              ];

              // Add DataCells for each module
              for (var module in user['modules']) {
                cells.add(DataCell(
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('CA: ${module['marks']['ca']}'),
                      Text('Practical: ${module['marks']['practical'] ?? "--"}'),
                      Text('Exam: ${module['marks']['exam'] ?? "--"}'),
                      Text('Total: ${module['total']}'),
                    ],
                  ),
                ));
              }

              // Add Remark and Aggregate DataCells
              cells.add(DataCell(Text(user['modules'][0]['remark'])));
              cells.add(DataCell(Text('${user['modules'][0]['percentage']}%')));

              return DataRow(cells: cells);
            }).toList(),
          ),
        ),
      ),
    );
  }
}


