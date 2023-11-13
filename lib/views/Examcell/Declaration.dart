import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:examcellapp/views/Examcell/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class Declaration extends StatefulWidget {
  const Declaration({Key? key}) : super(key: key);

  @override
  State<Declaration> createState() => _DeclarationState();
}

class _DeclarationState extends State<Declaration> {
  DateTime? selectedDate;
  TextEditingController textController = TextEditingController();
  String isResultDeclared = ''; // Track if the result is declared

  void declareResult(String semester, DateTime date, String status) async {
    final url = Uri.parse("https://resultsystemdb.000webhostapp.com/examcell/declare.php?semester=${semester}&date=${date}&status=${status}");

  try {
    final response = await http.post(url);

    if (response.statusCode == 200) {
      if(response.body == 'Success'){
        print('Result declared on: $selectedDate');
        setState(() {
          isResultDeclared = 'declared';
        });
      }
    } else {
      throw Exception('Failed to declare data');
    }
  } catch (error) {
    throw Exception('Failed to connect to the server');
  }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Row(
            //   children: <Widget>[
            //     Text('Release Date:'),
            //     datePicker(context),
            //   ],
            // ),
            SizedBox(height: 20.0),
            FutureBuilder(
              future: isDeclared(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: SpinKitChasingDots(color: Colors.blue,));
                }else if(snapshot.hasData){
                  print(snapshot.data);
                  if (snapshot.data == 'declared') {
                    return declareResultPage();
                  } else {
                    return declaredResultPage(context);
                  }
                }else{
                  return Text("No Data");
                }
              }
            ),
          ],
        ),
      ),
    );
  }

  SizedBox declaredResultPage(BuildContext context) {
    return SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => showDeclarationDialog(context),
                        child: Text(
                          'Declaration',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
  }

  Padding declareResultPage() {
    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                        child: Text(
                          'Result declared on: ${selectedDate?.toLocal()?.toString().split(' ')[0] ?? 'Select a date'}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    );
  }

  GestureDetector datePicker(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            selectedDate == null
                ? Text('Select a date')
                : Text(
                    '${selectedDate?.toLocal()?.toString().split(' ')[0] ?? 'Select a date'}',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ),
                  ),
            Icon(Icons.calendar_today, color: Colors.blue),
          ],
        ),
      ),
    );
  }

  void showDeclarationDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      headerAnimationLoop: false,
      showCloseIcon: false,
      animType: AnimType.topSlide,
      title: 'Result Declaration',
      desc: 'Declare the Result for AS2023?',
      btnOkOnPress: () {
        //declareResult();
        showSecondDialog(context);
      },
      btnCancelOnPress: () {},
      btnOkColor: Colors.blue,
      dismissOnBackKeyPress: true,
    )..show();
  }

  void showSecondDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      headerAnimationLoop: false,
      showCloseIcon: false,
      animType: AnimType.topSlide,
      title: 'Date',
      desc: 'Schedule Result Declaration?',
      btnOkOnPress: () {
        _selectDate(context);
      },
      btnCancelOnPress: () {
        DateTime currentDate = DateTime.now();
        print('Current Date and Time: $currentDate');
        finalBossDialog(context, currentDate);
      },
      btnOkColor: Colors.blue,
      dismissOnBackKeyPress: true,
      btnCancelText: 'Today',
      btnOkText: 'Date',
    ).show();
  }

  void showThirdDialog(BuildContext context, DateTime date) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      headerAnimationLoop: false,
      showCloseIcon: false,
      animType: AnimType.topSlide,
      title: "Result Declaration",
      desc: 'Schedule On ${date}',
      autoHide: Duration(seconds: 3),
      btnOkText: 'Date',
    ).show();
  }

  void finalBossDialog(BuildContext context, DateTime date) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      headerAnimationLoop: false,
      showCloseIcon: false,
      animType: AnimType.topSlide,
      title: 'Are You Sure?',
      // desc: 'Declare the Result for AS2023?',
      btnOkOnPress: () {
        declareResult("AS2023", date, "1");
        showThirdDialog(context, date);
        setState(() {
          selectedDate = date;
        });
      },
      btnCancelOnPress: () {
        setState(() {
          selectedDate = null;
          isResultDeclared = ''; // Clear the result declaration status
        });
      },
      btnOkColor: Colors.blue,
      dismissOnBackKeyPress: true,
    ).show();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      // Handle the selected date
      print('Selected date: $picked');
      finalBossDialog(context, picked);
    }
  }
}
