import 'dart:math';

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
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Map<String, dynamic> calculateStatistics(List<Map<String, dynamic>> data) {
    if (data.isEmpty) {
      return {
        'mean': 0.0,
        'max': 0,
        'min': 0,
      };
    }

    int sumTotal = 0;
    int maxTotal =
        data[0]['ca'] + data[0]['exam'] + data[0]['practical'];
    int minTotal =
        data[0]['ca'] + data[0]['exam'] + data[0]['practical'];

    for (var item in data) {
      int total = item['ca'] + item['exam'] + item['practical'];
      sumTotal += total;
      if (total > maxTotal) {
        maxTotal = total;
      }
      if (total < minTotal) {
        minTotal = total;
      }
    }

    int meanTotal = (sumTotal ~/ data.length).toInt();

    return {
      'mean': meanTotal,
      'max': maxTotal,
      'min': minTotal,
    };
  }

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width / 3;

    return Scaffold(
      appBar: AppBar(
        title: Text("Analysis"),
      ),
      body: FutureBuilder(
        future: fetch("RUB201204006", "CTE306"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
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
              List<String> category = ['ca', 'practical', 'exam'];

              return Container(
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
                              child: Text(
                                cat,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              )),
                          ),
                          ScatterPlotChart(data: data, category: cat,),
                        ],
                      ),
                    );
                  }),
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
