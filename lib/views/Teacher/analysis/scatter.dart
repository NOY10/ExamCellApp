import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ScatterPlotChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final String category;

  ScatterPlotChart({
    required this.data,
    required this.category});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = data.asMap().entries
        .map((entry) => ChartData(
              x: entry.key + 1, // Extract 'ca' as double
              y: entry.value[category]?.toDouble() ?? 0.0, // You can set the Y-value as needed
            ))
        .toList();

        chartData.insert(0, ChartData(x:0,y:0));

    return Center(
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: SfCartesianChart(
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
