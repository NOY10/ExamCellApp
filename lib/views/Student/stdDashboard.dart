import 'package:examcellapp/views/Student/stdLineChart.dart';
import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  final double FONT_SIZE = 14;
  final int TEXT_COLOR = 0xFF1A1717;
  final RECt_COLOR = 0xFFE7E6E6;
  final CARD_COLOR = 0xFF3385FF;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          assessment(),
          banner(context),
          moduleCard(context),
          StudentLineChart(),
        ],
      ),
    );
  }

  Container moduleCard(BuildContext context) {
    return Container(
          margin: EdgeInsets.all(18),
          height: 140,
          child: Row(
            children: [
              Card(
                color: Color(CARD_COLOR),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3 - 20,
                  padding: EdgeInsets.all(14),
                  child:const Column(
                    
                    children: [
                      Text(
                        'Completed Modules',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),),
                      Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: Text(
                          '5', 
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color(CARD_COLOR),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3 - 20,
                  padding: EdgeInsets.all(14),
                  child:const Column(
                    
                    children: [
                      Text(
                        'Repeat Modules',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),),
                      Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: Text(
                          '5', 
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color(CARD_COLOR),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3 - 20,
                  padding: EdgeInsets.all(14),
                  child:const Column(
                    
                    children: [
                      Text(
                        'Current Modules',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),),
                      Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: Text(
                          '5', 
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),


          
        );
  }

  

  Center assessment() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Text(
          'To pass a module, a student must obtain a maximum of 50% overall, including both the continuous assessment and semester-end examination. However, students must obtain a minimum of 40% in each of the continuous assessment and semester examination.',
          style: TextStyle(
            fontSize: FONT_SIZE,
            color: Color(TEXT_COLOR).withOpacity(0.5),
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  Padding banner(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: Color(RECt_COLOR),
            child: Center(
              child: Text(
                'Second Semester of Academic year 2023',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(TEXT_COLOR),
                ),
              ),
            ),
          ),
        );
  }
}

