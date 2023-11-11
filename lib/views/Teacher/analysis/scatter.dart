import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ScatterPlotChart extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  final String category;

  ScatterPlotChart({
    required this.data,
    required this.category,
  });

  @override
  State<ScatterPlotChart> createState() => _ScatterPlotChartState();
}

class _ScatterPlotChartState extends State<ScatterPlotChart> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      borderColor: Colors.red,
      borderWidth: 5,
      color: Colors.lightBlue,
      builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
        if (pointIndex < widget.data.length) {
          final studentId = widget.data[pointIndex]['sid'];
          final ca = widget.data[pointIndex]['ca'];
          final exam = widget.data[pointIndex]['exam'];
          final practical = widget.data[pointIndex]['practical'];
          final total = ca+exam+practical;
          return Container(
            constraints: BoxConstraints(maxHeight: 70),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(studentId),
                if (widget.category == "ca") ...[
                  Text('CA: $ca'),
                ] else if (widget.category == "exam") ...[
                  Text('Exam: $exam'),
                ] else if (widget.category == "practical") ...[
                  Text('Practical: $practical'),
                ] else ...[
                  Text('Total: $total')
                ]
              ],
            ),
          );
        }
        return Container();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = widget.data.asMap().entries
        .map((entry) => ChartData(
              x: entry.key + 1,
              y: entry.value[widget.category]?.toDouble() ?? 0.0,
            ))
        .toList();

    chartData.insert(0, ChartData(x: 0, y: 0));

    return Center(
      child: Container(
        height: 320,
        width: MediaQuery.of(context).size.width,
        child: SfCartesianChart(
          tooltipBehavior: _tooltipBehavior,
          primaryXAxis: NumericAxis(
            title: AxisTitle(text: 'No. of Student'),
          ),
          primaryYAxis: NumericAxis(
            title: AxisTitle(text: 'Mark'),
          ),
          series: <ChartSeries>[
            ScatterSeries<ChartData, double>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  final double x;
  final double y;

  ChartData({
    required this.x,
    required this.y,
  });
}
