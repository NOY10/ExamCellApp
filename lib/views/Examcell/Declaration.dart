import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class Declaration extends StatefulWidget {
  const Declaration({Key? key}) : super(key: key);

  @override
  State<Declaration> createState() => _DeclarationState();
}

class _DeclarationState extends State<Declaration> {
  DateTime? selectedDate;
  TextEditingController textController = TextEditingController();
  bool isResultDeclared = false; // Track if the result is declared

  void declareResult() async {
    // Perform the result declaration logic
    // For demonstration purposes, we'll just print a message
    print('Result declared on: $selectedDate');
    setState(() {
      isResultDeclared = true;
    });
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
            isResultDeclared
                ? Padding(
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
                  )
                : SizedBox(
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
                  ),
          ],
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
        declareResult();
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
        showThirdDialog(context, date);
        setState(() {
          selectedDate = date;
        });
      },
      btnCancelOnPress: () {
        setState(() {
          selectedDate = null;
          isResultDeclared = false; // Clear the result declaration status
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
