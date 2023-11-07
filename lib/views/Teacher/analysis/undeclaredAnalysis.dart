import 'dart:math';
import 'package:examcellapp/views/NavBar/NavBar.dart';
import 'package:examcellapp/views/Teacher/analysis/markAnalysis.dart';
import 'package:examcellapp/views/Teacher/analysis/scatter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class undeclaredAnalysis extends StatefulWidget {
  final String tid;
  final String mCode;

  const undeclaredAnalysis({
    required this.tid,
    required this.mCode,
    Key? key,
  }) : super(key: key);

  @override
  State<undeclaredAnalysis> createState() => _undeclaredAnalysisState();
}

class _undeclaredAnalysisState extends State<undeclaredAnalysis> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onCategoryTap(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  Future<List<dynamic>> fetch(String tid, String code) async {
    var url = Uri.parse(
        "https://resultsystemdb.000webhostapp.com/getUndeclaredMark.php?tid=$tid&code=$code");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> data =
        List<Map<String, dynamic>>.from(json.decode(response.body));

      for (var student in data) {
        // Calculate pass status for the student
        bool passTotal = isPassingTotal(student);
        bool passCa = isPassCa(student);
        bool passPractical = isPassingPractical(student);
        bool passExam = isPassingExam(student);

        // Append pass status to the student's data
        student['passTotal'] = passTotal;
        student['passCa'] = passCa;
        student['passPractical'] = passPractical;
        student['passExam'] = passExam;
      }

      

      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width / 3;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Analysis",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
     
      body: FutureBuilder(
        future: fetch(widget.tid, widget.mCode),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SpinKitChasingDots(
                color: Colors.blue,
                size: 50.0,
              )
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else {
            if (snapshot.hasData) {
              List<Map<String, dynamic>> data =
                  snapshot.data as List<Map<String, dynamic>>;
              List<String> category = ['ca', 'practical', 'exam','total'];
              
              return SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height + 500,
                  child: Column(
                    children: [   
                      chart(buttonWidth, category, context, data),
                      gradedMarkView(tid: widget.tid, code: widget.mCode),
                    ],
                  ),
                ),
              );
            } else {
              return Text("no data");
            }
          }
        },
      ),
    );
  }

  SizedBox chart(double buttonWidth, List<String> category, BuildContext context, List<Map<String, dynamic>> data) {
    return SizedBox(
              width: buttonWidth*3,
              height: 400,
              child: PageView(
                controller: _pageController,
                children: List.generate(category.length, (index) {
                  final cat = category[index];
                  return Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.grey,
                            child: chartheader(data, cat)),
                        ),
                        ScatterPlotChart(data: data, category: cat,),
                      ],
                    ),
                  );
                }),
              ),
            );
  }

  Padding chartheader(List<Map<String, dynamic>> data, String cat) {
    String title = '';
    if(cat == 'ca'){
      title = 'Continuos Assessment';
    }else if(cat == 'practical'){
      title = 'Practical Assessment';
    }if(cat == 'exam'){
      title = 'Exam Assessment';
    }else if(cat == 'total'){
      title = 'Aggregate';
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
          style: const TextStyle(
                fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Pass: ${countPassFail(data, cat)['pass'].toString()}',
                style: const TextStyle(
                fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                'Fail: ${countPassFail(data, cat)['fail'].toString()}',
                style: const TextStyle(
                fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Column scatterplot(
      List<String> category, double buttonWidth, List<Map<String, dynamic>> data) {
    return Column(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: category.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _onCategoryTap(index),
                child: Container(
                  width: buttonWidth,
                  height: 50,
                  color: index == _currentIndex
                      ? Colors.white
                      : Color.fromARGB(255, 85, 166, 232),
                  alignment: Alignment.center,
                  child: Text(
                    category[index],
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          width: buttonWidth * 3,
          height: 300,
          child: PageView(
            controller: _pageController,
            children: List.generate(category.length, (index) {
              final cat = category[index];
              return Center(
                child: ScatterPlotChart(data: data, category: cat),
              );
            }),
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

bool isPassingTotal(Map<String, dynamic> student) {
  double total = student['total'].toDouble(); 
  return total >= 50;
}

bool isPassingExam(Map<String, dynamic> student) {
  double exam = student['exam'].toDouble(); 
  double maxExam = student['maxExam'].toDouble(); 

  return exam >= (0.4 * maxExam);
}

bool isPassingPractical(Map<String, dynamic> student) {
  double practical = student['practical'].toDouble(); 
  double maxPractical = student['MaxPractical'].toDouble(); 
  return practical >= (0.4 * maxPractical);
  
}

bool isPassCa(Map<String, dynamic> student) {
  double ca = student['ca'].toDouble(); 
  double maxCa = student['maxCA'].toDouble(); 
  return ca >= (0.4 * maxCa);
}

Map<String, int> countPassFail(List<Map<String, dynamic>> data, String type){
  int passCount = 0;
  int failCount = 0;

  if(type == 'ca'){
    for(var mark in data){
      bool passCa = isPassCa(mark);
      passCa ? passCount++ : failCount++;
    }
  }else if(type == 'practical'){
    for(var mark in data){
      bool passPractical = isPassingPractical(mark);

      passPractical ? passCount++ : failCount++;
    }
  }else if(type == 'exam'){
    for(var mark in data){

    bool passExam = isPassingExam(mark);

    passExam ? passCount++ : failCount++;
  }
    }else if(type == 'total'){
      for(var mark in data){

      bool passExam = isPassingTotal(mark);

      passExam ? passCount++ : failCount++;
    }
  }

  return {'pass': passCount, 'fail': failCount};
}